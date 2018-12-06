-- Owen Craston
-- 101037159
-- assignment 4/4


countInRange :: [Int] -> Int -> Int -> Int
-- pass in value and start couneter at 0
countInRange l min max = countInRange' l min max 0


countInRange' :: [Int] -> Int -> Int -> Int -> Int
countInRange' [] _ _ count  = count
countInRange' (h:t) minimum maximum count
     | h >= minimum && h <= maximum = countInRange' t minimum maximum (count+1)
     | otherwise = countInRange' t minimum maximum (count)
