import sys
from nltk.corpus import stopwords
from nltk.stem import WordNetLemmatizer
import contractions
from nltk.stem import PorterStemmer
from nltk.tokenize import word_tokenize
from typing import Dict, List

from elastic import elastic_client
from flask_restful import Resource

from models.IllnessesList import IllnessList as IllnessListModel
from models.Illness import Illness as IllnessModel


# Normalization
import pandas as pd
import nltk
nltk.download('punkt')
porter = PorterStemmer()
lemmatizer = WordNetLemmatizer()


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

    words = word_tokenize(qSymptoms)

    stop_words = set(stopwords.words('english'))
    word_n = []
    print(stop_words)
    for word in words:
      if word not in stop_words:
        print(word)
        word_n.append(word)
    words = word_n
    print(words)

    for i in range(len(words)):
      words[i] = words[i].lower()

    stop_words = set(stopwords.words('english'))
    print(stop_words)
    # word to be removed from query
    unnecessary_word = {'son', 'daughter', 'my', 'treat',
                        'treated', 'get', 'got', '\'ve', '\'s', 'pain'}
    stop_words.update(unnecessary_word)
    word_n = []
    # print(stop_words)
    for word in words:
      if word not in stop_words:
        # print(word)
        word_n.append(word)
    words = word_n
    print(words)

    for i in range(len(words)):
      words[i] = porter.stem(words[i])

    for i in range(len(words)):
      words[i] = lemmatizer.lemmatize(words[i], pos="a")

    for i in range(len(words)):
      words[i] = contractions.fix(words[i])

    qSymptoms_n = ''
    for word in words:
      qSymptoms_n = qSymptoms_n+' '+word
    qSymptoms_n = qSymptoms_n[1:]

    print(qSymptoms_n)

    data: List[IllnessModel] = []
    resp = elastic_client.search(index="test_s1",
                                 query={
                                     "match": {
                                         "symptoms_n":
                                         {
                                             "query": qSymptoms_n,
                                             "fuzziness": "auto",
                                             "max_expansions": 1,
                                             "fuzzy_transpositions": "true"
                                         },
                                     },
                                 },
                                 sort=[
                                     {"common_n": "desc"}
                                 ]
                                 )

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
