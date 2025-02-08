program(tl).
ldom(player, 1..4).
% log-encoding
does(player, move(1,1), tl, T) :- not moveL(player, 1, tl, T), not moveL(player, 2, tl, T), not moveL(player, 3, tl, T), not moveL(player, 4, tl, T), legal(player, move(1,1), tl, T), not terminated(tl, T).
does(player, move(1,2), tl, T) :- moveL(player, 1, tl, T), not moveL(player, 2, tl, T), not moveL(player, 3, tl, T), not moveL(player, 4, tl, T), legal(player, move(1,2), tl, T), not terminated(tl, T).
does(player, move(1,3), tl, T) :- not moveL(player, 1, tl, T), moveL(player, 2, tl, T), not moveL(player, 3, tl, T), not moveL(player, 4, tl, T), legal(player, move(1,3), tl, T), not terminated(tl, T).
does(player, move(2,1), tl, T) :- moveL(player, 1, tl, T), moveL(player, 2, tl, T), not moveL(player, 3, tl, T), not moveL(player, 4, tl, T), legal(player, move(2,1), tl, T), not terminated(tl, T).
does(player, move(2,2), tl, T) :- not moveL(player, 1, tl, T), not moveL(player, 2, tl, T), moveL(player, 3, tl, T), not moveL(player, 4, tl, T), legal(player, move(2,2), tl, T), not terminated(tl, T).
does(player, move(2,3), tl, T) :- moveL(player, 1, tl, T), not moveL(player, 2, tl, T), moveL(player, 3, tl, T), not moveL(player, 4, tl, T), legal(player, move(2,3), tl, T), not terminated(tl, T).
does(player, move(3,1), tl, T) :- not moveL(player, 1, tl, T), moveL(player, 2, tl, T), moveL(player, 3, tl, T), not moveL(player, 4, tl, T), legal(player, move(3,1), tl, T), not terminated(tl, T).
does(player, move(3,2), tl, T) :- moveL(player, 1, tl, T), moveL(player, 2, tl, T), moveL(player, 3, tl, T), not moveL(player, 4, tl, T), legal(player, move(3,2), tl, T), not terminated(tl, T).
does(player, move(3,3), tl, T) :- not moveL(player, 1, tl, T), not moveL(player, 2, tl, T), not moveL(player, 3, tl, T), moveL(player, 4, tl, T), legal(player, move(3,3), tl, T), not terminated(tl, T).

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
