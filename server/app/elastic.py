from dotenv import dotenv_values
from elasticsearch import Elasticsearch

config = dotenv_values("app/.env")

ELASTIC_PASSWORD = config.get('ELASTIC_PASSWORD', '-1')
CA_CERTS_PATH = config.get('CA_CERTS_PATH', '-2')
LOCAL_HOST = "https://localhost:9200"

# Raise Error if the config is not found
# or Variable haven't specified
if ELASTIC_PASSWORD == '-1':
  raise Exception("Can't get Elastic Password. It might happen when you haven't initialized '.env' file on /app/.env. Or you haven't declared varialbe ELASTIC_PASSWORD on .env file.")
if CA_CERTS_PATH == '-2':
  raise Exception("Can't get CA Certificate Path. It might happen when you haven't initialized '.env' file on /app/.env. Or you haven't declared varialbe CA_CERTS_PATH on .env file.")


# Create the client instance for indexing, or querying.
# This var will be exported
try:
  elastic_client = Elasticsearch(
      LOCAL_HOST,
      ca_certs=CA_CERTS_PATH,
      basic_auth=("elastic", ELASTIC_PASSWORD)
  )
except:
  raise Exception(
      "Can't connect to Elastic Server. Please make sure ELASTIC_PASSWORD and CA_CERTS_PATH are corrent on your local environment")
