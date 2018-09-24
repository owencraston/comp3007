#!/usr/bin/env python3

# John Owen Craston
# 101037159

def upper(s):
    # check if the char is aa lowercase value
    if ord(s) >= 97 and ord(s) <= 122:
        return chr(ord(s) - 32)
    else:
        return s

def lower(s):
    # check if the char is aa lowercase value
    if ord(s) >= 65 and ord(s) <= 90:
        return chr(ord(s) + 32)
    else:
        return s

def capitalize(s):
    # base case
    if s == '':
        return ''
    elif len(s) == 1:
        return upper(s[0])
    else:
        return capitalize(s[:-1]) + lower(s[-1])

# helper function to turn a word into lowercase
def wordToLowerCase(s):
    if s == '':
        return ''
    else:   
        if ord(s[0]) >= 65 and ord(s[0]) <= 90:
            return lower(s[0]) + wordToLowerCase(s[1:])      
        elif ord(s[0]) >= 97 and ord(s[0]) <= 122:
            return s[0] + wordToLowerCase(s[1:])


# return the string in camel case
def camelCase(list):
    # base case
    if len(list) == 1:
        return wordToLowerCase(list[0])
    else:
        return camelCase(list[:-1]) + capitalize(list[len(list)-1])


def acrostic(s):
	word = ''
	if s == '':
		return ''
	else:
		word += acrostic(s[1:])
		if ord(s[0]) >= 65 and ord(s[0]) <= 90:
			return s[0] + word
		else:
			return word

def interface():
    done = False
    while not done:
        list = input("enter a sentance in mixed case: ")
        list = list.split()
        print("here is your list of words: ",list)
        cc = camelCase(list)
        print("camel case: \n", cc)
        ca = acrostic(cc)
        print("camel case acrostic: \n", ca)
        print("do you want to create another camel case acrostic. Type y to continue and anything else to stop")
        choice = input("y or n?: ")
        if choice != "y":
            print("Thank you for using my program! see you next time")
            done = True

interface()
