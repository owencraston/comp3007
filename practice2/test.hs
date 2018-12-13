foo:: [a] -> [a]
foo x = foo' x []

foo':: [a] -> Integer -> [a]
foo' [] _ = []
foo' (x:xs) n = foo' xs (n ++ bar x) : xs

bar:: [a] -> [a]
bar [a] = [a]



-- 2
data ListOfInts = EmptyList | Single Int | Cons Int Int ListOfInts

avrage :: ListOfInts -> Float
average EmptyList = 0.0
avergae Single x = x
average x = sum(x) / length(x) 


length':: ListOfInts -> Int
length' EmptyList = 0
length' Single = 0
length' (Cons x y xs) = 2 + length' xs

sum' :: ListOfInts -> Int
sum' EmptyList = 0
sum' Single x = x
sum' Cons x y xs = x + y sum' xs

-- 3
-- given
data TLogicVal = Duno | Troo | Falz deriving Show
-- and
tImplication:: TLogicVal -> TLogicVal -> TLogicVal
tImplication Troo Falz = Falz
tImplication Falz _ = Troo
tImplication _ Troo = Troo
tImplication _ _ = Duno

-- how could we make the following work?
tImplication :: (Maybe TLogicVal) -> (Maybe TLogicVal) -> (Maybe TLogicVal).
tImplication (Just Troo) (Just Falz) = (Just Falz)
tImplication (Just Falz) _ = (Just Troo)
tImplication _ (Just Troo) = (Just Troo)
tImplication _ _ = Nothing

-- 6
returnEven :: [Int] -> [Int]
returnEven (a) = foldl (+) 0 (filter even a)
