-- This is a function to split a list at given index
splitL :: Int -> [a] -> [[a]]

splitL i xs
  | i < 0 = error "Index must be non-negative"
  | i >= length xs = [xs]
  | otherwise = [take i xs, drop i xs]


mSplitL :: [Int] -> [a] -> [[a]]
mSplitL = go
  where
    go [] ys = [ys]
    go (i:is) ys = case splitL i ys of
      [ys1, ys2] -> ys1 : go is ys2
      _ -> error "Invalid index in mSplitL"


