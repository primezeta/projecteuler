import Text.Printf
import Control.Exception
import System.CPUTime

or' :: (Int -> Bool) -> [Int] -> Bool
or' _ [] = False
or' f (v:vs)
  | (f v) == True = True
  | otherwise = (f v) || (or' f vs)

is_divisible :: Int -> Int -> Bool
is_divisible n m
  | n < 2 = False
  | n == m = False
  | otherwise = (mod n m) == 0

prime :: Int -> Int
prime 1 = 0
prime 2 = 2
prime 3 = 3
prime n
  | p == False = 0
  | p == True = n
  where
    p = not (or' (\m -> is_divisible n m) [2..(quot n 2)])

time :: IO t -> IO t
time a = do
  start <- getCPUTime
  v <- a
  end <- getCPUTime
  let diff = (fromIntegral (end - start))/(10^12)
  printf "Computation time: %0.3f sec\n" (diff :: Double)
  return v

main = do
  time $ print (sum (map prime [1..2000000]))
