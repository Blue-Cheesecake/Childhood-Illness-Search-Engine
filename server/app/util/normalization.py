from typing import Dict
import os

import pandas as pd
import nltk
nltk.download('punkt')

from nltk.tokenize import word_tokenize

from nltk.stem import PorterStemmer
# from nltk.stem import LancasterStemmer
porter = PorterStemmer()
# lancaster=LancasterStemmer()

from nltk.stem import WordNetLemmatizer
lemmatizer = WordNetLemmatizer()

import sys  
!{sys.executable} -m pip install contractions
import contractions



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

    FILE_PATH = f"{DATA_DIR_PATH}/{csvFile}"

    pf = pd.read_csv(FILE_PATH)

    #normalization
    normalize = []
    for i in range(18):
        s = pf["symptoms"][i]
        word = word_tokenize(s)
        normalize.append(word)
    pf['symptoms_n'] = normalize

    #stemming
    stem = []
    for sym in pf["symptoms_n"]:
        st = []
        for s in sym:
            s = porter.stem(s)
            st.append(s)
        sym = st
        stem.append(sym)
    pf['symptoms_n'] = stem

    #Lemmatizing
    lem = []
    for sym in df["symptoms_n"]:
        st = []
        for s in sym:
            s = lemmatizer.lemmatize(s, pos ="a")
            st.append(s)
        sym = st
        lem.append(sym)

    #remove puntuation
    for sym in pf['symptoms_n']:
      for word in sym:
          if word.isalnum() == False:
              sym.remove(word)
    
    #Substitution of Contraction
    for sym in pf['symptoms_n']:
      expanded_words = []
      for word in sym:
          expanded_words.append(contractions.fix(word))
      sym = expanded_words

    pf_dict = pf.to_dict('index')

  # return {'final': 'dictionary'}
  return pf_dict
