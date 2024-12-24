program(1..2).

:- not legal(R, A, P, T), does(R, A, P, T), role(R), program(P).

1 {does(R, A, 1, T) : input(R, A)} 1 :- tdom(T), not terminated(1, T), role(R).

1 {does(R, A, 2, T) : input(R, A)} 1 :- tdom(T), not terminated(2, T), role(R).

terminated(J, T) :- terminal(J, T), tdom(T), program(J).
terminated(J, T+1) :- terminated(J, T), tdom(T), program(J).

:- 0 { terminated(J, T) : tdom(T) } 0, program(J).

:- terminated(1, T), not terminated(1, T - 1), not goal(xplayer, 100, 1, T).
:- terminated(2, T), not terminated(2, T - 1), not goal(oplayer, 100, 2, T).
:- terminated(1, 1), not goal(xplayer, 100, 1, 1).
:- terminated(2, 1), not goal(oplayer, 100, 2, 1).

#show does/4.
#show add_body/3.
#show add_body/4.
#show remove_body/3.
#show remove_body/4.
#show remove_head/1.
#show add_head/1.
