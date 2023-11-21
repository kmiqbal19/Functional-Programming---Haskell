sort :: Ord a => [a] -> [a]
sort [] = []
sort (x:xs) = sort [y | y <- xs, y <= x] ++ [x] ++ sort [y | y <- xs, y > x]

data ListInt = ListInt [Int] Int

instance Eq ListInt where
    (==) :: ListInt -> ListInt -> Bool
    (ListInt xs1 _) == (ListInt xs2 _) = xs1 == xs2

instance Ord ListInt where
    compare :: ListInt -> ListInt -> Ordering
    compare (ListInt xs1 n1) (ListInt xs2 n2)
        | n1 < n2   = LT
        | n1 > n2   = GT
        | otherwise = compare xs1 xs2
