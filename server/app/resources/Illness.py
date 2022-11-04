from typing import Dict

from elastic import elastic_client
from flask_restful import Resource

from app.models.Illness import Illness as IllnessModel


class Illness(Resource):

  # TODO: Implement Elasticsearch to query Illness
  def get(self, qname: str) -> Dict:
    """Return Dictionary (json format) after querying by Elasticsearch

    Args:
        qname (str): the name of user want to search

    Returns:
        Dict: Json format
    """
    return IllnessModel(
        '_fake_name',
        '_fake_description',
        '_fake_symptoms'
        '_fake_threating',
        '_fake_preventing',
        False,
        '_fake_link'
    ).json()
