collatz :: Int -> Int
collatz n
  | n == 1 = 1
  | even n = quot n 2
  | otherwise = 3*n + 1

collatzSequence' :: Int -> [Int] -> [Int]
collatzSequence' n sequence
  | c == 1 = c:sequence
  | otherwise = collatzSequence' c (c:sequence)
  where c = collatz n

collatzSequence :: Int -> [Int]
collatzSequence n = (collatzSequence' n [])++[n]

collatzSequenceLen :: Int -> (Int,Int)
collatzSequenceLen n = (n, length $! collatzSequence n)

maximumTups :: [(Int,Int)] -> Int
maximumTups [] = error "maximum: empty list"
maximumTups ((n,l):nls) = maximumTupsTail (n,l) nls
  where maximumTupsTail (m,k) [] = m
        maximumTupsTail (m, k) ((p,q):ls)
          | k < q = maximumTupsTail (p,q) ls
          | otherwise = maximumTupsTail (m,k) ls

main = do
  print $ maximumTups (map collatzSequenceLen [1..999999])
