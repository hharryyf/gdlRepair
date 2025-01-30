program(sw).
ldom(oplayer, 1..4).
% log-encoding
does(oplayer, mark(1,1), sw, T) :- not moveL(oplayer, 1, sw, T), not moveL(oplayer, 2, sw, T), not moveL(oplayer, 3, sw, T), not moveL(oplayer, 4, sw, T), legal(oplayer, mark(1,1), sw, T), not terminated(sw, T).
does(oplayer, mark(1,2), sw, T) :- moveL(oplayer, 1, sw, T), not moveL(oplayer, 2, sw, T), not moveL(oplayer, 3, sw, T), not moveL(oplayer, 4, sw, T), legal(oplayer, mark(1,2), sw, T), not terminated(sw, T).
does(oplayer, mark(1,3), sw, T) :- not moveL(oplayer, 1, sw, T), moveL(oplayer, 2, sw, T), not moveL(oplayer, 3, sw, T), not moveL(oplayer, 4, sw, T), legal(oplayer, mark(1,3), sw, T), not terminated(sw, T).
does(oplayer, mark(2,1), sw, T) :- moveL(oplayer, 1, sw, T), moveL(oplayer, 2, sw, T), not moveL(oplayer, 3, sw, T), not moveL(oplayer, 4, sw, T), legal(oplayer, mark(2,1), sw, T), not terminated(sw, T).
does(oplayer, mark(2,2), sw, T) :- not moveL(oplayer, 1, sw, T), not moveL(oplayer, 2, sw, T), moveL(oplayer, 3, sw, T), not moveL(oplayer, 4, sw, T), legal(oplayer, mark(2,2), sw, T), not terminated(sw, T).
does(oplayer, mark(2,3), sw, T) :- moveL(oplayer, 1, sw, T), not moveL(oplayer, 2, sw, T), moveL(oplayer, 3, sw, T), not moveL(oplayer, 4, sw, T), legal(oplayer, mark(2,3), sw, T), not terminated(sw, T).
does(oplayer, mark(3,1), sw, T) :- not moveL(oplayer, 1, sw, T), moveL(oplayer, 2, sw, T), moveL(oplayer, 3, sw, T), not moveL(oplayer, 4, sw, T), legal(oplayer, mark(3,1), sw, T), not terminated(sw, T).
does(oplayer, mark(3,2), sw, T) :- moveL(oplayer, 1, sw, T), moveL(oplayer, 2, sw, T), moveL(oplayer, 3, sw, T), not moveL(oplayer, 4, sw, T), legal(oplayer, mark(3,2), sw, T), not terminated(sw, T).
does(oplayer, mark(3,3), sw, T) :- not moveL(oplayer, 1, sw, T), not moveL(oplayer, 2, sw, T), not moveL(oplayer, 3, sw, T), moveL(oplayer, 4, sw, T), legal(oplayer, mark(3,3), sw, T), not terminated(sw, T).
does(oplayer, noop, sw, T) :- moveL(oplayer, 1, sw, T), not moveL(oplayer, 2, sw, T), not moveL(oplayer, 3, sw, T), moveL(oplayer, 4, sw, T), legal(oplayer, noop, sw, T), not terminated(sw, T).

% N player game

% logarithmic encoding
{moveL(R, M, sw, T) : ldom(R, M)} :- tdom(act,T), role(R), R != xplayer.

% additional constraints for the GDL encoding.
terminated(sw,T) :- terminal(sw,T).
terminated(sw,T) :- terminated(sw,T-1), tdom(T).

:- does(P,M,sw,T), not legal(P,M,sw,T).

% existential and universal players must take a move at its turn
1 {does(P,M,sw,T) : input(P, M)} 1 :- not terminated(sw,T), tdom(act,T), role(P).
:- terminated(sw,T), does(P,M,sw,T).
% game must terminate
:- 0 {terminated(sw,T) : tdom(T)} 0.
% current player player must reach goal 100
:- terminated(sw,T), not terminated(sw,T-1), not goal(xplayer, 100 ,sw, T).
:- terminated(sw, 1), not goal(xplayer, 100 ,sw, 1).
