from flask import Flask
from flask_restful import Api

app = Flask(__name__)
api = Api(app)


class Test(object):

  @app.route("/")
  def testApi():
    return {"hello": 'world'}


if __name__ == "__main__":
  app.run(debug=True)
