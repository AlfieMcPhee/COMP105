-- Question 1
-- (a)
square_and_cube x = (x*x, x*x*x)
-- (b)
add_tuple (a,b) = a + b
-- (c)
first (a, _) = a
second (_,b) = b
--(d)
swap (a,b) = (b,a)
--(e)
two_to_three (a,b) c = (a,b,c)

-- Question 2
--(a)
head_squared list = head list * head list
--(b)
third list = list  !! 2
--(c)
second_tail list = tail (tail list)
--(d)
third_head list = head (tail (tail list))
--(e)
first_plus_last list = head list + last list
--(f)
prepend_two list a b = a : b : list

-- Question 3, List Functions

--(a)
two_lengths list1 list2 = length list1 + length list2
--(b)
make_palindrome list = list ++ reverse list
--(c)
sum_and_product list = (sum list, product list)
--d
four_through_six list = take 3 (drop 3 list)
--(e)
both_in list x y = if elem x list then (if elem y list then True else False) else False

-- Question 4
--(a)
--[101..200]
--(b)
--[1000,1002...1050]
--(c)
--[20,19..1]
--(d)
--[999,1002..] 

-- Question 5
-- (a)
--(b)
only_odds list = [x | x <- list, x `mod` 2 == 1]
between a b list = [x | x <- list, x > a, x < b]
-- (c)
number_of_es string = length [ x | x <- string, x == 'e']
--(d)
proper_fizzbuzz = 
            let fizzbuzz i
                  | i `mod` 15 == 0 = "fizzbuzz"
                  | i `mod` 3 == 0 = "fizz"
                  | i `mod` 5 == 0 = "buzz"
                  | otherwise = show i
            in [fizzbuzz i | i <- [1..]]
