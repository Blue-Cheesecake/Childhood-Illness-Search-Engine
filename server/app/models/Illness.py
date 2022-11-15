from typing import Dict


class Illness:
  """Illness Model

  """

  name: str
  description: str
  symptoms: str
  treating: str
  preventing: str
  common: bool
  link: str

  def __init__(self, name: str, description: str, symptoms: str, treating: str, preventing: str, common: bool, link: str) -> None:
    self.name = name
    self.description = description
    self.symptoms = symptoms
    self.treating = treating
    self.preventing = preventing
    self.common = common
    self.link = link

  def json(self) -> Dict:
    # return {
    #     'name': self.name,
    #     'description': self.description,
    #     'symptoms': self.symptoms,
    #     'treating': self.treating,
    #     'preventing': self.preventing,
    #     'common': self.common,
    #     'link': self.link
    # }
    return {
      'name': self.name,
      'symptoms': self.symptoms,
    }
