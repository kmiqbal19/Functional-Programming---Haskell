{-# LANGUAGE OverloadedStrings #-}

import Data.Attoparsec.Text
import Data.Text (Text)
import qualified Data.Text as T

data Implication = Implication [String] [String] deriving (Show)

implicationParser :: Parser Implication
implicationParser = do
  antecedent <- many1 letter `sepBy` char ','
  _ <- string "->"
  consequent <- many1 letter `sepBy` char ','
  return $ Implication antecedent consequent

parseFile :: Text -> Either String [Implication]
parseFile content = parseOnly (implicationParser `sepBy` endOfLine) content

main :: IO ()
main = do
  let testContent = "acc,bdef,d -> e\nf,g -> d,e\ne,f,g -> a"
  case parseFile (T.pack testContent) of
    Left err -> putStrLn $ "Parse failed: " ++ err
    Right implications -> print implications
