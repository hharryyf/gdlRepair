:- not legal(R, A, T), does(R, A, T), role(R).

1 {does(R, A, T) : input(R, A)} 1 :- tdom(T), not terminated(T), role(R).

terminated(T) :- terminal(T), tdom(T).
terminated(T+1) :- terminated(T), tdom(T).

:- 0 { terminated(T) : tdom(T) } 0.
:- terminated(T), not terminated(T-1), not goal(R,100,T), role(R).
:- terminated(1), not goal(R,100,1), role(R).
