isPrefixOf :: String -> String -> Bool
isPrefixOf "" _ = True           -- An empty string is always a prefix.
isPrefixOf _ "" = False          -- A non-empty string cannot be a prefix of an empty string.
isPrefixOf (x:xs) (y:ys) =
    if x == y
        then xs `isPrefixOf` ys    -- If the heads are equal, check the tails.
        else False               -- If the heads are not equal, it's not a prefix.
