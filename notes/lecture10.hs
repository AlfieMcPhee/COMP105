-- Cracking the Caesar Cipher

-- We Will Build 3 Functions
-- One to encode, one to decode, one to crack the strings

-- Data.Char has useful functions for working with characters as a package
--ord takes a character and turns it into an integer
--chr does the opposite

-- The following functions convert lower case characters to numbers between 0 and 25

import Data.Char

char2int c = ord c - ord 'a'
int2char i = chr (i + ord 'a')

-- We are minusing or adding so that our values returned from this program fall within 0-25 rather
-- than the ascii values
