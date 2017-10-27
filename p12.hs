import Data.List (find)

triNumbers :: [Integer]
triNumbers  = map (\n-> quot (n*(n+1)) 2) [1..]

divisorCount' :: Integer -> [Integer] -> Integer -> Integer
divisorCount' n (m:[]) count
  | (mod n m) == 0 = 1
  | otherwise = 0
divisorCount' n (m:ms) count
  | m > n = count
  | (mod n m) == 0 = divisorCount' n ms $! (count+1)
  | otherwise = divisorCount' n ms count

divisorCount :: Integer -> [Integer] -> Integer
divisorCount n [] = 0
divisorCount n ms = divisorCount' n ms 0

result :: (Integer -> Bool) -> Maybe (Integer, Integer)
result f = find (\d-> f (snd d)) (map (\n-> (n, divisorCount n [1..(quot n 2)])) triNumbers) 

main = do
  print (result (>500))
