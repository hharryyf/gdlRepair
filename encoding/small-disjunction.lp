%%%%%%%%%%%%%%%%%%%%%%%%%%%% encoding
polar(pos;neg).
opp(pos,neg). opp(neg,pos).
% disjunctions

d_true(s(I), T, P) : polar(P) :- tdom(fluent,T), base(s(I)).
d_terminal(T, P) : polar(P) :- tdom(fluent,T).
d_terminated(T, P) : polar(P) :- tdom(fluent,T).

d_does(R, M, T, P) : polar(P) :- input(player, M), tdom(act,T), role(R).
d_legal(R, M, T, P) : polar(P) :- input(R, M), tdom(fluent,T).
% error if no legal action at some state
has_legal(R, T, P) : polar(P) :- tdom(fluent,T), role(R).
no_legal(T, P) : polar(P) :- tdom(fluent,T), role(R).

%%%%%%%%%%% saturation technique

d_legal(R, M, T, P) :- w, input(R, M), tdom(fluent,T), polar(P).
d_does(R, M, T, P) :- w, input(R, M), tdom(act,T), polar(P).
d_terminal(T, P) :- w, tdom(fluent,T), polar(P).
d_terminated(T, P) :- w, tdom(fluent,T), polar(P).
has_legal(R, T, P) :- w, tdom(fluent,T), role(R), polar(P).
no_legal(T, P) :- w, tdom(fluent,T), polar(P).
d_true(F, T, P) :- w, tdom(fluent,T), base(F), polar(P).

:- not w.

%%%%%%%%% state manipulation

% init
w :- d_true(F, 1, neg), init(F), base(F).
w :- d_true(F, 1, pos), not init(F), base(F).

% when the game is not terminating, the player plays no move
w :- tdom(act,T), d_terminated(T, neg), d_does(R, M, T, neg) : input(R, M).
%w :- 0 { does(R, M, T, 1) } 0, mtdom(T), role(R), terminated(T, 0), no_legal(T, 0).
% when the game terminates, the player plays a move
w :- tdom(act,T), d_terminated(T, pos), d_does(R, M, T, pos).
% the player both play a move and not play a move
w :- d_does(R, M, T, neg), d_does(R, M, T, pos).
% the player plays more than 2 moves
w :- 2 { d_does(R, M, T, pos) }, tdom(act,T), role(R).
% the player plays an illegal move
w :- d_does(R, M, T, pos), d_legal(R, M, T, neg), d_terminated(T, neg), no_legal(T, neg).
% the game must terminate and the player must always have legal actions along the way
w :- d_terminal(T, pos), no_legal(T, neg). % add new constraints for other logical properties

w :- d_legal(R, M, T, neg), d_legal(R, M, T, pos).
w :- has_legal(R, T, neg), d_legal(R, M, T, pos).
w :- has_legal(R, T, pos), d_legal(R, M, T, neg) : input(R, M).
w :- no_legal(T, neg), no_legal(T-1, pos), tdom(act,T-1).
w :- no_legal(T, neg), d_terminated(T, neg), has_legal(R, T, neg) : role(R).
w :- no_legal(1, pos), d_terminated(1, pos).
w :- no_legal(1, pos), has_legal(R, 1, pos) : role(R).
w :- no_legal(T, pos), no_legal(T-1, neg), tdom(act,T-1), d_terminated(T, pos).
w :- no_legal(T, pos), no_legal(T-1, neg), tdom(act,T-1), has_legal(R, T, pos) : role(R).

w :- d_terminated(T, neg), d_terminal(T, pos).
w :- d_terminated(T, neg), d_terminated(T-1, pos), tdom(act,T-1).
w :- d_terminated(T, pos), d_terminal(T, neg), d_terminated(T-1, neg), tdom(act,T-1).
w :- d_terminated(1, pos), d_terminal(1, neg).
%%%%%%%%%%%%%%%% completion of legal and true

w :- d_legal(player, left, T, neg), d_true(s(1), T, pos).
w :- d_legal(player, left, T, neg), d_true(s(2), T, pos).
w :- d_legal(player, left, T, pos), d_true(s(1), T, neg), d_true(s(2), T, neg).
w :- d_legal(player, right, T, neg).
% s[7] should have no legal actions, but the player can play right to win the game
%w :- d_legal(player, right, T, neg), d_true(s(I), T, pos), I != 7, base(s(I)).
%w :- d_legal(player, right, T, pos), d_true(s(7), T, pos).

w :- d_true(s(1), T, pos), tdom(fluent,T), T > 1.
w :- d_true(s(I * 2), T + 1, neg), d_true(s(I), T, pos), tdom(act,T), d_does(player, left, T, pos), base(s(I + I)), base(s(I)).
w :- d_true(s(I * 2 + 1), T + 1, neg), d_true(s(I), T, pos), tdom(act,T), d_does(player, right, T, pos), base(s(I + I + 1)), base(s(I)).

w :- d_true(s(I * 2), T + 1, pos), 1{d_true(s(I), T, neg);d_does(player, left, T, neg)}, tdom(act,T), base(s(I + I)), base(s(I)).
w :- d_true(s(I * 2 + 1), T + 1, pos), 1{d_true(s(I), T, neg);d_does(player, right, T, neg)},tdom(act,T), base(s(I + I + 1)), base(s(I)).

%%%%%%%%%%%%%%%%%% completion of terminal/terminated/goal
w :- d_terminal(T, neg), d_true(s(9), T, pos), tdom(fluent,T).
w :- d_terminal(T, neg), d_true(s(11), T, pos), tdom(fluent,T).
w :- d_terminal(T, neg), d_true(s(15), T, pos), tdom(fluent,T).

w :- d_terminal(T, pos), d_true(s(9), T, neg), d_true(s(11), T, neg), d_true(s(15), T, neg), tdom(fluent,T).

%%%%%%%%%%%%%%%%%%%% original problem

tdom(fluent,1..4).
tdom(act,1..3).
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

#show.
%#show has_legal/3.
#show no_legal/2.
%#show legal/4.
#show d_legal(R,M,T) : d_legal(R,M,T,pos).
#show d_does(R,M,T) : d_does(R,M,T,pos).
#show d_true(S,T) : d_true(S, T, pos).
% #show w/0.
