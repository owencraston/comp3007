% Strategic Problem
% Solving with Prolog


% A frog is at the bottom of a 5 meter well.
% Each day he summons enough energy for one three meter leap up the well.
% (i.e., After the first leap his hind legs are exactly three meters up the well.)
% Exhausted, he then hangs there for the rest of the day.
% At night, while he is asleep, he slips two meters backwards.
% His hind legs must clear the well for him to escape.

% How Long does it take the Frog to Escape the Well?

% while Solving such a Problem, the Progress
% (at any given moment) can be Summarized by
% Describing the Current State of the Problem
% for many problems, there is a Finite Number of
% Possible States, so a Finite State Machine can be
% Useful for Solving such Problems


% the states are, bottom, 1m, 2m, 3m, 4m, escaped (5m)
% each of these states can be at night or in daytie
% bottom day, 1m day... escaped day
% bottom night, 1m night... escaped night

% transitions
% jumps up 3 in the day, slips back down 2
% so on the bottom day, he jumps up to 3m then at night falls down back to 2
% take 3 steps forward 2 steps back

% we get the before and after state of the frog when it leaps
% for each of these states we can ask...what time of day is it and what distance is he at

% defining the transition
transition(state(A, B), leap, state(C, D)) :-
timeMarchesOn(B, D), B \= night, C is A-3.
% we are subtracting instead of addding because we want to check if he escapes the well as being greater than 0
% B \= night means b is not night

transition(state(A, B), rest, state(C, D)) :-
timeMarchesOn(B, D), C is A+2.

timeMarchesOn(day, night).
timeMarchesOn(night, day).

escapeTheWell( state(A, _), [] ) :- A =< 0.
escapeTheWell( state(A, B), [X | Y] ) :- A > 0,transition( state(A, B), X, C ), escapeTheWell( C, Y ).
