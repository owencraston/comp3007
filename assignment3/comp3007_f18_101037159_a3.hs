import Codec.BMP
import GHC.Word
import GHC.List as List
import Data.ByteString


-- Owen Craston
-- 101037159
-- comp 3007 assignment 3

-- question1
randf :: Int -> Float
randf f = fromIntegral (rand f :: Int) / 10

rand :: Int -> Int
rand i = randNum
  where randNum = (x - 1) `mod` 10
        x = 3 * (i) `mod` 101


-- question 2
-- question 3
-- question 4
