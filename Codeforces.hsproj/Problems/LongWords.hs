module Problems.LongWords where
  
import Codeforces
import System.Environment

--http://codeforces.com/problemset/problem/71/A

abbreviate :: String -> String
abbreviate input
  | (length input) <= 10 = input
  |  otherwise = (\str -> [head str] ++ (show $ (length str) - 2) ++ [last str]) input
  

main = interact $ unlines . map abbreviate . tail . lines
