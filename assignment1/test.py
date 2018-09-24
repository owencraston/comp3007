# content of conftest.py
import pytest
from comp3007_f18_101037159_a1_1 import upper, lower, capitalize, camelCase, wordToLowerCase, acrostic

def test_valid_upper():
    assert upper('o') == 'O'

def test_invalid_upper():
    assert upper('O') == 'O'

def test_valid_lower():
    assert lower('O') == 'o'

def test_invalid_lower():
    assert lower('o') == 'o'

def test_capitalize():
    assert capitalize('HeLlO') == 'Hello'

def test_wordToLower():
    assert wordToLowerCase("Hello") == "hello"


list = ["is", "tHis", "eXaMPLe", "SUFfIcIEntLY", "TELliNg"]

def test_camelCase():
    assert camelCase(list) == "isThisExampleSufficientlyTelling"

def test_acrostic():
    assert acrostic(camelCase(list)) == "TEST"
