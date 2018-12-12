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
    | start >= stop = []
    | otherwise = (start) : computeRange (start + step) step stop
    
-- computeRange 3 2 20 -> [3,5,7,9,11,13,15,17]


-- 4. For this question you will implement (under specific constraints) a recursive function in Haskell that
-- takes a list of characters as an argument and returns a list that contains only every third element
-- from the argument list in the same order. As a clarifying example, this function, when passed the
-- argument list “ABCDEFGHIJKLMNO”, should return the list “CFILO”. It should also be noted that your
-- function must work (i.e., not terminate with an error) even if the number of elements in the
-- argument list is less than three.
-- You may NOT use the !! operator to complete this question, and you may NOT use any function that
-- you haven’t written here (i.e., you may NOT use any built-in functions, but you may use other
-- functions if you write them yourself).

-- a. Write this function (including a type declaration) by first writing a selector function (for
-- retrieving the third element of a list) and then having your recursive function call your
-- selector function as required. [4.0 marks]

-- b. Write this function (including a type declaration) without selector functions (even if you
-- wrote them yourself), using only pattern matching

