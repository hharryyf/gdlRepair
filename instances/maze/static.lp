tdom(1..10).
role(robot).
base(cell(a)).
base(cell(b)).
base(cell(c)).
base(cell(d)).
base(gold(a)).
base(gold(b)).
base(gold(c)).
base(gold(d)).
base(gold(i)).
base(step(1)).
base(step(2)).
base(step(3)).
base(step(4)).
base(step(5)).
base(step(6)).
base(step(7)).
base(step(8)).
base(step(9)).
base(step(10)).
input(robot,move).
input(robot,grab).
input(robot,drop).
init(cell(a)).
init(gold(c)).
init(step(1)).
legal_rule(1..6).
old_rule(1..62).
rule(1..62).
goal(robot,100,J,T) :- true(gold(a),J,T), program(J), tdom(T).
terminal(J,T) :- program(J), tdom(T), true(step(6),J, T).
terminal(J,T) :- program(J), tdom(T), true(gold(a), J,T).
