import Codec.BMP
import GHC.Word
import GHC.List as List
import Data.ByteString
import Data.Fixed


-- Owen Craston
-- 101037159
-- comp 3007 assignment 3

-- question1
-- formula for Linear congruential generator was found here: https://en.wikipedia.org/wiki/Linear_congruential_generator

a = 12
c = 3
m = 7
rand :: Float -> Float
rand i = ((a * i + c) `mod'` m) / m

-- question 2
-- question 3
-- question 4
