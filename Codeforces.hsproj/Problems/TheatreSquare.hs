module Problems.TheatreSquare where
  
import Codeforces
import System.Environment

--http://codeforces.com/problemset/problem/1/A?locale=en

solution :: [Int] -> Int
solution input = case input of
  [n,m,a] -> div(-n)a*div(-m)a
  _       -> 0

main = do
  [n, m, a] <- fmap (map read . words) problemRead
  print $ ceiling (n / a) * ceiling (m / a)