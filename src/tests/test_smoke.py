from server_py.app import message


def test_message() -> None:
    assert message() == "template ready"
