import qualified Data.Vector as V
import Data.Maybe

data TriRow a = End | Last (V.Vector a) | Row (V.Vector a) (TriRow a)

data TriTree a = Tree [TriRow a]

triCount :: (Integral a) => TriRow a -> a
triCount End = fromIntegral 0
triCount (Last vec) = fromIntegral (V.length vec)
triCount (Row vec next) = (fromIntegral (V.length vec)) + (triCount next)

triSum :: (Integral a) => TriRow a -> a
triSum End = fromIntegral 0
triSum (Last vec) = V.sum vec 
triSum (Row vec next) = (V.sum vec) + (triSum next) 

triAvg :: (Integral a) => TriRow a -> a
triAvg row = quot (triSum row) (triCount row)

leftValue :: (Integral a) => TriRow a -> Int -> Maybe a
leftValue End _ = Nothing
leftValue (Last _) _ = Nothing
leftValue (Row _ End) _ = Nothing
leftValue (Row _ (Last vec)) idx = Just (vec V.! idx)
leftValue (Row _ (Row vec _)) idx = Just (vec V.! idx)

rightValue :: (Integral a) => TriRow a -> Int -> Maybe a
rightValue End _ = Nothing
rightValue (Last _) _ = Nothing
rightValue (Row _ End) _ = Nothing
rightValue (Row _ (Last vec)) idx = Just (vec V.! (idx+1))
rightValue (Row _ (Row vec _)) idx = Just (vec V.! (idx+1))

nextRow :: (Integral a) => TriTree a -> TriRow a
nextRow (Tree []) = End
nextRow (Tree rows) = head rows


main = do
  print "ok"
