tdom(1..4).
role(player).
input(player, left).
input(player, right).
base(s(1..15)).
init(s(1)).
rule(1..17).
old_rule(1..17).


terminal(J,T) :-true(s(9),J,T), tdom(fluent,T), program(J).
terminal(J,T) :-true(s(11),J,T), tdom(fluent,T), program(J).
terminal(J,T) :-true(s(15),J, T), tdom(fluent,T), program(J).
goal(player,100,J,T) :- true(s(9),J,T), tdom(fluent,T), program(J).
goal(player, 0, J, T) :- not goal(player,100,J,T), program(J), tdom(fluent,T).