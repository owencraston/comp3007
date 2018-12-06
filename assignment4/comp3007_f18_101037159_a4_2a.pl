% Owen Craston
%  101037159
%  comp 3007 assignment 4/4

% base case
countInRange([], _, _, 0).
% in range
countInRange([H|T], Min, Max, Count) :- (H >= Min, H =< Max), countInRange(T, Min, Max, Count1), Count is 1 + Count1.
% out of range
countInRange([H|T], Min, Max, Count) :- (H < Min ; H > Max), countInRange(T, Min, Max, Count).
