class PathException(Exception):

    def __init__(self, error_massage: str) -> None:
        super().__init__(error_massage)
