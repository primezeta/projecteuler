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

is_prime :: Int -> Bool
is_prime 1 = False
is_prime 2 = True
is_prime 3 = True
is_prime n = not (or' (\m -> is_divisible n m) [2..(quot n 2)])

nth_prime :: Int -> Int
nth_prime nth = filter is_prime [2..] !! (nth - 1)

time :: IO t -> IO t
time a = do
  start <- getCPUTime
  v <- a
  end <- getCPUTime
  let diff = (fromIntegral (end - start))/(10^12)
  printf "Computation time: %0.3f sec\n" (diff :: Double)
  return v

main = do
  time $ print (nth_prime 10001)
