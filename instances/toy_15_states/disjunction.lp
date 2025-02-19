% disjunction
d_terminal(T, P) : polar(P) :- tdom(fluent,T).
d_goal(player,100,T,P) : polar(P) :- tdom(fluent,T).
d_goal(player,0,T,P) : polar(P) :- tdom(fluent,T).
% saturation
d_terminal(T, P) :- w, tdom(fluent,T), polar(P).
d_goal(player,100,T,P) :- w, polar(P), tdom(fluent,T).
d_goal(player,0,T,P) :- w, polar(P), tdom(fluent,T).

w :- d_terminal(T, neg), d_true(s(9), T, pos), tdom(fluent,T).
w :- d_terminal(T, neg), d_true(s(11), T, pos), tdom(fluent,T).
w :- d_terminal(T, neg), d_true(s(15), T, pos), tdom(fluent,T).
w :- d_terminal(T, pos), d_true(s(9), T, neg), d_true(s(11), T, neg), d_true(s(15), T, neg), tdom(fluent,T).
w :- d_goal(player,100,T,neg), d_true(s(9), T, pos).
w :- d_goal(player,100,T,pos), d_true(s(9), T, neg).
w :- d_goal(player,0,T,neg), d_goal(player,100,T,neg).
w :- d_goal(player,0,T,pos), d_goal(player,100,T,pos).

