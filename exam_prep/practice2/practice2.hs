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

