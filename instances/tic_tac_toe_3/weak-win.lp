program(1..2). weak_win(1,oplayer). weak_win(2,xplayer). 

1 {does(R, A, J, T) : input(R, A)} 1 :- tdom(act,T), not terminated(J, T), role(R), program(J).
:- not legal(R, A, P, T), does(R, A, P, T), role(R), program(P).

terminated(J, T) :- terminal(J, T), tdom(fluent,T), program(J).
terminated(J, T+1) :- terminated(J, T), tdom(fluent,T), program(J).
has_legal(R, J, T) :- legal(R, M, J, T).
no_legal(J, T) :- not has_legal(R,J,T), tdom(fluent, T), role(R), program(J).
terminated(J, T) :- no_legal(J, T).

% weak win of player x and o
:- 0 { terminated(J, T) : tdom(fluent,T) } 0, weak_win(J, R).
:- terminated(P, T), not terminated(P, T - 1), not goal(R, 100, P, T), weak_win(P,R).
:- terminated(P, 1), not goal(R, 100, P, 1), weak_win(P,R).


% controlX cannot be true all the time
% not terminal and X (true(control(x)) and X true(control(x))) ...
% not terminal and X nest(true(control(x)), ^ , N-1)
program(3).
:- eta(3, 1).
eta(3, 1) :- eta_1(3, 1), eta_2(3, 1).
eta_1(3, 1) :- not terminal(3, 1).
eta_2(3, 1) :- terminal(3, 1).
eta_2(3, 1) :- no_legal(3, 1).
eta_2(3, 1) :- eta_2_1(3, 2), eta_2_2(3, 2).
eta_2_1(3, T) :- true(control(xplayer), 3, T), T >= 2, tdom(T).
eta_2_2(3, T) :- terminal(3, T), T >=2, tdom(T).
eta_2_2(3, T) :- no_legal(3, T), T >= 2, tdom(T).
eta_2_2(3, T) :- tdom(T), not tdom(T+1), T >= 2.
eta_2_2(3, T) :- eta_2_1(3, T+1), eta_2_2(3, T+1), tdom(T+1), T >= 2.

% #show eta_1/2.
% #show eta_2/2.
% #show eta_2_1/2.
% #show eta_2_2/2.


