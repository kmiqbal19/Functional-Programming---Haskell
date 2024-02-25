import Data.List (intercalate)
-- doubleSmallNumber' :: (Ord a, Num a) => a -> a
-- doubleSmallNumber' x = if x > 100 then x else x * 2 + 1

-- a :: Integer
-- a = 1

-- b :: [[Integer]]
-- b = [[6, 6, 6], [1, 2, 3, 4], [5, 3, 3, 3], [1, 2, 2, 3, 4], [1, 2, 3]]

-- c :: [Integer]
-- c = [x * 2 | x <- [1 .. 100], x <= 20]

-- d :: [Integer]
-- d = [x | x <- [1 .. 500], x `mod` 7 == 3]

-- length' :: (Num a) => [t] -> a
-- length' xs = sum [1 | _ <- xs]

-- productOfArrays' :: (Integral a) => [a] -> [a] -> [a]
-- productOfArrays' firstArr secondArr = [x * y | x <- firstArr, y <- secondArr, odd (x * y)]

-- evenOfLists :: (Integral a) => [[a]] -> [[a]]
-- evenOfLists xxs = [[x | x <- xs, even x, x > 4] | xs <- xxs]

-- take' :: (Ord t, Num t) => t -> [a] -> [a]
-- take' i _
--   | i <= 0 = []
-- take' i [] = []
-- take' i (x : xs) = x : take' (i - 1) xs

-- zip' :: [a] -> [b] -> [(a, b)]
-- zip' _ [] = []
-- zip' [] _ = []
-- zip' (x : xs) (y : ys) = (x, y) : zip' xs ys

-- elem' :: (Eq t) => t -> [t] -> Bool
-- elem' a [] = False
-- elem' a (x : xs)
--   | a == x = True
--   | otherwise = a `elem'` xs

-- quicksort :: (Ord a) => [a] -> [a]
-- quicksort [] = []
-- quicksort (x : xs) =
--   let smallerSorted = quicksort [a | a <- xs, a <= x]
--       biggerSorted = quicksort [a | a <- xs, a > x]
--    in smallerSorted ++ [x] ++ biggerSorted



-- multThree :: Num a => a -> a -> a -> a
-- multThree x y z = x * y * z


-- applyTwice :: (t -> t) -> t -> t
-- applyTwice f x = f (f x)



-- zipWith' :: (t1 -> t2 -> a) -> [t1] -> [t2] -> [a]
-- zipWith' _ _ [] = []
-- zipWith' _ [] _ = []
-- zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

-- map' :: (t -> a) -> [t] -> [a]
-- map' _ [] = []
-- map' f (x:xs) = f x : map' f xs




-- largestDivisible :: Integer
-- largestDivisible = head (filter p [100000,99999..])
--     where p x = x `mod` 3829 == 0


-- numLongChains :: Int
-- numLongChains = length (filter (\xs -> length xs > 15) [[1,2,3], [1,23,4,7]])

-- x :: Integer
-- x = foldl (+) 0 [1,3,4]

-- y :: Integer
-- y = foldl (\acc y -> acc * y) 1 [1,2,3]
-- z :: [Integer]
-- z = map (+2) [1,2]
-- data Circle = Circle Float Float Float deriving (Show)
-- data Point = Point Float Float deriving (Show)
-- data Rectangle = Rectangle Point Point deriving (Show)

-- surface :: Circle -> Float

-- surface (Circle _ _ r) = pi * r ^ 2
-- perimeter :: Circle -> Float
-- perimeter (Circle _ _ r) = 2*pi*r
-- bambooPerimeter :: Circle -> Float
-- bambooPerimeter (Circle a b r) = a * b * r


-- surfaceOfRect :: Rectangle -> Float
-- surfaceOfRect ( Rectangle (Point x1 y1) (Point x2 y2)) = abs (x2-x1) * abs (y2-y1)

-- data Person = Person {
--   firstName :: String,
--   lastName:: String,
--   age:: Int
-- } deriving (Show)

-- sum' :: (Ord t, Num t) => t -> t
-- sum' n = if n <= 0 then 0 else n + sum'(n - 1)


-- digit :: Integer -> Integer
-- digit x = if x == 0 then 0 else x `mod` 10 + digit((x `div` 10))
-- digit' :: Integer -> Integer
-- digit' x
--   | x < 0     = -digit (-x)
--   | x == 0    = 0
--   | otherwise = x `mod` 10 + digit (x `div` 10)


