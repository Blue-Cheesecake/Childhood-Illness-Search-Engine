class ConnectionErrorException(Exception):

    def __init__(self, error_message: str) -> None:
        super().__init__(error_message)
