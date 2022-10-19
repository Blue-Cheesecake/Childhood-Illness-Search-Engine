from typing import Dict


class Illness:
  """Illness Model

  """

  name: str
  symptoms: str
  treating: str
  preventing: str
  common: bool

  def __init__(self, name: str, symptoms: str, treating: str, preventing: str, common: bool) -> None:
    self.name = name
    self.symptoms = symptoms
    self.treating = treating
    self.preventing = preventing
    self.common = common

  def json(self) -> Dict:
    return {
        'name': self.name,
        'symptoms': self.symptoms,
        'treating': self.treating,
        'preventing': self.preventing,
        'common': self.common,
    }
