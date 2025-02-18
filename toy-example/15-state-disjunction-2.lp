rule(1..17).
original_head(1,player,left). original_body(1,pos,s(1)).
original_head(2,player,left). original_body(2,pos,s(2)).
original_head(3,player,right). original_body(3,neg,s(7)).
original_head(4,s(2)). original_body(4,pos,s(1)). original_body(4,pos,player,left).
original_head(5,s(3)). original_body(5,pos,s(1)). original_body(5,pos,player,right).
original_head(6,s(4)). original_body(6,pos,s(2)). original_body(6,pos,player,left).
original_head(7,s(5)). original_body(7,pos,s(2)). original_body(7,pos,player,right).
original_head(8,s(6)). original_body(8,pos,s(3)). original_body(8,pos,player,left).
original_head(9,s(7)). original_body(9,pos,s(3)). original_body(9,pos,player,right).
original_head(10,s(8)). original_body(10,pos,s(4)). original_body(10,pos,player,left).
original_head(11,s(9)). original_body(11,pos,s(4)). original_body(11,pos,player,right).
original_head(12,s(10)). original_body(12,pos,s(5)). original_body(12,pos,player,left).
original_head(13,s(11)). original_body(13,pos,s(5)). original_body(13,pos,player,right).
original_head(14,s(12)). original_body(14,pos,s(6)). original_body(14,pos,player,left).
original_head(15,s(13)). original_body(15,pos,s(6)). original_body(15,pos,player,right).
original_head(16,s(14)). original_body(16,pos,s(7)). original_body(16,pos,player,left).
original_head(17,s(15)). original_body(17,pos,s(7)). original_body(17,pos,player,right).

%%%%%%%%%%%%%%%%%% completion of terminal/terminated/goal




d_terminal(T, pos) :- d_true(s(9), T, pos), tdom(fluent,T).
d_terminal(T, pos) :- d_true(s(11), T, pos), tdom(fluent,T).
d_terminal(T, pos) :- d_true(s(7), T, pos), tdom(fluent,T).
d_terminal(T, neg) :- d_true(s(9), T, neg), d_true(s(11), T, neg), d_true(s(7), T, neg), tdom(fluent,T).


polar(pos;neg).
o_body(I,P,fluent,F) :- original_body(I,P,F). o_body(I,P,act,(R,A)) :- original_body(I,P,R,A).
o_head(I,fluent,F) :- original_head(I,F). o_head(I,act,(R,A)) :- original_head(I,R,A).
atom(fluent, F) :- base(F). atom(act, (R,A)) :- input(R, A).
tdom(act, T) :- tdom(T), tdom(T+1). tdom(fluent, T) :- tdom(T).
body(I,P,T,F) :- o_body(I,P,T,F).
head(I,T,F) :- o_head(I,T,F).

%%%%%%%%%%%%%%%%%%%% original problem

tdom(1..4).
role(player).
input(player, left).
input(player, right).
base(s(1..15)).
init(s(1)).

