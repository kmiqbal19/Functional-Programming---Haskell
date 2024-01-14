
-- (f - 32) * (5/9)

fahrenheitToCelcius :: Fractional a => a -> a
fahrenheitToCelcius f = let firstArg = f - 32
                            secondArg = (5/9)
                            in firstArg * secondArg



fahrenheitToCelcius' :: Fractional a => a -> a
fahrenheitToCelcius' f = firstArg * secondArg
                        where firstArg = f - 32
                              secondArg = 5 / 9


arr :: [Char]
arr = ['5', '6']
arr2 :: [Char]
arr2 ='2' : arr

polymorphicArr :: (a, b) -> a
polymorphicArr (x, y) = x