digit :: Integer -> Integer
digit x
    | x == 0 = 0  -- Base case: the digit sum of 0 is 0.
    | x > 0 = (x `mod` 10) + digit (x `div` 10)  -- Positive integer case
    | x < 0 = -(digit (-x))  -- Handle negative integers by negating the digit sum of their absolute value

