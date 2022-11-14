from typing import Dict, List

from elastic import elastic_client
from flask_restful import Resource

from models.IllnessesList import IllnessList as IllnessListModel
from models.Illness import Illness as IllnessModel


class IllnessList(Resource):
  """IllnessList Resource"""

  # TODO: Implement get IllnessList by Elasticsearch
  def get(self, qSymptoms: str) -> Dict:
    """Get list of symptoms based on symptoms query. Elastic will rank and query.

    Args:
        qSymptoms (str): The text that user put in to search potential symptoms

    Returns:
        Dict: Json Format (Dictionary)
    """

    data: List[IllnessModel] = []
    resp = elastic_client.search(index="test_s1", query={
    "term": {
      "symptoms": qSymptoms
    }
  })
    for hit in resp['hits']['hits']:
      source = hit["_source"]
      illnessModel = IllnessModel(
        name=source['name'],
        description=source['description'],
        symptoms=source['symptoms'],
        treating=source['treating'],
        preventing=source['causes/preventing'],
        common=source['common state'],
        link=source['link']
      )
      data.append(illnessModel)
    

    return IllnessListModel(illnessArray=data).json()
