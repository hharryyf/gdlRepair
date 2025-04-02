% blocks world with unsolvable goal, on(a,c) and on(b,c)
role(robot).
tdom(1..4).
base(clear(a)).
base(clear(b)).
base(clear(c)).
base(table(a)).
base(table(b)).
base(table(c)).
base(on(a,b)).
base(on(a,c)).
base(on(b,a)).
base(on(b,c)).
base(on(c,a)).
base(on(c,b)).
base(step(1)).
base(step(2)).
base(step(3)).
base(step(4)).
input(robot,s(a,b)).
input(robot,s(a,c)).
input(robot,s(b,a)).
input(robot,s(b,c)).
input(robot,s(c,a)).
input(robot,s(c,b)).
input(robot,u(a,b)).
input(robot,u(a,c)).
input(robot,u(b,a)).
input(robot,u(b,c)).
input(robot,u(c,a)).
input(robot,u(c,b)).
init(clear(b)).
init(clear(c)).
init(on(c,a)).
init(table(a)).
init(table(b)).
init(step(1)).
legal_rule(1..12).
old_rule(1..152).
rule(1..154).
goal(robot,100,J,T) :- true(on(a,b),J,T), true(on(b,c),J,T), true(table(c),J,T), program(J), tdom(T).
goal(robot,0,J,T) :- not true(on(a,c),J,T), program(J), tdom(T).
goal(robot,0,J,T) :- not true(on(b,c),J,T), program(J), tdom(T).
goal(robot,0,J,T) :- not true(table(c),J,T), program(J), tdom(T).
terminal(J,T) :- true(step(4),J,T), program(J), tdom(T).
terminal(J,T) :- true(on(a,b),J,T), true(on(b,c),J,T), true(table(c),J,T), program(J), tdom(T).
