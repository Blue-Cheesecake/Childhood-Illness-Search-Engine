from .Illness import Illness


class IllnessList:
    """IllnessList Model"""

    illness_array: list[Illness]

    def __init__(self, illness_array: list[Illness] = None) -> None:
        if illness_array is None:
            illness_array = list()
        self.illness_array = illness_array

    def add_illness(self, illness: Illness):
        self.illness_array.append(illness)

    def json(self) -> dict[str, object]:
        return {
            'illness_list': list(map(lambda x: x.json(), self.illness_array))
        }
