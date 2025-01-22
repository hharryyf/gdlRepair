program(tl).
ldom(oplayer, 1..4).
% log-encoding
does(oplayer, mark(1,1), tl, T) :- not moveL(oplayer, 1, tl, T), not moveL(oplayer, 2, tl, T), not moveL(oplayer, 3, tl, T), not moveL(oplayer, 4, tl, T), legal(oplayer, mark(1,1), tl, T), not terminated(tl, T).
does(oplayer, mark(1,2), tl, T) :- moveL(oplayer, 1, tl, T), not moveL(oplayer, 2, tl, T), not moveL(oplayer, 3, tl, T), not moveL(oplayer, 4, tl, T), legal(oplayer, mark(1,2), tl, T), not terminated(tl, T).
does(oplayer, mark(1,3), tl, T) :- not moveL(oplayer, 1, tl, T), moveL(oplayer, 2, tl, T), not moveL(oplayer, 3, tl, T), not moveL(oplayer, 4, tl, T), legal(oplayer, mark(1,3), tl, T), not terminated(tl, T).
does(oplayer, mark(2,1), tl, T) :- moveL(oplayer, 1, tl, T), moveL(oplayer, 2, tl, T), not moveL(oplayer, 3, tl, T), not moveL(oplayer, 4, tl, T), legal(oplayer, mark(2,1), tl, T), not terminated(tl, T).
does(oplayer, mark(2,2), tl, T) :- not moveL(oplayer, 1, tl, T), not moveL(oplayer, 2, tl, T), moveL(oplayer, 3, tl, T), not moveL(oplayer, 4, tl, T), legal(oplayer, mark(2,2), tl, T), not terminated(tl, T).
does(oplayer, mark(2,3), tl, T) :- moveL(oplayer, 1, tl, T), not moveL(oplayer, 2, tl, T), moveL(oplayer, 3, tl, T), not moveL(oplayer, 4, tl, T), legal(oplayer, mark(2,3), tl, T), not terminated(tl, T).
does(oplayer, mark(3,1), tl, T) :- not moveL(oplayer, 1, tl, T), moveL(oplayer, 2, tl, T), moveL(oplayer, 3, tl, T), not moveL(oplayer, 4, tl, T), legal(oplayer, mark(3,1), tl, T), not terminated(tl, T).
does(oplayer, mark(3,2), tl, T) :- moveL(oplayer, 1, tl, T), moveL(oplayer, 2, tl, T), moveL(oplayer, 3, tl, T), not moveL(oplayer, 4, tl, T), legal(oplayer, mark(3,2), tl, T), not terminated(tl, T).
does(oplayer, mark(3,3), tl, T) :- not moveL(oplayer, 1, tl, T), not moveL(oplayer, 2, tl, T), not moveL(oplayer, 3, tl, T), moveL(oplayer, 4, tl, T), legal(oplayer, mark(3,3), tl, T), not terminated(tl, T).
does(oplayer, noop, tl, T) :- moveL(oplayer, 1, tl, T), not moveL(oplayer, 2, tl, T), not moveL(oplayer, 3, tl, T), moveL(oplayer, 4, tl, T), legal(oplayer, noop, tl, T), not terminated(tl, T).

ldom(xplayer, 1..4).
% log-encoding
does(xplayer, mark(1,1), tl, T) :- not moveL(xplayer, 1, tl, T), not moveL(xplayer, 2, tl, T), not moveL(xplayer, 3, tl, T), not moveL(xplayer, 4, tl, T), legal(xplayer, mark(1,1), tl, T), not terminated(tl, T).
does(xplayer, mark(1,2), tl, T) :- moveL(xplayer, 1, tl, T), not moveL(xplayer, 2, tl, T), not moveL(xplayer, 3, tl, T), not moveL(xplayer, 4, tl, T), legal(xplayer, mark(1,2), tl, T), not terminated(tl, T).
does(xplayer, mark(1,3), tl, T) :- not moveL(xplayer, 1, tl, T), moveL(xplayer, 2, tl, T), not moveL(xplayer, 3, tl, T), not moveL(xplayer, 4, tl, T), legal(xplayer, mark(1,3), tl, T), not terminated(tl, T).
does(xplayer, mark(2,1), tl, T) :- moveL(xplayer, 1, tl, T), moveL(xplayer, 2, tl, T), not moveL(xplayer, 3, tl, T), not moveL(xplayer, 4, tl, T), legal(xplayer, mark(2,1), tl, T), not terminated(tl, T).
does(xplayer, mark(2,2), tl, T) :- not moveL(xplayer, 1, tl, T), not moveL(xplayer, 2, tl, T), moveL(xplayer, 3, tl, T), not moveL(xplayer, 4, tl, T), legal(xplayer, mark(2,2), tl, T), not terminated(tl, T).
does(xplayer, mark(2,3), tl, T) :- moveL(xplayer, 1, tl, T), not moveL(xplayer, 2, tl, T), moveL(xplayer, 3, tl, T), not moveL(xplayer, 4, tl, T), legal(xplayer, mark(2,3), tl, T), not terminated(tl, T).
does(xplayer, mark(3,1), tl, T) :- not moveL(xplayer, 1, tl, T), moveL(xplayer, 2, tl, T), moveL(xplayer, 3, tl, T), not moveL(xplayer, 4, tl, T), legal(xplayer, mark(3,1), tl, T), not terminated(tl, T).
does(xplayer, mark(3,2), tl, T) :- moveL(xplayer, 1, tl, T), moveL(xplayer, 2, tl, T), moveL(xplayer, 3, tl, T), not moveL(xplayer, 4, tl, T), legal(xplayer, mark(3,2), tl, T), not terminated(tl, T).
does(xplayer, mark(3,3), tl, T) :- not moveL(xplayer, 1, tl, T), not moveL(xplayer, 2, tl, T), not moveL(xplayer, 3, tl, T), moveL(xplayer, 4, tl, T), legal(xplayer, mark(3,3), tl, T), not terminated(tl, T).
does(xplayer, noop, tl, T) :- moveL(xplayer, 1, tl, T), not moveL(xplayer, 2, tl, T), not moveL(xplayer, 3, tl, T), moveL(xplayer, 4, tl, T), legal(xplayer, noop, tl, T), not terminated(tl, T).

% two player game

% logarithmic encoding
{moveL(xplayer, M, tl, T) : ldom(xplayer, M)} :- tdom(act,T).
{moveL(oplayer, M, tl, T) : ldom(oplayer, M)} :- tdom(act,T).

% additional constraints for the GDL encoding.
terminated(tl,T) :- terminal(tl,T).
terminated(tl,T) :- terminated(tl,T-1), tdom(T).

:- does(P,M,tl,T), not legal(P,M,tl,T).

% existential and universal players must take a move at its turn
1 {does(P,M,tl,T) : input(P, M)} 1 :- not terminated(tl,T), tdom(act,T), role(P).
:- terminated(tl,T), does(P,M,tl,T).
% game must terminate
:- 0 {terminated(tl,T) : tdom(T)} 0.
