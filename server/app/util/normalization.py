from typing import Dict
import pandas as pd
import os

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

  return {'final': 'dictionary'}
