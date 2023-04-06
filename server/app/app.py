from flask import Flask
from flask_restful import Api
from util.normalization import getNormalizedData
from elastic import elastic_client
from resources.IllnessList import IllnessList

app = Flask(__name__)
api = Api(app)


@app.before_first_request
def digest_data_to_elastic() -> None:
    """Digest Data to Elastic before starting requesting
    """
    # clear data on index
    elastic_client.options(
        ignore_status=[400, 404]).indices.delete(index='test_s1')
    data_doc = getNormalizedData()
    # print(data_doc)
    for i in range(len(data_doc)):

        try:
            elastic_client.index(index="test_s1", id=i +
                                 1, document=data_doc[i])
        except ValueError:
            print(f"Data doc at {i} can't be imported ")


# Add Resouces and Routes
api.add_resource(IllnessList, '/illnessList/<string:qSymptoms>')

if __name__ == "__main__":
    app.run(debug=False)
