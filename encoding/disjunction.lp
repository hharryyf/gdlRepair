%%%%%%%%%%%%%%%%%%%%%%%%%%%% encoding
polar(pos;neg).
opp(pos,neg). opp(neg,pos).
% universal variables
d_true(s(I), T, P) : polar(P) :- tdom(fluent,T), base(s(I)).
d_terminal(T, P) : polar(P) :- tdom(fluent,T).
d_terminated(T, P) : polar(P) :- tdom(fluent,T).
d_does(R, M, T, P) : polar(P) :- input(player, M), tdom(fluent,T), role(R).
d_legal(R, M, T, P) : polar(P) :- input(R, M), tdom(fluent,T).
d_activated_h(I,P,TYPE,F,T,E) : polar(E) :- rule(I), atom(TYPE,F), polar(P), tdom(fluent, T).
d_activated_r(I,T,E) : polar(E) :- rule(I), tdom(fluent, T).
has_legal(R, T, P) : polar(P) :- tdom(fluent,T), role(R).
no_legal(T, P) : polar(P) :- tdom(fluent,T), role(R).

%%%%%%%%%%% saturation technique

d_legal(R, M, T, P) :- w, input(R, M), tdom(fluent,T), polar(P).
d_does(R, M, T, P) :- w, input(R, M), tdom(fluent,T), polar(P).
d_terminal(T, P) :- w, tdom(fluent,T), polar(P).
d_terminated(T, P) :- w, tdom(fluent,T), polar(P).
has_legal(R, T, P) :- w, tdom(fluent,T), role(R), polar(P).
no_legal(T, P) :- w, tdom(fluent,T), polar(P).
d_true(F, T, P) :- w, tdom(fluent,T), base(F), polar(P).
d_activated_h(I,P,TYPE,F,T,E) :- w, polar(E), rule(I), atom(TYPE,F), polar(P), tdom(fluent, T).
d_activated_r(I,T,E) :- w, polar(E), rule(I), tdom(fluent, T).
:- not w.

%%%%%%%%% state manipulation


w :- tdom(fluent,T), d_terminated(T, neg), d_does(R, M, T, neg) : input(R, M). % when the game is not terminating, the player plays no move
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

w :- base(F), d_true(F,1,P), init(F) : P=neg; not init(F) : P=pos. % init activation error

% body activation error
w :- d_activated_h(I,P,fluent,F,T,pos), body(I,P,fluent,F), d_true(F,T,E), opp(E,P).
w :- d_activated_h(I,P,act,(R,A),T,pos), body(I,P,act,(R,A)), d_does(R,A,T,E), opp(E,P).

w :- d_activated_h(I,P,TP,F,T,neg), body(I,P,TP,F), d_does(R,A,T,P) : F=(R,A), TP=act;
                                                    d_true(F,T,P) : TP=fluent.
w :- d_activated_h(I,P,TYPE,F,T,neg), not body(I,P,TYPE,F).

% rule activation error
w :- d_activated_r(I,T,pos), d_activated_h(I,P,TYPE,F,T,neg).
w :- d_activated_r(I,T,neg), d_activated_h(I,P,TYPE,F,T,pos) : polar(P), atom(TYPE,F).

% legal/next activation error
w :- d_legal(R,A,T,neg), head(I,act,(R,A)), d_activated_r(I,T, pos), tdom(fluent,T).
w :- d_legal(R,A,T,pos), tdom(fluent,T), d_activated_r(I,T, neg) : head(I,act,(R,A)).
w :- d_legal(R,A,T,pos), 0 {head(I,act,(R,A)) : rule(I)} 0, tdom(fluent,T).

w :- d_true(F,T+1,neg), head(I,fluent,F), d_activated_r(I,T, pos), tdom(act,T).
w :- d_true(F,T+1,pos), tdom(act,T), d_activated_r(I,T, neg) : head(I,fluent,F).
w :- d_true(F,T+1,pos), 0 {head(I,fluent,F) : rule(I)} 0, tdom(act,T).

%%%%%%%%%%%%%%%%%%%%%% game rule
rule(1..17).
htype(1..2,act).
htype(3..17,fluent).
head(1,act,(player,left)). body(1,pos,fluent,s(1)).
head(2,act,(player,left)). body(2,pos,fluent,s(2)).
head(3,act,(player,right)). 
head(4,fluent,s(2)). body(4,pos,fluent,s(1)). body(4,pos,act,(player,left)).
head(5,fluent,s(3)). body(5,pos,fluent,s(1)). body(5,pos,act,(player,right)).
head(6,fluent,s(4)). body(6,pos,fluent,s(2)). body(6,pos,act,(player,left)).
head(7,fluent,s(5)). body(7,pos,fluent,s(2)). body(7,pos,act,(player,right)).
head(8,fluent,s(6)). body(8,pos,fluent,s(3)). body(8,pos,act,(player,left)).
head(9,fluent,s(7)). body(9,pos,fluent,s(3)). body(9,pos,act,(player,right)).
head(10,fluent,s(8)). body(10,pos,fluent,s(4)). body(10,pos,act,(player,left)).
head(11,fluent,s(9)). body(11,pos,fluent,s(4)). body(11,pos,act,(player,right)).
head(12,fluent,s(10)). body(12,pos,fluent,s(5)). body(12,pos,act,(player,left)).
head(13,fluent,s(11)). body(13,pos,fluent,s(5)). body(13,pos,act,(player,right)).
head(14,fluent,s(12)). body(14,pos,fluent,s(6)). body(14,pos,act,(player,left)).
head(15,fluent,s(13)). body(15,pos,fluent,s(6)). body(15,pos,act,(player,right)).
head(16,fluent,s(14)). body(16,pos,fluent,s(7)). body(16,pos,act,(player,left)).
head(17,fluent,s(15)). body(17,pos,fluent,s(7)). body(17,pos,act,(player,right)).

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

atom(fluent, F) :- base(F). atom(act, (R,A)) :- input(R, A).

%#show d_legal/4.
#show d_does/4.
%#show d_true/3.
#show w/0.
