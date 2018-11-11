import GHC.List as List
import Data.ByteString
import Data.Fixed
import Data.Maybe


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
data TreeExpr = Var String | Val Float | Addition TreeExpr TreeExpr | Subtraction TreeExpr TreeExpr | Multiplication TreeExpr TreeExpr | Division TreeExpr TreeExpr

-- question 3
-- a eval function that actually evaluates expression

eval :: TreeExpr -> Float -> (Maybe Float)
eval (Var x) a = (Just a)
eval (Val f) a = (Just f)
eval (Addition l r) a
 | eval l a == Nothing || eval r a == Nothing = Nothing
 | otherwise = Just (fromJust (eval l a) + fromJust (eval r a))
eval (Subtraction l r) a
 | eval l a == Nothing || eval r a == Nothing = Nothing
 | otherwise = Just (fromJust (eval l a) - fromJust (eval r a))
eval (Multiplication l r) a
 | eval l a == Nothing || eval r a == Nothing = Nothing
 | otherwise = Just ((fromJust (eval l a)) * (fromJust (eval r a)))
eval (Division l r) a
 | (fromJust (eval r a) == 0) = Nothing
 | otherwise = Just (fromJust (eval l a) / fromJust (eval r a))

-- question 4
