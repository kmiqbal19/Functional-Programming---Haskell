doubleSmallNumber' :: (Ord a, Num a) => a -> a
doubleSmallNumber' x = if x > 100 then x else x * 2 + 1

a :: Integer
a = 1

b :: [[Integer]]
b = [[6, 6, 6], [1, 2, 3, 4], [5, 3, 3, 3], [1, 2, 2, 3, 4], [1, 2, 3]]

c :: [Integer]
c = [x * 2 | x <- [1 .. 100], x <= 20]

d :: [Integer]
d = [x | x <- [1 .. 500], x `mod` 7 == 3]

length' :: (Num a) => [t] -> a
length' xs = sum [1 | _ <- xs]

productOfArrays' :: (Integral a) => [a] -> [a] -> [a]
productOfArrays' firstArr secondArr = [x * y | x <- firstArr, y <- secondArr, odd (x * y)]

evenOfLists :: (Integral a) => [[a]] -> [[a]]
evenOfLists xxs = [[x | x <- xs, even x, x > 4] | xs <- xxs]

take' :: (Ord t, Num t) => t -> [a] -> [a]
take' i _
  | i <= 0 = []
take' i [] = []
take' i (x : xs) = x : take' (i - 1) xs

zip' :: [a] -> [b] -> [(a, b)]
zip' _ [] = []
zip' [] _ = []
zip' (x : xs) (y : ys) = (x, y) : zip' xs ys

elem' :: (Eq t) => t -> [t] -> Bool
elem' a [] = False
elem' a (x : xs)
  | a == x = True
  | otherwise = a `elem'` xs

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x : xs) =
  let smallerSorted = quicksort [a | a <- xs, a <= x]
      biggerSorted = quicksort [a | a <- xs, a > x]
   in smallerSorted ++ [x] ++ biggerSorted



multThree :: Num a => a -> a -> a -> a
multThree x y z = x * y * z


applyTwice :: (t -> t) -> t -> t
applyTwice f x = f (f x)



zipWith' :: (t1 -> t2 -> a) -> [t1] -> [t2] -> [a]
zipWith' _ _ [] = []
zipWith' _ [] _ = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

map' :: (t -> a) -> [t] -> [a]
map' _ [] = []
map' f (x:xs) = f x : map' f xs




largestDivisible :: Integer
largestDivisible = head (filter p [100000,99999..])
    where p x = x `mod` 3829 == 0


numLongChains :: Int
numLongChains = length (filter (\xs -> length xs > 15) [[1,2,3], [1,23,4,7]])

x :: Integer
x = foldl (+) 0 [1,3,4]

y :: Integer
y = foldl (\acc y -> acc * y) 1 [1,2,3]
z :: [Integer]
z = map (+2) [1,2]
data Circle = Circle Float Float Float deriving (Show)
data Point = Point Float Float deriving (Show)
data Rectangle = Rectangle Point Point deriving (Show)

surface :: Circle -> Float

surface (Circle _ _ r) = pi * r ^ 2
perimeter :: Circle -> Float
perimeter (Circle _ _ r) = 2*pi*r
bambooPerimeter :: Circle -> Float
bambooPerimeter (Circle a b r) = a * b * r


surfaceOfRect :: Rectangle -> Float
surfaceOfRect ( Rectangle (Point x1 y1) (Point x2 y2)) = abs (x2-x1) * abs (y2-y1)

