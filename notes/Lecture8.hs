-- Recursive List Example

sum` [] = 0
sum` (x:xs) = x + sum` xs
-- This program adds all of the numbers in a list
-- For example [1,2,3] = 6 in this case

-- Length of a list
length` [] = 0
length` (_:xs) = 1 + length` xs
-- This program gives the length of a list

-- We can also build lists with recursion
down_from 0 = []
down_from x = x : down_from (x-1)
--down_from 5 would produce
--[5,4,3,2,1]

-- Transforming Lists
square_list [] = []
square_list (x:xs) = x*x : square_list xs

-- More complex methods of recursion

take` 0 list = []
take` n [] = []
take` n (x:xs) = x : take` (n-1) xs
-- Our version of take, which is a prelude function

-- Our version of drop which is a prelude function
drop` 0 list = list
drop` n [] = []
drop` n (x:xs) = drop` (n-1) xs
