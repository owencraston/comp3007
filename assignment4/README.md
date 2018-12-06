# Assignment 4


## Question 2 a
open `ghci` in source dir
to load: `:load comp3007_f18_101037159_a4_2a.hs`

to test: `countInRange [2,4,6,8,10,12,14,16,18] 3 11` => `4`

## Question 2 b
open `swipl` in source dir

to load: `?- [comp3007_f18_101037159_a4_2a].` => `true.`

to test: 
```
?- countInRange([2,4,6,8,10,12,14,16,18], 3, 11, X).
X = 4 ;
false.
```


## Question 3

open `swipl` in source dir

to load: `?- [comp3007_f18_101037159_a4_3].` => `true`

to test: 
```
?- possible(TL).
false.
```

since this is not possible the response is `false`.
