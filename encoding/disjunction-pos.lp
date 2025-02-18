%%%%%%%%%%%%%%%%%%%%%%%%%%%% encoding
opp(pos,neg). opp(neg,pos).

% universal variables
d_does(R, M, T, P) : polar(P) :- input(R, M), tdom(fluent,T), role(R).
%%%%%%%%%%% saturation technique
d_does(R, M, T, P) :- w, input(R, M), tdom(fluent,T), polar(P).
:- not w.

%%%%%%%%% state manipulation
w :- role(R), tdom(fluent,T), d_terminated(T, neg), d_does(R, M, T, neg) : input(R, M). % when the game is not terminating, the player plays no move
w :- tdom(fluent,T), d_terminated(T, pos), d_does(R, M, T, pos). % when the game terminates, the player plays a move
w :- d_does(R, M, T, neg), d_does(R, M, T, pos). % the player both play a move and not play a move
w :- d_does(R, M1, T, pos), d_does(R, M2, T, pos), M1 < M2, tdom(fluent,T), role(R). % the player plays more than 2 moves
%w :- 2 { d_does(R, M, T, pos) }, tdom(fluent,T), role(R). % the player plays more than 2 moves
w :- d_does(R, M, T, pos), d_legal(R, M, T, neg), d_terminated(T, neg), no_legal(T, neg). % the player plays an illegal move
w :- d_terminal(T, pos), no_legal(T, neg). % the game must terminate and the player must always have legal actions along the way

has_legal(R, T, pos) :- d_legal(R, M, T, pos).
has_legal(R, T, neg) :- role(R), tdom(fluent, T), d_legal(R, M, T, neg) : input(R, M).
no_legal(T, pos) :- no_legal(T-1, pos), tdom(act,T-1).
no_legal(T, pos) :- d_terminated(T, neg), has_legal(R, T, neg) : role(R).
no_legal(1, neg) :- d_terminated(1, pos).
no_legal(1, neg) :- has_legal(R, 1, pos) : role(R).
no_legal(T, neg) :- no_legal(T-1, neg), tdom(act,T-1), d_terminated(T, pos).
no_legal(T, neg) :- no_legal(T-1, neg), tdom(act,T-1), has_legal(R, T, pos) : role(R).

d_terminated(T, pos) :- d_terminal(T, pos).
d_terminated(T, pos) :- d_terminated(T-1, pos), tdom(act,T-1).
d_terminated(T, neg) :- d_terminal(T, neg), d_terminated(T-1, neg), tdom(act,T-1).
d_terminated(1, neg) :- d_terminal(1, neg).
%%%%%%%%%%%%%%%% completion of legal and true
d_true(F,1,pos) :- base(F), init(F).
d_true(F,1,neg) :- base(F), not init(F).
% body error
d_activated_h(I,P,fluent,F,T,neg) :- body(I,P,fluent,F), d_true(F,T,E), opp(E,P).
d_activated_h(I,P,act,(R,A),T,neg) :- body(I,P,act,(R,A)), d_does(R,A,T,E), opp(E,P).
d_activated_h(I,P,act,(R,A),T,pos) :- body(I,P,act,F), d_does(R,A,T,P).
d_activated_h(I,P,fluent,F,T,pos) :- body(I,P,fluent,F), d_true(F,T,P).
d_activated_h(I,P,TYPE,F,T,pos) :- not body(I,P,TYPE,F), atom(TYPE,F), polar(P), rule(I), tdom(fluent, T).
% rule error
d_activated_r(I,T,neg) :- d_activated_h(I,P,TYPE,F,T,neg).
d_activated_r(I,T,pos) :- tdom(fluent, T), rule(I), d_activated_h(I,P,TYPE,F,T,pos) : polar(P), atom(TYPE,F).
% legal/next error
d_legal(R,A,T,pos) :- head(I,act,(R,A)), d_activated_r(I,T, pos), tdom(fluent,T).
d_legal(R,A,T,neg) :- tdom(fluent,T), input(R,A), d_activated_r(I,T, neg) : head(I,act,(R,A)).
d_legal(R,A,T,neg) :- input(R,A), 0 {head(I,act,(R,A)) : rule(I)} 0, tdom(fluent,T).

d_true(F,T+1,pos) :- head(I,fluent,F), d_activated_r(I,T, pos), tdom(act,T).
d_true(F,T+1,neg) :- base(F), tdom(act,T), d_activated_r(I,T, neg) : head(I,fluent,F).
d_true(F,T+1,neg) :- base(F), 0 {head(I,fluent,F) : rule(I)} 0, tdom(act,T).

%#show d_legal/4.
%#show.
%#show d_does(R,M,T) : d_does(R,M,T,pos).
%#show d_true/3.
#show w/0.
