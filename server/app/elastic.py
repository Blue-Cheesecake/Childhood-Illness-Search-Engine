from dotenv import dotenv_values
from elasticsearch import Elasticsearch
from errors.authentication_exception import AuthenticationException
from errors.path_exception import PathException
from errors.connection_exception import ConnectionErrorException

config = dotenv_values("app/.env")

ELASTIC_PASSWORD = config.get('ELASTIC_PASSWORD', '-1')
CA_CERTS_PATH = config.get('CA_CERTS_PATH', '-2')
LOCAL_HOST = "https://localhost:9200"

# Raise Error if the config is not found
# or Variable haven't specified
if ELASTIC_PASSWORD == '-1':
    raise AuthenticationException(
        "Can't get Elastic Password. It might happen when you haven't initialized '.env' file on /app/.env. Or you haven't declared varialbe ELASTIC_PASSWORD on .env file."
    )
if CA_CERTS_PATH == '-2':
    raise PathException(
        "Can't get CA Certificate Path. It might happen when you haven't initialized '.env' file on /app/.env. Or you haven't declared varialbe CA_CERTS_PATH on .env file."
    )


# Create the client instance for indexing, or querying.
# This var will be exported
try:
    elastic_client = Elasticsearch(
        LOCAL_HOST,
        ca_certs=CA_CERTS_PATH,
        basic_auth=("elastic", ELASTIC_PASSWORD)
    )
    print("---- Successfully connected to Elastic server ----")
except ValueError:
    raise ConnectionErrorException(
        "Can't connect to Elastic Server. It might happen when Elastic server hasn't started yet or ELASTIC_PASSWORD and CA_CERTS_PATH are not correct on your local environment")
