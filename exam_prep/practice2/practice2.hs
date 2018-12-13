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

data ListOfInts = EmptyList | Single Int | Cons Int Int ListOfInts deriving (Show)

lSum :: ListOfInts -> Int
lSum EmptyList = 0
lSum Single x = x
lSum Cons x y l = x + y + lSum l

lLength :: ListOfInts -> Int
lLength EmptyList = 0
lLength Single x = 1
lLength Cons _ _ l = 2 + lLength l

avrage :: ListOfInts -> Float
avrage EmptyList = 0
avrage Single x = x
avrage Cons l = lSum l / lLength l
-- testList = (Cons 1 2), (Single 2), (EmptyList Cons 10 10)

-- 4
