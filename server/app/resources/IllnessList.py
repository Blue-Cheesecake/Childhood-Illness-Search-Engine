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

    def get(self, query_symptom: str) -> dict[str, object]:
        """Get list of symptoms based on symptoms query. Elastic will rank and query.

        Args:
            query_symptom (str): The text that user put in to search potential symptoms

        Returns:
            dict[str, object]: Json Format (Dictionary)
        """

        words = word_tokenize(query_symptom)

        stop_words = set(stopwords.words('english'))
        word_n = []
        # print(stop_words)
        for word in words:
            if word not in stop_words:
                # print(word)
                word_n.append(word)
        words = word_n
        # print(words)

        for i in range(len(words)):
            words[i] = words[i].lower()

        stop_words = set(stopwords.words('english'))
        # print(stop_words)
        # word to be removed from query
        unnecessary_word = {'son', 'daughter', 'my', 'treat', 'treated', 'get', 'got',
                            '\'ve', '\'s', 'syndrome', 'body', 'baby', 'children', 'pain', 'feel', 'like'}
        stop_words.update(unnecessary_word)
        word_n = []
        # print(stop_words)
        for word in words:
            if word not in stop_words:
                # print(word)
                word_n.append(word)
        words = word_n
        # print(words)

        # for i in range(len(words)):
        #   words[i] = porter.stem(words[i])

        # for i in range(len(words)):
        #   words[i] = lemmatizer.lemmatize(words[i], pos="a")

        for i in range(len(words)):
            words[i] = contractions.fix(words[i])

        query_symptoms_n = ''
        for word in words:
            query_symptoms_n = query_symptoms_n+' '+word
        query_symptoms_n = query_symptoms_n[1:]

        print(query_symptoms_n)
        data: List[IllnessModel] = []
        resp = elastic_client.search(index="test_s1",
                                     query={
                                         "bool": {
                                             "should": [
                                                 {
                                                     "multi_match": {
                                                         "query": query_symptoms_n,
                                                         # Finds documents which match any field and combines the _score from each field
                                                         "type":  "most_fields",
                                                         "fields": ["symptoms_n", "description"]
                                                     }
                                                 }
                                             ]
                                         }
                                     }
                                     )

        for hit in resp['hits']['hits']:
            source = hit["_source"]
            illness_model = IllnessModel(
                name=source['name'],
                description=source['description'],
                symptoms=source['symptoms'],
                treating=source['treating'],
                preventing=source['causes/preventing'],
                common=source['common state'],
                link=source['link']
            )
            data.append(illness_model)

        return IllnessListModel(illness_array=data).json()
