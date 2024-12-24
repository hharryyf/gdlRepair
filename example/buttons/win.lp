program(1).

:- not legal(R, A, 1, T), does(R, A, 1, T), role(R).

1 {does(R, A, 1, T) : input(R, A)} 1 :- tdom(T), not terminated(1, T), role(R).

terminated(1, T) :- terminal(1, T), tdom(T).
terminated(1, T+1) :- terminated(1, T), tdom(T).

:- 0 { terminated(1, T) : tdom(T) } 0.
:- terminated(1, T), not terminated(1, T - 1), not goal(R, 100, 1, T), role(R).
:- terminated(1, 1), not goal(R, 100, 1, 1), role(R).

#show does/4.
#show head/3.
#show head/2.
#show dummy/1.
% #show true/2.
#show add_body/3.
#show add_body/4.
#show remove_body/3.
#show remove_body/4.
#show remove_head/1.
#show add_head/1.
#show fluent/3.
#show act/4.
