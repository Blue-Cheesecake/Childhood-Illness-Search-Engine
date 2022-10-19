from flask import Flask
from flask_restful import Api

from app.resources.Illness import Illness

app = Flask(__name__)
api = Api(app)


api.add_resource(Illness, '/illness/<string:qname>')

if __name__ == "__main__":
  app.run(debug=True)
