from flask import Flask
from flask_restful import Api
from util.normalization import get_normalized_data
from elastic import elastic_client
from resources.IllnessList import IllnessList
from time import sleep

app = Flask(__name__)
api = Api(app)


@app.before_first_request
def digest_data_to_elastic() -> None:
    """Digest Data to Elastic before starting requesting
    """
    # clear data on index
    elastic_client.options(
        ignore_status=[400, 404]).indices.delete(index='test_s1')
    data_doc = get_normalized_data()
    # print(data_doc)
    for i in range(len(data_doc)):
        try:
            elastic_client.index(
                index="test_s1",
                id=i + 1,
                document=data_doc[i])
        except ValueError:
            print(f"Data doc at {i} can't be imported ")

    # Add a delay so that Elasticsearch have enough time to index data
    sleep(5)


# Add Resouces and Routes
api.add_resource(IllnessList, '/illnessList/<string:query_symptom>')

if __name__ == "__main__":
    app.run(debug=False)
