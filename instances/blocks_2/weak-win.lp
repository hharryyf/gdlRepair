program(1..1). weak_win(1,robot). 

% :- not legal(R, A, P, T), does(R, A, P, T), role(R), program(P).
% 1 {does(R, A, J, T) : input(R, A)} 1 :- tdom(act,T), not terminated(J, T), role(R), program(J).

% terminated(J, T) :- terminal(J, T), tdom(fluent,T), program(J).
% terminated(J, T+1) :- terminated(J, T), tdom(fluent,T), program(J).

% :- 0 { terminated(J, T) : tdom(fluent,T) } 0, program(J).
% :- terminated(P, T), not terminated(P, T - 1), not goal(R, 100, P, T), weak_win(P,R).
% :- terminated(P, 1), not goal(R, 100, P, 1), weak_win(P,R).

:- not legal(R,A,P,T), does(R,A,P,T).
1 {does(R, A, J, T) : input(R, A)} 1 :- tdom(act,T), not terminated(J, T), role(R), program(J).
terminated(J, T) :- terminal(J, T), tdom(fluent,T), program(J).
terminated(J, T+1) :- terminated(J, T), tdom(fluent,T), program(J).

% p and (X (p and X (p and  X p))
%
:- eta_1(1, 1). 
eta_1(1, 1) :- eta_1_1(1, 1), eta_1_2(1, 1).
eta_1_1(1, 1) :- not goal(robot, 100, 1, 1).
eta_1_1(1, 1) :- not terminal(1, 1).
eta_1_2(1, 1) :- terminal(1, 1).
eta_1_2(1, 1) :- eta_2_1(1, 2), eta_2_2(1, 2).
eta_2_1(1, 2) :- not goal(robot, 100, 1, 2).
eta_2_1(1, 2) :- not terminal(1, 2).
eta_2_2(1, 2) :- terminal(1, 2).

eta_2_2(1, 2) :- eta_3_1(1, 3), eta_3_2(1, 3).
eta_3_1(1, 3) :- not goal(robot, 100, 1, 3).
eta_3_1(1, 3) :- not terminal(1, 3).
eta_3_2(1, 3) :- terminal(1, 3).

eta_3_2(1, 3) :- eta_4_1(1, 4).
eta_4_1(1, 4) :- not goal(robot, 100, 1, 4).
eta_4_1(1, 4) :- not terminal(1, 4).




