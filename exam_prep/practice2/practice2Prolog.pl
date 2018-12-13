% 7. [PROLOG] Assuming that the user continues pressing ";" as long as possible 
% (thereby forcing Prolog to identify all possible solutions), 
% what is the exact output provided by the following Prolog program in response to the query a(X)?

a(1).
a(2).
a(X) :- b(X), (c(X) ; d(X)).
a(X) :- e(X).
b(X) :- e(X), f(X).
b(1).
c(1).
d(1).
d(3).
e(2).
e(3).
f(3).

% what is the result of a(X)
% ?- [practice2Prolog].
% true.

% ?- a(X).
% X = 1 ;
% X = 2 ;
% X = 3 ;
% X = 1 ;
% X = 1 ;
% X = 2 ;
% X = 3.



p(a).                             
p(X) :- q(X), r(X).                /* #2 */  
p(X) :- u(X).                      /* #3 */  
q(X) :- s(X).                      /* #4 */  
r(a).                              /* #5 */  
r(b).                              /* #6 */  
s(a).                              /* #7 */  
s(b).                              /* #8 */  
s(c).                              /* #9 */  
u(d).

