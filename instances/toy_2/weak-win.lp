program(1..2).  

:- not legal(R,A,P,T), does(R,A,P,T).
1 {does(R, A, J, T) : input(R, A)} 1 :- tdom(act,T), not terminated(J, T), role(R), program(J).
terminated(J, T) :- terminal(J, T), tdom(fluent,T), program(J).
terminated(J, T+1) :- terminated(J, T), tdom(fluent,T), program(J).
has_legal(R, J, T) :- legal(R, M, J, T).
no_legal(J, T) :- not has_legal(R,J,T), tdom(fluent, T), role(R), program(J).
terminated(J, T) :- no_legal(J, T).

% p and (X (p and X (p and  X p))
%
:- eta_1(1, 1). 
eta_1(1, 1) :- eta_1_1(1, 1), eta_1_2(1, 1).
eta_1_1(1, 1) :- not goal(p, 100, 1, 1).
eta_1_1(1, 1) :- not terminal(1, 1).
eta_1_2(1, 1) :- terminal(1, 1).
eta_1_2(1, 1) :- eta_2_1(1, 2).
eta_2_1(1, 2) :- not goal(p, 100, 1, 2).
eta_2_1(1, 2) :- not terminal(1, 2).

% not terminal and X true(win)
:- eta_1(2, 1).
eta_1(2, 1) :- eta_1_1(2, 1), eta_1_2(2, 1).
eta_1_1(2, 1) :- not terminal(2, 1).
eta_1_2(2, 1) :- terminal(2, 1).
eta_1_2(2, 1) :- no_legal(2, 1).
eta_1_2(2, 1) :- eta_2_1(2, 2).
eta_2_1(2, 2) :- true(win, 2, 2).

