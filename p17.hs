ones n
  | n == 1 = length "one"
  | n == 2 = length "two"
  | n == 3 = length "three"
  | n == 4 = length "four"
  | n == 5 = length "five"
  | n == 6 = length "six"
  | n == 7 = length "seven"
  | n == 8 = length "eight"
  | n == 9 = length "nine"
  | otherwise = 0

tens n r
  | n == 2 = length "twenty"
  | n == 3 = length "thirty"
  | n == 4 = length "forty"
  | n == 5 = length "fifty"
  | n == 6 = length "sixty"
  | n == 7 = length "seventy"
  | n == 8 = length "eighty"
  | n == 9 = length "ninety"
  | otherwise = 0

hundreds n r
  | r > 0 = (ones n) + (length "hundredand")
  | otherwise = (ones n) + (length "hundred")
  | otherwise = 0

thousands n
  | n > 0 && n < 10 = (ones n) + (length "thousand")
  | otherwise = 0

numberWords' n m
  | m > n || m > 9999 = 0
  | m > 999 = (thousands q) + (numberWords r)
  | m > 99 = (hundreds q r) + (numberWords r)
  | m > 9 = (tens q r) + (numberWords r)
  | m > 0 = (ones q)
  | otherwise = 0
  where q = quot n m
        r = mod n m

numberWords :: Int -> Int
numberWords n
  | n == 0 = 0
  | n == 10 = length "ten"
  | n == 11 = length "eleven"
  | n == 12 = length "twelve"
  | n == 13 = length "thirteen"
  | n == 14 = length "fourteen"
  | n == 15 = length "fifteen"
  | n == 16 = length "sixteen"
  | n == 17 = length "seventeen"
  | n == 18 = length "eighteen"
  | n == 19 = length "nineteen"
  | otherwise = numberWords' n m
  where m = if n > 1000 then 0 else if n > 999 then 1000 else if n > 99 then 100 else if n > 9 then 10 else if n > 0 then 1 else 0

main = do
   print $ sum (map (\n-> numberWords n) [1..1000])
