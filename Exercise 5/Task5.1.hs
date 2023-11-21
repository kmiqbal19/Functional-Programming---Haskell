-- Task 5.1
ev :: [Integer]
ev = [x | x <- [0 ..], even x]

-- od :: [Integer]
-- od = [x | x <- [0..] ,  odd x]

-- Task 5.2

harmonic :: [Double]
harmonic = [1 / n | n <- [1..]]

-- Task 5.3

isPalindrome :: Integer -> Bool

isPalindrome n = let strN = show n in strN == reverse strN

palin :: [Integer]
palin = [x | x <- [0..], isPalindrome x]

-- Task 5.4
partsum :: Num a => [a] -> [a]
partsum xs = [foldr (+) 0 (take n xs) | n <- [1..]]
