
d_goal(robot,100,T,pos) :- d_true(on(a,c),T,pos), d_true(on(b,c),T,pos).
d_goal(robot,100,T,neg) :- d_true(on(a,c),T,neg).
d_goal(robot,100,T,neg) :- d_true(on(b,c),T,neg).
d_goal(robot,0,T,pos) :- d_true(on(a,c),T,neg).
d_goal(robot,0,T,pos) :- d_true(on(b,c),T,neg).
d_goal(robot,0,T,neg) :- d_true(on(b,c),T,pos), d_true(on(a,c),T,pos).
d_terminal(T,pos) :- d_true(step(4),T,pos).
d_terminal(T,pos) :- d_true(on(b,c),T,pos), d_true(on(a,c),T,pos).
d_terminal(T,neg) :- d_true(step(4),T,neg), d_true(on(b,c),T,neg).
d_terminal(T,neg) :- d_true(step(4),T,neg), d_true(on(a,c),T,neg).




