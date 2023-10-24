{-
A string s is called prefix of string t if there exists a string e such that t = s ◦ e, ◦ being string concatenation. One could
call t continuation of s.
This can be defined recursively: s is a prefix of t, if
• s is empty, or
• the heads of s and t are equal and the tail of s is a prefix of the tail of t.
Define a function
isPrefixOf :: String→ String→ Bool
which tests for this prefix relation. e.g.:
isPrefixOf " " "Foo" ⇝ True
isPrefixOf "baz" "bazbar" ⇝ True
isPefixOf "bar" "bazbar" ⇝ False
-}
isPrefixOf :: String -> String -> Bool
isPrefixOf "" _ = True           
isPrefixOf _ "" = False          
isPrefixOf (x:xs) (y:ys)
    | x == y = isPrefixOf xs ys  
    | otherwise = False         

