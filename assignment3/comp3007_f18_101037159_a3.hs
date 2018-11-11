-- Owen Craston
-- 101037159
-- comp 3007 assignment 3

import Data.Fixed
import Data.Maybe

-- question1
-- formula for Linear congruential generator was found here: https://en.wikipedia.org/wiki/Linear_congruential_generator

a = 12
c = 3
m = 7
rand :: Float -> Float
rand i = ((a * i + c) `mod'` m) / m

-- question 2
data TreeExpr
    = Var String
    | Val Float
    | Addition TreeExpr TreeExpr
    | Subtraction TreeExpr TreeExpr
    | Multiplication TreeExpr TreeExpr
    | Division TreeExpr TreeExpr deriving (Show)

-- question 3
-- a, eval function that actually evaluates expression

eval :: TreeExpr -> Float -> (Maybe Float)
eval (Var _) a = Just a
eval (Val f) a = Just f
eval (Addition l r) a = Just (fromJust (eval l a) + fromJust (eval r a))
eval (Subtraction l r) a = Just (fromJust (eval l a) - fromJust (eval r a))
eval (Multiplication l r) a = Just ((fromJust (eval l a)) * (fromJust (eval r a)))
eval (Division l r) a
 | (fromJust (eval r a) == 0) = Nothing
 | otherwise = Just (fromJust (eval l a) / fromJust (eval r a))

-- b, treeToString function that turns an tree expression into a more legible math expression
treeToString :: TreeExpr -> String
treeToString (Var _) = "x"
treeToString (Val f) = show f
treeToString (Addition l r) = "(" ++ (treeToString l) ++ " + " ++ (treeToString r) ++ ")"
treeToString (Subtraction l r) = "(" ++ (treeToString l) ++ " - " ++ (treeToString r) ++ ")"
treeToString (Multiplication l r) = "(" ++ (treeToString l) ++ " * " ++ (treeToString r) ++ ")"
treeToString (Division l r) = "(" ++ (treeToString l) ++ " / " ++ (treeToString r) ++ ")"

-- c, print the tree 
drawTree :: TreeExpr -> Int -> String
drawTree (Var _) _ = "x"
drawTree (Val f) _ = show f
drawTree (Addition l r) node = "(+) ---" ++ drawTree l (node+1) ++ "\n" ++ indent node ++ "|" ++ "\n" ++ indent node ++ "----" ++ drawTree r (node+1) 
drawTree (Subtraction l r) node = "(-) ---" ++ drawTree l (node+1) ++ "\n" ++ indent node ++ "|" ++ "\n"++ indent node ++ "----" ++ drawTree r (node+1) 
drawTree (Multiplication l r) node = "(*) ---" ++ drawTree l (node+1) ++ "\n" ++ indent node ++ "|" ++ "\n" ++ indent node ++ "----" ++ drawTree r (node+1) 
drawTree (Division l r) node = "(/) ---" ++ drawTree l (node+1) ++ "\n" ++ indent node ++  "|" ++ "\n" ++ indent node ++ "----" ++ drawTree r (node+1) 

-- helper function to print the correct number of tabs
indent :: Int -> [Char]
indent 0 = []
indent node = "\t" ++ indent (node-1)

-- test variables
testAddition =  (Addition (Val 1) (Val 3)) -- = 4
testExp1 = (Addition (Var "x") (Val 3))
testExp2 = Multiplication (Addition (Var "x") (Val 3)) (Addition (Val 5) (Val 2))
testSubtraction = (Subtraction (Var "x") (Val 3))
testMultiplication = (Multiplication (Var "y") (Val 4))
testDivision = (Division (Val 10) (Var "x"))
testDivision2 = (Division (Var "x") (Val 10))

-- question 4
