%%%%%%%%%%%%%%%%%%%%%%%%%%%% encoding

% disjunctions
posneg(0;1).

true(s(I), T, P) : posneg(P) :- tdom(T), base(s(I)).
terminal(T, P) : posneg(P) :- tdom(T).
terminated(T, P) : posneg(P) :- tdom(T).

does(R, M, T, P) : posneg(P) :- input(player, M), mtdom(T), role(R).
legal(R, M, T, P) : posneg(P) :- input(R, M), tdom(T).
% error if no legal action at some state
has_legal(R, T, P) : posneg(P) :- tdom(T), role(R).
no_legal(T, P) : posneg(P) :- tdom(T), role(R).

%%%%%%%%%%% saturation technique

legal(R, M, T, P) :- w, input(R, M), tdom(T), posneg(P).
does(R, M, T, P) :- w, input(R, M), mtdom(T), posneg(P).
terminal(T, P) :- w, tdom(T), posneg(P).
terminated(T, P) :- w, tdom(T), posneg(P).
has_legal(R, T, P) :- w, tdom(T), role(R), posneg(P).
no_legal(T, P) :- w, tdom(T), posneg(P).
true(F, T, P) :- w, tdom(T), base(F), posneg(P).

:- not w.

%%%%%%%%% state manipulation

% init
w :- true(F, 1, 0), init(F), base(F).
w :- true(F, 1, 1), not init(F), base(F).

% when the game is not terminating, the player plays no move
w :- mtdom(T), terminated(T, 0), does(R, M, T, 0) : input(R, M).
%w :- 0 { does(R, M, T, 1) } 0, mtdom(T), role(R), terminated(T, 0), no_legal(T, 0).
% when the game terminates, the player plays a move
w :- mtdom(T), terminated(T, 1), does(R, M, T, 1).
% the player both play a move and not play a move
w :- does(R, M, T, 0), does(R, M, T, 1).
% the player plays more than 2 moves
w :- 2 { does(R, M, T, 1) }, mtdom(T), role(R).
% the player plays an illegal move
w :- does(R, M, T, 1), legal(R, M, T, 0), terminated(T, 0), no_legal(T, 0).
% the game must terminate and the player must always have legal actions along the way
w :- terminal(T, 1), no_legal(T, 0).

w :- legal(R, M, T, 0), legal(R, M, T, 1).
w :- has_legal(R, T, 0), legal(R, M, T, 1).
w :- has_legal(R, T, 1), legal(R, M, T, 0) : input(R, M).
w :- no_legal(T, 0), no_legal(T-1, 1), mtdom(T-1).
w :- no_legal(T, 0), terminated(T, 0), has_legal(R, T, 0) : role(R).
w :- no_legal(1, 1), terminated(1, 1).
w :- no_legal(1, 1), has_legal(R, 1, 1) : role(R).
w :- no_legal(T, 1), no_legal(T-1, 0), mtdom(T-1), terminated(T, 1).
w :- no_legal(T, 1), no_legal(T-1, 0), mtdom(T-1), has_legal(R, T, 1) : role(R).

w :- terminated(T, 0), terminal(T, 1).
w :- terminated(T, 0), terminated(T-1, 1), mtdom(T-1).
w :- terminated(T, 1), terminal(T, 0), terminated(T-1, 0), mtdom(T-1).
w :- terminated(T, 1), terminal(1, 0).


%%%%%%%%%%%%%%%% completion of legal and true


w :- legal(player, left, T, 0), true(s(1), T, 1).
w :- legal(player, left, T, 0), true(s(2), T, 1).
w :- legal(player, left, T, 1), true(s(1), T, 0), true(s(2), T, 0).
w :- legal(player, right, T, 0).
% s[7] should have no legal actions, but the player can play right to win the game
%w :- legal(player, right, T, 0), true(s(I), T, 1), I != 7, base(s(I)).
%w :- legal(player, right, T, 1), true(s(7), T, 1).


w :- true(s(1), T, 1), tdom(T), T > 1.
w :- true(s(I * 2), T + 1, 0), true(s(I), T, 1), mtdom(T), does(player, left, T, 1), base(s(I + I)), base(s(I)).
w :- true(s(I * 2 + 1), T + 1, 0), true(s(I), T, 1), mtdom(T), does(player, right, T, 1), base(s(I + I + 1)), base(s(I)).

w :- true(s(I * 2), T + 1, 1), 1{true(s(I), T, 0);does(player, left, T, 0)}, mtdom(T), base(s(I + I)), base(s(I)).
w :- true(s(I * 2 + 1), T + 1, 1), 1{true(s(I), T, 0);does(player, right, T, 0)},mtdom(T), base(s(I + I + 1)), base(s(I)).

%%%%%%%%%%%%%%%%%% completion of terminal/terminated/goal



w :- terminal(T, 0), true(s(9), T, 1), tdom(T).
w :- terminal(T, 0), true(s(11), T, 1), tdom(T).
w :- terminal(T, 0), true(s(15), T, 1), tdom(T).

w :- terminal(T, 1), true(s(9), T, 0), true(s(11), T, 0), true(s(15), T, 0), tdom(T).

%%%%%%%%%%%%%%%%%%%% original problem

tdom(1..4).
mtdom(1..3).
role(player).
input(player, left).
input(player, right).
base(s(1..15)).

init(s(1)).

% legal(player, left, T) :- tdom(T), true(s(1), T).
% legal(player, left, T) :- tdom(T), true(s(2), T).
% legal(player, right, T) :- tdom(T).


% true(s(I * 2), T + 1):- true(s(I), T), mtdom(T), does(player, left, T), base(s(I * 2)).
% true(s(I * 2 + 1), T + 1):- true(s(I), T), mtdom(T), does(player, right, T), base(s(I * 2 + 1)).

% %terminal(T) :- true(s(8), T).
% terminal(T) :- true(s(9), T), tdom(T).
% %terminal(T) :- true(s(10), T).
% terminal(T) :- true(s(11), T), tdom(T).
% %terminal(T) :- true(s(12), T).
% %terminal(T) :- true(s(7), T), tdom(T).
% terminal(T) :- true(s(13), T), tdom(T).
% %terminal(T) :- true(s(14), T).
% terminal(T) :- true(s(15), T), tdom(T).



% % 1 {does(player, M, T) : input(player, M)} 1 :- mtdom(T).
% % :- does(player, M, T), not legal(player, M, T).
% % :- 0 {terminated(T) : tdom(T)} 0.
% terminated(T) :- terminal(T), tdom(T).
% terminated(T + 1) :- terminated(T), tdom(T+1).
% w :- terminated(4).
% w :- does(player, M, T), not legal(player, M, T).
% w :- 0 {does(player, M, T) : input(player, M)} 0, mtdom(T), not terminated(T).
% w :- 2 {does(player, M, T) : input(player, M)}, mtdom(T), not terminated(T).

% %terminal(T) :- w, tdom(T).
% %true(F, T) :- w, base(F), tdom(T).

% does(player, M, T) : input(player, M) :- mtdom(T).

% does(player, M, T) :- w, input(player, M), mtdom(T).

% %legal(player, M, T) :- w, input(player, M), tdom(T).

#show.
%#show has_legal/3.
#show no_legal/2.
%#show legal/4.
#show legal(R,M,T) : legal(R,M,T,1).
#show does(R,M,T) : does(R,M,T,1).
#show true(S,T) : true(S, T, 1).
% #show w/0.
