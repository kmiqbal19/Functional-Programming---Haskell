fac :: (Ord t, Num t) => t -> t
fac n = if n <= 0 then 1 else n * fac(n-1);

