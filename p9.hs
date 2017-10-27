import Data.List (find)

mn :: (Integer, Integer) -> (Integer, Integer)
mn xy = (a+b+c, a*b*c)
  where m = fst xy
        n = snd xy
        a = m^2-n^2
        b = 2*m*n
        c = m^2+n^2

main = do
  print (find (\abc->(fst abc) == 1000) (map mn [(y,x) | x <- [1..], y <- [x..100]]))
