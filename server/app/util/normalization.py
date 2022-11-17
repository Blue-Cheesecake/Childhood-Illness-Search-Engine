import sys
import contractions
# from nltk.stem import LancasterStemmer
from nltk.stem import WordNetLemmatizer
from nltk.stem import PorterStemmer
from nltk.tokenize import word_tokenize
from nltk.corpus import stopwords
from typing import Dict
import os

import pandas as pd
import nltk
import ssl

try:
  _create_unverified_https_context = ssl._create_unverified_context
except AttributeError:
  pass
else:
  ssl._create_default_https_context = _create_unverified_https_context


nltk.download('punkt')
nltk.download('wordnet')
nltk.download('omw-1.4')

porter = PorterStemmer()

# lancaster=LancasterStemmer()
lemmatizer = WordNetLemmatizer()


# There will be many csv file in data dir
# The FILE_PATH will be folder path. Not only one csv file
DATA_DIR_PATH = 'app/data'


def getNormalizedData() -> Dict:
  """Prepare Dictionary data from csv file 

  Returns:
      Dict: Data that's ready to be digested in Elastic
  """
  # TODO: Implements import, and normalization data
  files = os.listdir(DATA_DIR_PATH)

  if files == None:
    raise Exception("Something is wrong. Files is null")
  if len(files) == 0:
    raise Exception("There is no file in data folder")

  numsFiles = len(files)

  for csvFile in files:

    if csvFile == '.DS_Store':
      continue

    FILE_PATH = f"{DATA_DIR_PATH}/{csvFile}"

    pf = pd.read_csv(FILE_PATH, encoding="ISO-8859-1")

    # print(pf["common state"])
    pf['common_n'] = pf['common state']
    pf['common_n'] = pf['common_n'].replace(True,1)
    pf['common_n'] = pf['common_n'].replace(False,0)

    # print(pf["common"])
    # normalization
    normalize = []
    for i in range(len(pf.index)):
      s = pf["symptoms"][i]
      word = word_tokenize(s)
      normalize.append(word)

    pf['symptoms_n'] = normalize
    # print(pf["name"])

    # remove puntuation and stop word
    stop_words = set(stopwords.words('english'))
    print(stop_words)
    for sym in pf['symptoms_n']:
      for word in sym:
        if word.isalnum() == False or word in stop_words:
          sym.remove(word)

    # stemming
    stem = []
    for sym in pf["symptoms_n"]:
      st = []
      for s in sym:
        s = porter.stem(s)
        st.append(s)
      sym = st
      stem.append(sym)
    pf['symptoms_n'] = stem

    # Lemmatizing
    lem = []
    for sym in pf["symptoms_n"]:
      st = []
      for s in sym:
        s = lemmatizer.lemmatize(s, pos="a")
        st.append(s)
      sym = st
      lem.append(sym)
    
    # Substitution of Contraction
    for sym in pf['symptoms_n']:
      expanded_words = []
      for word in sym:
        expanded_words.append(contractions.fix(word))
      sym = expanded_words

    # pf['common state'] = pf['common state'].replace(True,1)
    pf_dict = pf.to_dict('index')
    print(pf)


  # return {'final': 'dictionary'}
  return pf_dict
