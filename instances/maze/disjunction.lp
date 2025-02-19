d_goal(robot,100,T,P) : polar(P) :- tdom(T).

d_terminal(T,P) : polar(P) :- tdom(T).

d_goal(robot, 100,T,P) :- w, polar(P), tdom(T). 
d_terminal(T,P) :- w, polar(P), tdom(T).

w :- d_goal(robot,100,T,neg), d_true(goal(a),T,pos), tdom(T).
w :- d_goal(robot,100,T,pos), d_true(goal(a),T,neg), tdom(T).
w :- d_terminal(T,neg), d_true(step(6),T,pos), tdom(T).
w :- d_terminal(T,neg), d_true(gold(a),T,pos), tdom(T).
w :- d_terminal(T,pos), d_true(gold(a),T,neg), d_true(step(6),T,neg), tdom(T).
