rule(1..17).
original_head(1,player,left). original_body(1,pos,s(1)).
original_head(2,player,left). original_body(2,pos,s(2)).
original_head(3,player,right). 
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
% disjunction
d_terminal(T, P) : polar(P) :- tdom(fluent,T).
% saturation
d_terminal(T, P) :- w, tdom(fluent,T), polar(P).


w :- d_terminal(T, neg), d_true(s(9), T, pos), tdom(fluent,T).
w :- d_terminal(T, neg), d_true(s(11), T, pos), tdom(fluent,T).
w :- d_terminal(T, neg), d_true(s(15), T, pos), tdom(fluent,T).

w :- d_terminal(T, pos), d_true(s(9), T, neg), d_true(s(11), T, neg), d_true(s(15), T, neg), tdom(fluent,T).



%%%%%%%%%%%%%%%%%%%% original problem

tdom(1..4).
role(player).
input(player, left).
input(player, right).
base(s(1..15)).
init(s(1)).

