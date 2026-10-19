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

{- The algorithm will do all 26 shifts, for each one compute the distribution,
 - Use the shift with the lowest chi squared score to decode the string-}


-- Counting Frequencies in Strings

count _ [] = 0
count c (x:xs)
    | c == x = 1 + rest
    | otherwise = rest
    where rest = count c xs

freq c list = fromIntegral (count c list) /
              fromIntegral (length list)

--fromIntegral turns integer into a float


-- Getting the table of frequencies for a string

get_freqs _ 26 = []
get_freqs string c = freq (int2char c) string
                        : get_freqs string (c + 1)


-- get_freqs returns a table with exactly 26 elements, one for each letter

-- Implementing the chi-squared score

chi_squared [] [] = 0
chi_squared (x:xs) (y:ys) =
    (x-y)^2 /y + chi_squared xs ys 

-- Table of English Frequencies
 eng_freqs =
    [8.167, 1.492, 2.782, 4.253, 12.702,
     2.228, 2.015, 6.094, 6.966, 0.153,
     0.772, 4.025, 2.406, 6.749, 7.507,
     1.929, 0.095, 5.987, 6.327, 9.056,
     2.758, 0.978, 2.360, 0.150, 1.974, 0.074]


 -- Getting the chi-squared score for a string
 
 chi_squared_string string =
     let
         string_freqs = get_freqs string 0
     in 
        chi_squared string_freqs eng_freqs

-- Getting the list of chi_squared scores for a string

chi_squared_list _ 26 = []
chi_squared_list string i =
  let
      decoded = caesar_dec string i
      score = chi_squared_string decoded
  in
    (score, decoded) : chi_squared_list string (i+1)

-- Finding offset with lowest score
get_best [(score, string)] = (score, string)
get_best ((score, string):xs) =
let
(tail_score, tail_string) = get_best xs
in
if score < tail_score
then (score, string)
else (tail_score, tail_string)

-- Tying it all Together
caesar_crack string =
let
scores = chi_squared_list string 0
(score, best) = get_best scores
in
best
