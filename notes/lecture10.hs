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

-- Doing a Caesar Shift

shift c offset =
    let 
        converted = char2int c
    in
       int2char ((converted + offset) `mod` 26)

-- This converts the char into an integer, shifts it then returns it back to a char

-- What if there is a non lower case leter?

-- Encoding A String

caesar_enc [] _ = []
caesar_enc (x:xs) offset = shift x offset
                            : caesar_enc xs offset

-- Decoding A String

caesar_dec (x:xs) offset = shift x (-offset)
                          : caesar_dec xs offset

-- Algorithm that decodes our text with a particular offset, then compare the letter frequencies for the decoded text
-- Then check if these frequencies are close to the frequencies in english
--
-- -- For this we use the Chi-Squared Score:
-- The score will be lower when the frequency is close to English
