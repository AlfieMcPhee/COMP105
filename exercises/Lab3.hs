-- Question 1
mult13 0 = 0
mult13 n = 13 + mult13 (n-1)

pow3 n 
  | n == 0 = 1
  | otherwise = 3 * pow3(n-1)

odd_sum n
  | (n <= 0) = 0
  | (n `mod` 2 == 0) = odd_sum(n-1)
  | otherwise        = n + odd_sum(n-1)

lucas n
  | (n == 0) = 2
  | (n == 1) = 1
  | otherwise = lucas (n-1) + lucas(n-2)

-- Question 2

half_sum [] = 0
half_sum (x:xs)
  | x > 0 = x / 2 + half_sum xs
  | otherwise = x + half_sum xs

drop_evens [] = []
drop_evens (x:xs)
  | x <= 0 = drop_evens xs
  | x `mod` 2 == 0 = drop_evens xs
  | otherwise = x : drop_evens xs