-- isPrefixOf :: String -> String -> Bool

-- isPrefixOf "" _ = True
-- isPrefixOf _ "" = False
-- isPrefixOf (x:xs) (y:ys) = x == y && isPrefixOf xs ys


-- isPrefixOfAlt s t
--   | s == "" = True
--   | t == "" = False
--   | head s == head t = isPrefixOfAlt (tail s) (tail t)
--   | otherwise = False


-- asPrefixOf ::String -> String -> String

-- asPrefixOf p s
--   | p `isPrefixOf` s  = s
--   | otherwise = longestNonDuplicatedPrefix p s ++ s

-- -- Helper func to find the longest non-duplicated prefix
-- longestNonDuplicatedPrefix :: String -> String -> String
-- longestNonDuplicatedPrefix "" _ = ""
-- longestNonDuplicatedPrefix p s
--   | p `isPrefixOf` s = ""
--   | otherwise = longestNonDuplicatedPrefix (init p) s ++ [last p]


-- -- Assuming Jeton type is already defined
-- data Jeton = Red | Green | Blue | Silver | Gold deriving (Show, Enum)

-- -- Recursive type for a collection of Jetons
-- data Jetons = Empty | Pair Jeton Jetons deriving (Show)
-- -- "Pair Red (Pair Blue (Pair Green (Pair Silver (Pair Gold Empty))))"


-- count :: Jetons -> Int
-- count Empty      = 0
-- count (Pair _ jc) = 1 + count jc

-- -- Function to calculate the total value of a jeton collection
-- payoff :: Jetons -> Int
-- payoff Empty      = 0
-- payoff (Pair j jc) = value j + payoff jc


-- main :: IO ()
-- main = do
--   print $ sum' 10
--   print $ sum' 5
--   print $ sum' 0
--   print $ isPrefixOf "Foo" "Football"
--   print $ isPrefixOf "boo" "Football"



data Jeton = Red | Green | Blue | Silver | Gold deriving (Show, Enum)

data Jetons = Empty | Pair Jeton Jetons deriving (Show)

-- Function to return a jeton's value
value :: Jeton -> Int
value Red    = 1
value Green  = 5
value Blue   = 10
value Silver = 50
value Gold   = 100


count :: Jetons -> Int
count Empty = 0
count (Pair _ jc) = 1 + count jc

payoff :: Jetons -> Int
payoff Empty  = 0
payoff (Pair j jc) = value j + payoff jc
-- Ex: (Pair Red (Pair Gold (Pair Silver Empty)))

data Format = Flushleft | Flushright deriving (Show)

-- align :: Format -> Int -> String -> String
-- align fmt width text = unlines $ alignLines fmt width $ words text

-- alignLines :: Format -> Int -> [String] -> [String]
-- alignLines _ _ [] = []
-- alignLines fmt width ws = line : alignLines fmt width remainingWords
--   where
--     (line, remainingWords) = createLine fmt width ws

-- createLine :: Format -> Int -> [String] -> (String, [String])
-- createLine fmt width ws = go width ws
--   where
--     go _ [] = ("", [])
--     go w (x:xs)
--       | length x > w = if null line then (x, xs) else (line, x:xs)
--       | otherwise    = go (w - length x - 1) xs
--       where
--         line = if null x then "" else x ++ padding
--         padding = if null xs then "" else " "

-- formatLine :: Format -> Int -> String -> String
-- formatLine Flushleft _ line = line
-- formatLine Flushright width line = replicate (width - length line) ' ' ++ line



align :: Format -> Int -> String -> String
align fmt width text = intercalate "\n" $ formatLines fmt width (words text)

formatLines :: Format -> Int -> [String] -> [String]
formatLines _ _ [] = []
formatLines fmt width (w:ws)
  | length w > width = w : formatLines fmt width ws
  | otherwise = case formatLines fmt width ws of
      [] -> [w]
      (x:xs) -> if length w + 1 + length x <= width
                then (w ++ " " ++ x) : xs
                else w : x : xs

alignLeft :: Int -> [String] -> [String]
alignLeft width = formatLines Flushleft width

alignRight :: Int -> [String] -> [String]
alignRight width ws = map (rightPad width) (formatLines Flushleft width ws)

rightPad :: Int -> String -> String
rightPad width s = replicate (width - length s) ' ' ++ s
