# Assignment 3

- Owen Craston
- 101037159
- comp 3007 assignment 3

# getting started

to load the project, in the source dir, enter `GHCI` and type `:l comp3007_f18_101037159_a3.hs` and then proceed

## Question 1
functons:
- `rand :: Float -> Float`

### test
`rand 0.67`

## Question 2
- `data TreeExpr`

### test
```
testAddition =  (Addition (Val 1) (Val 3)) -- = 4
testExp1 = (Addition (Var "x") (Val 3))
testExp2 = Multiplication (Addition (Var "x") (Val 3)) (Addition (Val 5) (Val 2))
testSubtraction = (Subtraction (Var "x") (Val 3))
testMultiplication = (Multiplication (Var "y") (Val 4))
testDivision = (Division (Val 10) (Var "x"))
testDivision2 = (Division (Var "x") (Val 10))
```

## Question 3
functions:
- a
    - `eval :: TreeExpr -> Float -> (Maybe Float)`
- b
    - `treeToString :: TreeExpr -> String`
- c
    - `drawTree :: TreeExpr -> Int -> String`
    - `indent :: Int -> [Char]`

### test
- `eval testExp2 2` -> Just 35.0
- `eval testDivision 0` -> Nothing
- `treeToString testExp1` -> "(x + 3.0)"
- `Prelude.putStrLn $ drawTree testExp2 1`

# Question 4
function:
- `mutateTree :: TreeExpr -> TreeExpr`

## test
- `mutateTree (Val 3)` -> Val 0.5714286
- `mutateTree (Addition (Val 1) (Val 3))` -> Addition (Val 1.0) (Multiplication (Val 0.14285715) (Val 0.5714286))
- `mutateTree (Subtraction (Val 1) (Val 3))` -> Subtraction (Val 1.0) (Multiplication (Val 0.14285715) (Val 0.5714286))
