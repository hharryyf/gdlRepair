ldom(1..4).
% log-encoding
does(oplayer, mark(1,1), 3, T) :- not moveL(1, T), not moveL(2, T), not moveL(3, T), not moveL(4, T), legal(oplayer, mark(1,1), 3, T), not terminated(3, T).
does(oplayer, mark(1,2), 3, T) :- moveL(1, T), not moveL(2, T), not moveL(3, T), not moveL(4, T), legal(oplayer, mark(1,2), 3, T), not terminated(3, T).
does(oplayer, mark(1,3), 3, T) :- not moveL(1, T), moveL(2, T), not moveL(3, T), not moveL(4, T), legal(oplayer, mark(1,3), 3, T), not terminated(3, T).
does(oplayer, mark(2,1), 3, T) :- moveL(1, T), moveL(2, T), not moveL(3, T), not moveL(4, T), legal(oplayer, mark(2,1), 3, T), not terminated(3, T).
does(oplayer, mark(2,2), 3, T) :- not moveL(1, T), not moveL(2, T), moveL(3, T), not moveL(4, T), legal(oplayer, mark(2,2), 3, T), not terminated(3, T).
does(oplayer, mark(2,3), 3, T) :- moveL(1, T), not moveL(2, T), moveL(3, T), not moveL(4, T), legal(oplayer, mark(2,3), 3, T), not terminated(3, T).
does(oplayer, mark(3,1), 3, T) :- not moveL(1, T), moveL(2, T), moveL(3, T), not moveL(4, T), legal(oplayer, mark(3,1), 3, T), not terminated(3, T).
does(oplayer, mark(3,2), 3, T) :- moveL(1, T), moveL(2, T), moveL(3, T), not moveL(4, T), legal(oplayer, mark(3,2), 3, T), not terminated(3, T).
does(oplayer, mark(3,3), 3, T) :- not moveL(1, T), not moveL(2, T), not moveL(3, T), moveL(4, T), legal(oplayer, mark(3,3), 3, T), not terminated(3, T).
does(oplayer, noop, 3, T) :- moveL(1, T), not moveL(2, T), not moveL(3, T), moveL(4, T), legal(oplayer, noop, 3, T), not terminated(3, T).

