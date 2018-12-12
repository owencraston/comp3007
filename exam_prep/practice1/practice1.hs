-- 3
-- A “range” can be defined, using the three arguments “start”, “stop”, and “step”, as the list of integers 
-- that represents the arithmetic sequence that begins at the “start” element and terminates without including 
-- the “stop” element using a common difference of “step”. As a clarifying example, the range with “start” 3, “stop” 9, 
-- and “step” 2 would be represented with the list [3, 5, 7]. Write a recursive Haskell function (including a type 
-- declaration defined over Integers) that takes three arguments “start”, “stop”, and “step” (in that order) and 
-- computes the range using the definition provided. 
-- Your solution must be a single function (i.e., no helper functions) and may not call any other functions.

computeRange:: Int -> Int -> Int -> [Int]
computeRange start step stop 
    | start + step > stop = []
    | otherwise = (start) : computeRange (start + step) step stop
    
-- computeRange 3 2 20 -> [3,5,7,9,11,13,15,17]
