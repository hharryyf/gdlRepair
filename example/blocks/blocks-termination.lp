program(tl).
ldom(robot, 1..5).
% log-encoding
does(robot, s(a,a), tl, T) :- not moveL(robot, 1, tl, T), not moveL(robot, 2, tl, T), not moveL(robot, 3, tl, T), not moveL(robot, 4, tl, T), not moveL(robot, 5, tl, T), legal(robot, s(a,a), tl, T), not terminated(tl, T).
does(robot, s(a,b), tl, T) :- moveL(robot, 1, tl, T), not moveL(robot, 2, tl, T), not moveL(robot, 3, tl, T), not moveL(robot, 4, tl, T), not moveL(robot, 5, tl, T), legal(robot, s(a,b), tl, T), not terminated(tl, T).
does(robot, s(a,c), tl, T) :- not moveL(robot, 1, tl, T), moveL(robot, 2, tl, T), not moveL(robot, 3, tl, T), not moveL(robot, 4, tl, T), not moveL(robot, 5, tl, T), legal(robot, s(a,c), tl, T), not terminated(tl, T).
does(robot, s(b,a), tl, T) :- moveL(robot, 1, tl, T), moveL(robot, 2, tl, T), not moveL(robot, 3, tl, T), not moveL(robot, 4, tl, T), not moveL(robot, 5, tl, T), legal(robot, s(b,a), tl, T), not terminated(tl, T).
does(robot, s(b,b), tl, T) :- not moveL(robot, 1, tl, T), not moveL(robot, 2, tl, T), moveL(robot, 3, tl, T), not moveL(robot, 4, tl, T), not moveL(robot, 5, tl, T), legal(robot, s(b,b), tl, T), not terminated(tl, T).
does(robot, s(b,c), tl, T) :- moveL(robot, 1, tl, T), not moveL(robot, 2, tl, T), moveL(robot, 3, tl, T), not moveL(robot, 4, tl, T), not moveL(robot, 5, tl, T), legal(robot, s(b,c), tl, T), not terminated(tl, T).
does(robot, s(c,a), tl, T) :- not moveL(robot, 1, tl, T), moveL(robot, 2, tl, T), moveL(robot, 3, tl, T), not moveL(robot, 4, tl, T), not moveL(robot, 5, tl, T), legal(robot, s(c,a), tl, T), not terminated(tl, T).
does(robot, s(c,b), tl, T) :- moveL(robot, 1, tl, T), moveL(robot, 2, tl, T), moveL(robot, 3, tl, T), not moveL(robot, 4, tl, T), not moveL(robot, 5, tl, T), legal(robot, s(c,b), tl, T), not terminated(tl, T).
does(robot, s(c,c), tl, T) :- not moveL(robot, 1, tl, T), not moveL(robot, 2, tl, T), not moveL(robot, 3, tl, T), moveL(robot, 4, tl, T), not moveL(robot, 5, tl, T), legal(robot, s(c,c), tl, T), not terminated(tl, T).
does(robot, u(a,a), tl, T) :- moveL(robot, 1, tl, T), not moveL(robot, 2, tl, T), not moveL(robot, 3, tl, T), moveL(robot, 4, tl, T), not moveL(robot, 5, tl, T), legal(robot, u(a,a), tl, T), not terminated(tl, T).
does(robot, u(a,b), tl, T) :- not moveL(robot, 1, tl, T), moveL(robot, 2, tl, T), not moveL(robot, 3, tl, T), moveL(robot, 4, tl, T), not moveL(robot, 5, tl, T), legal(robot, u(a,b), tl, T), not terminated(tl, T).
does(robot, u(a,c), tl, T) :- moveL(robot, 1, tl, T), moveL(robot, 2, tl, T), not moveL(robot, 3, tl, T), moveL(robot, 4, tl, T), not moveL(robot, 5, tl, T), legal(robot, u(a,c), tl, T), not terminated(tl, T).
does(robot, u(b,a), tl, T) :- not moveL(robot, 1, tl, T), not moveL(robot, 2, tl, T), moveL(robot, 3, tl, T), moveL(robot, 4, tl, T), not moveL(robot, 5, tl, T), legal(robot, u(b,a), tl, T), not terminated(tl, T).
does(robot, u(b,b), tl, T) :- moveL(robot, 1, tl, T), not moveL(robot, 2, tl, T), moveL(robot, 3, tl, T), moveL(robot, 4, tl, T), not moveL(robot, 5, tl, T), legal(robot, u(b,b), tl, T), not terminated(tl, T).
does(robot, u(b,c), tl, T) :- not moveL(robot, 1, tl, T), moveL(robot, 2, tl, T), moveL(robot, 3, tl, T), moveL(robot, 4, tl, T), not moveL(robot, 5, tl, T), legal(robot, u(b,c), tl, T), not terminated(tl, T).
does(robot, u(c,a), tl, T) :- moveL(robot, 1, tl, T), moveL(robot, 2, tl, T), moveL(robot, 3, tl, T), moveL(robot, 4, tl, T), not moveL(robot, 5, tl, T), legal(robot, u(c,a), tl, T), not terminated(tl, T).
does(robot, u(c,b), tl, T) :- not moveL(robot, 1, tl, T), not moveL(robot, 2, tl, T), not moveL(robot, 3, tl, T), not moveL(robot, 4, tl, T), moveL(robot, 5, tl, T), legal(robot, u(c,b), tl, T), not terminated(tl, T).
does(robot, u(c,c), tl, T) :- moveL(robot, 1, tl, T), not moveL(robot, 2, tl, T), not moveL(robot, 3, tl, T), not moveL(robot, 4, tl, T), moveL(robot, 5, tl, T), legal(robot, u(c,c), tl, T), not terminated(tl, T).

% N player game termination + playability

% logarithmic encoding
{moveL(R, M, tl, T) : ldom(R, M)} :- role(R), tdom(act,T).

% additional constraints for the GDL encoding.
terminated(tl,T) :- terminal(tl,T).
terminated(tl,T) :- terminated(tl,T-1), tdom(T).

:- does(P,M,tl,T), not legal(P,M,tl,T).

% existential and universal players must take a move at its turn
1 {does(P,M,tl,T) : input(P, M)} 1 :- not terminated(tl,T), tdom(act,T), role(P).
:- terminated(tl,T), does(P,M,tl,T).
% game must terminate
:- 0 {terminated(tl,T) : tdom(T)} 0.
