
d_terminal(T,P) : polar(P) :- tdom(T).
d_goal(robot,100,T,P) : polar(P) :- tdom(T).
d_goal(robot,0,T,P) : polar(P) :- tdom(T).

d_terminal(T,P) :- w, polar(P), tdom(T).
d_goal(robot,100,T,P) :- w, polar(P), tdom(T).
d_goal(robot,0,T,P) :- w, polar(P), tdom(T).

w :- d_goal(robot,100,T,neg), d_true(on(a,c),T,pos), d_true(on(b,c),T,pos).
w :- d_goal(robot,100,T,pos), d_true(on(a,c),T,neg).
w :- d_goal(robot,100,T,pos), d_true(on(b,c),T,neg).
w :- d_goal(robot,0,T,neg), d_true(on(a,c),T,neg).
w :- d_goal(robot,0,T,neg), d_true(on(b,c),T,neg).
w :- d_goal(robot,0,T,pos), d_true(on(b,c),T,pos), d_true(on(a,c),T,pos).
w :- d_terminal(T,neg), d_true(step(4),T,pos).
w :- d_terminal(T,neg), d_true(on(b,c),T,pos), d_true(on(a,c),T,pos).
w :- d_terminal(T,pos), d_true(step(4),T,neg), d_true(on(b,c),T,neg).
w :- d_terminal(T,pos), d_true(step(4),T,neg), d_true(on(a,c),T,neg).




