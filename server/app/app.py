from flask import Flask
from flask_restful import Api

from app.resources.Illness import Illness
from app.resources.IllnessList import IllnessList

app = Flask(__name__)
api = Api(app)


# Digest Data to Elasticsearch before start requesting
@app.before_first_request
def digest_data_to_elastic() -> None:
  # TODO: Implement digesting data
  pass


api.add_resource(Illness, '/illness/<string:qname>')
api.add_resource(IllnessList, 'illnessList/<string:qSymptoms>')

if __name__ == "__main__":
  app.run(debug=True)
