% Owen Craston
%  101037159
%  comp 3007 assignment 4/4

% question 3

% While traveling through Moria, Gandalf, Aragorn, Gilmi, and Legolas approach a great chasm.
% There is a bridge going across but it can only hold two people at a time. Because of poor
% planning, they only have a single torch between the four of them, and since the mines are
% particularly dark, the torch must be carried whenever someone tries to cross the bridge.

% Legolas is the fastest and can cross the bridge in only one minute, and Aragorn is in pretty good
% shape too so he can cross it in three minutes. Gimli, being a dwarf, has stubby legs, so it will take
% him five minutes, and since Gandalf is over 2000 years old, it will take him eight minutes to cross
% the bridge. Whenever two of the company cross the bridge together, they must stick together
% so that they both know where they are going. This entails that they move at the pace of the
% slower of the two. 
% Is it possible for all of them to cross the bridge in 15 minutes or less? How?

% person and time to cross
person(gandalf,8).
person(aragorn,3).
person(gilmi,5).
person(legolas,1).


possible(TL) :- solve(TL,15).

company([gandalf, aragorn, gilmi, legolas]).

solve(TL,T) :-
    company(C),
    setup(state(torch, C), state(cross, []), TL, D1),
    D1 =< T.

% cross bridge with torch 
crossChasm(state(cross ,P1),state(torch,P2),torch(W),T) :-
    % init full company
    company(C),
     % remove P1 from company and return new Company
    subtract(C,P1,C2),
     % check if W is a member of the new Company
    member(W,C2),
    ord_union([W],P1,P2),
    % get union of set of people
    person(W,T).


% state when they bring the torch back across
crossChasm(state(torch,P1),state(cross,P2), cross(TL),T) :- 
    % get rank between people
    rank(P1,TL,P2),
    %  get time to cross
    getTime(TL,T).



% call other functions
setup(state(cross,[]),state(cross, []), [], 0).    
setup(S,A,CL,T) :-
    crossChasm(S,C,TL,W),
    setup(C,A,B,Y),
    append([TL],B,CL),
    T is W + Y.


% compare people in the list
rank(CL,[W,Y],TL) :- 
    % check member properties
    member(W,CL),
    member(Y,CL),
    % compare who is faster
    compare(<,W,Y),  
    % remove from list
    subtract(CL,[W,Y],TL).


% find the time it takes to cross
% base case, with empty list of people and 0 time
getTime([],0) :- !.
getTime([W|CL],M) :- 
    person(W,S), 
    getTime(CL,T), 
    M is max(S,T).
