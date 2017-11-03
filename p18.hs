import qualified Data.Vector as V
import Data.Maybe

data TriRow a = End | Last (V.Vector a) | Row (V.Vector a) (TriRow a) deriving (Show)

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

makeTree :: [[Int]] -> TriRow Int
makeTree [] = End
makeTree (r:[]) = Last (V.fromList r)
makeTree (r:rs) = Row (V.fromList r) (makeTree rs)

mapTree :: (a -> b) -> TriRow a -> TriRow b
mapTree f End = End
mapTree f (Last r) = Last (V.map f r)
mapTree f (Row r next) = Row (V.map f r) (mapTree f next)

numLists :: [[Int]]
numLists = [[75],[95,64],[17,47,82],[18,35,87,10],[20,04,82,47,65],[19,01,23,75,03,34],[88,02,77,73,07,63,67],[99,65,04,28,06,16,70,92],[41,41,26,56,83,40,80,70,33],[41,48,72,33,47,32,37,16,94,29],[53,71,44,65,25,43,91,52,97,51,14],[70,11,33,28,77,73,17,78,39,68,17,57],[91,71,52,38,17,14,91,43,58,50,27,29,48],[63,66,04,68,89,53,67,30,73,16,69,87,40,31],[04,62,98,27,23,09,70,98,73,93,38,53,60,04,23]]

main = do
  print $ makeTree numLists
