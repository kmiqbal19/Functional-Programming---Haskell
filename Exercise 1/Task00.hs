import Prelude
fac :: (Ord t, Num t) => t -> t
fac n = if n <= 0 then 1 else n * fac(n-1);

sum' :: (Ord t, Num t) => t -> t
sum' n = if n <= 0 then 0 else n + sum'(n -1)




main :: IO ()
main = do
  print $ sum' 10
  print $ sum' 5
  print $ sum' 0
