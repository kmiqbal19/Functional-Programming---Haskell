summation :: Integer -> Integer
summation n = if n <= 0 then 0 else n + summation(n -1)