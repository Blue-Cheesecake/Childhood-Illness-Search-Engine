from flask import Flask
from flask_restful import Api
from util.normalization import getNormalizedData

from resources.Illness import Illness
from resources.IllnessList import IllnessList

app = Flask(__name__)
api = Api(app)


@app.before_first_request
def digest_data_to_elastic() -> None:
  """Digest Data to Elastic before starting requesting
  """
  # TODO: Implement digesting data

  data_doc = getNormalizedData()

  return


# Add Resouces and Routes
api.add_resource(Illness, '/illness/<string:qname>')
api.add_resource(IllnessList, '/illnessList/<string:qSymptoms>')

if __name__ == "__main__":
  app.run(debug=True)
