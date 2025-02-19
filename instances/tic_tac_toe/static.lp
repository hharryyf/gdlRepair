% tic-tac-toe with error
% o can never take control
tdom(1..10).
role(xplayer).
role(oplayer).
base(cell(1..3,1..3,x)).
base(cell(1..3,1..3,o)).
base(control(xplayer)).
base(control(oplayer)).
input(xplayer, mark(1..3,1..3)).
input(oplayer, mark(1..3,1..3)).
input(xplayer, noop).
input(oplayer, noop).
init(control(xplayer)).
legal_rule(1..20).
old_rule(1..58).
rule(1..58).
empty(J,T) :- not true(cell(X,Y,x), J, T), base(cell(X,Y,x)), not true(cell(X,Y,o),J,T), base(cell(X,Y,o)), program(J), tdom(T).
terminal(J,T) :- not empty(J,T), program(J), tdom(T).
goal(xplayer, 50, J, T) :- not empty(J,T), program(J), tdom(T), not goal(xplayer, 100, J, T), not goal(oplayer, 100, J, T).
goal(oplayer, 50, J, T) :- not empty(J,T), program(J), tdom(T), not goal(xplayer, 100, J, T), not goal(oplayer, 100, J, T).
goal(xplayer, 0, J, T) :- not goal(xplayer, 50, J, T), not goal(xplayer, 100, J, T), program(J), tdom(T).
goal(oplayer, 0, J, T) :- not goal(oplayer, 50, J, T), not goal(oplayer, 100, J, T), program(J), tdom(T).
goal(xplayer, 100, J, T) :- true(cell(1,1,x),J,T),true(cell(2,1,x),J,T),true(cell(3,1,x),J,T), program(J), tdom(T).
goal(oplayer, 100, J, T) :- true(cell(1,1,o),J,T),true(cell(2,1,o),J,T),true(cell(3,1,o),J,T), program(J), tdom(T).
terminal(J, T) :- true(cell(1,1,x),J,T),true(cell(2,1,x),J,T),true(cell(3,1,x),J,T), program(J), tdom(T).
terminal(J, T) :- true(cell(1,1,o),J,T),true(cell(2,1,o),J,T),true(cell(3,1,o),J,T), program(J), tdom(T).
goal(xplayer, 100, J, T) :- true(cell(1,1,x),J,T),true(cell(1,2,x),J,T),true(cell(1,3,x),J,T), program(J), tdom(T).
goal(oplayer, 100, J, T) :- true(cell(1,1,o),J,T),true(cell(1,2,o),J,T),true(cell(1,3,o),J,T), program(J), tdom(T).
terminal(J, T) :- true(cell(1,1,x),J,T),true(cell(1,2,x),J,T),true(cell(1,3,x),J,T), program(J), tdom(T).
terminal(J, T) :- true(cell(1,1,o),J,T),true(cell(1,2,o),J,T),true(cell(1,3,o),J,T), program(J), tdom(T).
goal(xplayer, 100, J, T) :- true(cell(1,2,x),J,T),true(cell(2,2,x),J,T),true(cell(3,2,x),J,T), program(J), tdom(T).
goal(oplayer, 100, J, T) :- true(cell(1,2,o),J,T),true(cell(2,2,o),J,T),true(cell(3,2,o),J,T), program(J), tdom(T).
terminal(J, T) :- true(cell(1,2,x),J,T),true(cell(2,2,x),J,T),true(cell(3,2,x),J,T), program(J), tdom(T).
terminal(J, T) :- true(cell(1,2,o),J,T),true(cell(2,2,o),J,T),true(cell(3,2,o),J,T), program(J), tdom(T).
goal(xplayer, 100, J, T) :- true(cell(2,1,x),J,T),true(cell(2,2,x),J,T),true(cell(2,3,x),J,T), program(J), tdom(T).
goal(oplayer, 100, J, T) :- true(cell(2,1,o),J,T),true(cell(2,2,o),J,T),true(cell(2,3,o),J,T), program(J), tdom(T).
terminal(J, T) :- true(cell(2,1,x),J,T),true(cell(2,2,x),J,T),true(cell(2,3,x),J,T), program(J), tdom(T).
terminal(J, T) :- true(cell(2,1,o),J,T),true(cell(2,2,o),J,T),true(cell(2,3,o),J,T), program(J), tdom(T).
goal(xplayer, 100, J, T) :- true(cell(1,3,x),J,T),true(cell(2,3,x),J,T),true(cell(3,3,x),J,T), program(J), tdom(T).
goal(oplayer, 100, J, T) :- true(cell(1,3,o),J,T),true(cell(2,3,o),J,T),true(cell(3,3,o),J,T), program(J), tdom(T).
terminal(J, T) :- true(cell(1,3,x),J,T),true(cell(2,3,x),J,T),true(cell(3,3,x),J,T), program(J), tdom(T).
terminal(J, T) :- true(cell(1,3,o),J,T),true(cell(2,3,o),J,T),true(cell(3,3,o),J,T), program(J), tdom(T).
goal(xplayer, 100, J, T) :- true(cell(3,1,x),J,T),true(cell(3,2,x),J,T),true(cell(3,3,x),J,T), program(J), tdom(T).
goal(oplayer, 100, J, T) :- true(cell(3,1,o),J,T),true(cell(3,2,o),J,T),true(cell(3,3,o),J,T), program(J), tdom(T).
terminal(J, T) :- true(cell(3,1,x),J,T),true(cell(3,2,x),J,T),true(cell(3,3,x),J,T), program(J), tdom(T).
terminal(J, T) :- true(cell(3,1,o),J,T),true(cell(3,2,o),J,T),true(cell(3,3,o),J,T), program(J), tdom(T).
goal(xplayer, 100, J, T) :- true(cell(1,1,x),J,T),true(cell(2,2,x),J,T),true(cell(3,3,x),J,T), program(J), tdom(T).
goal(oplayer, 100, J, T) :- true(cell(1,1,o),J,T),true(cell(2,2,o),J,T),true(cell(3,3,o),J,T), program(J), tdom(T).
terminal(J, T) :- true(cell(1,1,x),J,T),true(cell(2,2,x),J,T),true(cell(3,3,x),J,T), program(J), tdom(T).
terminal(J, T) :- true(cell(1,1,o),J,T),true(cell(2,2,o),J,T),true(cell(3,3,o),J,T), program(J), tdom(T).
goal(xplayer, 100, J, T) :- true(cell(1,3,x),J,T),true(cell(2,2,x),J,T),true(cell(3,1,x),J,T), program(J), tdom(T).
goal(oplayer, 100, J, T) :- true(cell(1,3,o),J,T),true(cell(2,2,o),J,T),true(cell(3,1,o),J,T), program(J), tdom(T).
terminal(J, T) :- true(cell(1,3,x),J,T),true(cell(2,2,x),J,T),true(cell(3,1,x),J,T), program(J), tdom(T).
terminal(J, T) :- true(cell(1,3,o),J,T),true(cell(2,2,o),J,T),true(cell(3,1,o),J,T), program(J), tdom(T).
