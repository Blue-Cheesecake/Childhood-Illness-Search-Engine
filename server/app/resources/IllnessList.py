from typing import Dict

from elastic import elastic_client
from flask_restful import Resource

from models.IllnessesList import IllnessList as IllnessListModel


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

    data = []

    return IllnessListModel(illnessArray=data).json()
