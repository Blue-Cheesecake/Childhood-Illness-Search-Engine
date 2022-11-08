from typing import Dict, List

from .Illness import Illness


class IllnessList:
  """IllnessList Model"""

  illnessArray: List[Illness]

  def __init__(self, illnessArray: List[Illness] = []) -> None:
    self.illnessArray = illnessArray

  def addIllness(self, illness: Illness):
    self.illnessArray.append(illness)

  def json(self) -> Dict:
    return {
        'illness_list': list(map(lambda x: x.json(), self.illnessArray))
    }
