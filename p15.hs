paths' :: (Int,Int) -> (Int,Int) -> Int
paths' (x,y) (lenX, lenY)
  | x == lenX && y == lenY = 1
  | x == lenX = py
  | y == lenY = px
  | otherwise = py + px
  where py = paths'(x,y+1) (lenX, lenY)
        px = paths'(x+1,y) (lenX, lenY)

paths :: (Int,Int) -> Int
paths (lenX, lenY) = paths' (0,0) (lenX,lenY)

main = do
  print $ paths (20,20)
