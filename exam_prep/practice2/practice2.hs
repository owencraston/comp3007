-- 1
-- Recreate the following function such that it is tail-call optimized. 
-- Do not forget to include a helper function (with type declaration [a] -> [a]) and a new type declaration for your tail-call optimized function.

-- recreate the follwoing
-- foo :: [a] -> [a]
-- foo [] = []
-- foo (h:t) = (bar h) : (foo t)

-- tc
-- foo:: [a] -> [a]
-- foo x = foo' x []

-- foo':: [a] -> [b] -> [c]
-- foo' [] _ = []
-- foo' (x:xs) n = foo' xs (n ++ bar x) : xs

-- bar:: [a] -> [a]
-- bar [a] = [a]

-- 2
-- [HASKELL] Since following data type can be used to represent a list of integers...
-- data ListOfInts = EmptyList | Single Int | Cons Int Int ListOfInts
-- ...how could you write a function that computes the arithmetic mean (i.e., sum of all the elements divided by the number of elements) of a list encoded using this type? The type 
-- declaration has been provided below, but you will likely want to implement your own sum and length helper functions. Please assume that the arithmetic mean of a list of length 0 is defined as 0.
--           avrage :: ListOfInts -> Float

-- data ListOfInts = EmptyList | Single Int | Cons Int Int ListOfInts deriving (Show)

-- avrage :: ListOfInts -> Float
-- average EmptyList = 0.0
-- avergae Single x = x
-- average x = (sum` x)/(length` x) 

-- length':: ListOfInts -> Int
-- length' EmptyList = 0
-- length' Single = 0
-- length' (Cons x y xs) = 2 + length' xs

-- sum' :: ListOfInts -> Int
-- sum' EmptyList = 0
-- sum' Single x = x
-- sum' Cons x y xs = x + y sum' xs
-- testList = (Cons 1 2), (Single 2), (EmptyList Cons 10 10)

-- 4

-- data TLogicVal = Duno | Troo | Falz deriving Show

-- Consider, as an alternative, how a (Maybe Bool) could be used as an alternative to a TLogicVal value
-- (using Nothing to represent the unknown value), and rewrite the following function...

-- tImplication:: TLogicVal -> TLogicVal -> TLogicVal tImplication Troo Falz = Falz
-- tImplication Falz _ = Troo
-- tImplication _ Troo = Troo
    --    tImplication _ _ = Duno

data TLogicVal = Duno | Troo | Falz deriving Show

tImplication :: (Maybe TLogicVal) -> (Maybe TLogicVal) -> (Maybe TLogicVal)
tImplication (Just Troo) (Just Falz) = (Just Falz)
tImplication (Just Falz) _ = (Just Troo)
tImplication _ (Just Troo) = (Just Troo)
tImplication _ _ = Nothing

-- 5
-- 5. [HASKELL] How would you write a single Haskell function to provide the sum of 
-- every even number that appears in a list of integers? You may use the built-in even (even :: Int -> Bool) 
-- function to complete this question but you cannot use any other functions.

sumEvenList :: [Int] -> Int
sumEvenList [] = 0
sumEvenList (x:xs)
    | even x = x + sumEvenList xs
    | otherwise = sumEvenList xs

-- sumEvenList [1,2,3,4,5,6,7,8,9] -> 20
