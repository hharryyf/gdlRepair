%%%%%%%%%%%%%%%%%%%%%%%%%%%% encoding
polar(pos;neg).
opp(pos,neg). opp(neg,pos).
atom(fluent, F) :- base(F). atom(act, (R,A)) :- input(R, A).
o_body(I,P,fluent,F) :- original_body(I,P,F). o_body(I,P,act,(R,A)) :- original_body(I,P,R,A).
o_head(I,fluent,F) :- original_head(I,F). o_head(I,act,(R,A)) :- original_head(I,R,A).
atom(fluent, F) :- base(F). atom(act, (R,A)) :- input(R, A).
tdom(act, T) :- tdom(T), tdom(T+1). tdom(fluent, T) :- tdom(T).

%head(I,T,F) :- o_head(I,T,F). body(I,P,T,F) :- o_body(I,P,T,F).

% universal variables
d_true(F, T, P) : polar(P) :- tdom(fluent,T), base(F).
d_terminated(T, P) : polar(P) :- tdom(fluent,T).
d_does(R, M, T, P) : polar(P) :- input(R, M), tdom(fluent,T), role(R).
d_legal(R, M, T, P) : polar(P) :- input(R, M), tdom(fluent,T).
d_activated_h(I,P,TYPE,F,T,E) : polar(E) :- rule(I), atom(TYPE,F), polar(P), tdom(fluent, T).
d_activated_r(I,T,E) : polar(E) :- rule(I), tdom(fluent, T).
has_legal(R, T, P) : polar(P) :- tdom(fluent,T), role(R).
no_legal(T, P) : polar(P) :- tdom(fluent,T), role(R).

%%%%%%%%%%% saturation technique
d_legal(R, M, T, P) :- w, input(R, M), tdom(fluent,T), polar(P).
d_does(R, M, T, P) :- w, input(R, M), tdom(fluent,T), polar(P).
d_terminated(T, P) :- w, tdom(fluent,T), polar(P).
has_legal(R, T, P) :- w, tdom(fluent,T), role(R), polar(P).
no_legal(T, P) :- w, tdom(fluent,T), polar(P).
d_true(F, T, P) :- w, tdom(fluent,T), base(F), polar(P).
d_activated_h(I,P,TYPE,F,T,E) :- w, polar(E), rule(I), atom(TYPE,F), polar(P), tdom(fluent, T).
d_activated_r(I,T,E) :- w, polar(E), rule(I), tdom(fluent, T).
%:- not w.

%%%%%%%%% state manipulation
w :- role(R), tdom(fluent,T), d_terminated(T, neg), d_does(R, M, T, neg) : input(R, M). % when the game is not terminating, the player plays no move
w :- tdom(fluent,T), d_terminated(T, pos), d_does(R, M, T, pos). % when the game terminates, the player plays a move
w :- d_does(R, M, T, neg), d_does(R, M, T, pos). % the player both play a move and not play a move
w :- 2 { d_does(R, M, T, pos) }, tdom(fluent,T), role(R). % the player plays more than 2 moves
w :- d_does(R, M, T, pos), d_legal(R, M, T, neg), d_terminated(T, neg), no_legal(T, neg). % the player plays an illegal move
w :- d_terminal(T, pos), no_legal(T, neg). % the game must terminate and the player must always have legal actions along the way

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
w :- base(F), d_true(F,1,neg), init(F).
w :- base(F), d_true(F,1,pos), not init(F).
% body error
w :- d_activated_h(I,P,fluent,F,T,pos), body(I,P,fluent,F), d_true(F,T,E), opp(E,P).
w :- d_activated_h(I,P,act,(R,A),T,pos), body(I,P,act,(R,A)), d_does(R,A,T,E), opp(E,P).
w :- d_activated_h(I,P,TP,F,T,neg), body(I,P,TP,F), d_does(R,A,T,P) : F=(R,A), TP=act; d_true(F,T,P) : TP=fluent.
w :- d_activated_h(I,P,TYPE,F,T,neg), not body(I,P,TYPE,F).
% rule error
w :- d_activated_r(I,T,pos), d_activated_h(I,P,TYPE,F,T,neg).
w :- d_activated_r(I,T,neg), d_activated_h(I,P,TYPE,F,T,pos) : polar(P), atom(TYPE,F).
% legal/next error
w :- d_legal(R,A,T,neg), head(I,act,(R,A)), d_activated_r(I,T, pos), tdom(fluent,T).
w :- d_legal(R,A,T,pos), tdom(fluent,T), d_activated_r(I,T, neg) : head(I,act,(R,A)).
w :- d_legal(R,A,T,pos), 0 {head(I,act,(R,A)) : rule(I)} 0, tdom(fluent,T).

w :- d_true(F,T+1,neg), head(I,fluent,F), d_activated_r(I,T, pos), tdom(act,T).
w :- d_true(F,T+1,pos), tdom(act,T), d_activated_r(I,T, neg) : head(I,fluent,F).
w :- d_true(F,T+1,pos), 0 {head(I,fluent,F) : rule(I)} 0, tdom(act,T).

%#show d_legal/4.
%#show.
#show d_does(R,M,T) : d_does(R,M,T,pos).
%#show d_true/3.
#show w/0.
