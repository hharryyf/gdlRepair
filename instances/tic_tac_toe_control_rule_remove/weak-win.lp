program(1..2). weak_win(1,oplayer). weak_win(2,xplayer). 

:- not legal(R, A, P, T), does(R, A, P, T), role(R), program(P).
1 {does(R, A, J, T) : input(R, A)} 1 :- tdom(act,T), not terminated(J, T), role(R), program(J).

terminated(J, T) :- terminal(J, T), tdom(fluent,T), program(J).
terminated(J, T+1) :- terminated(J, T), tdom(fluent,T), program(J).

:- 0 { terminated(J, T) : tdom(fluent,T) } 0, program(J).
:- terminated(P, T), not terminated(P, T - 1), not goal(R, 100, P, T), weak_win(P,R).
:- terminated(P, 1), not goal(R, 100, P, 1), weak_win(P,R).
