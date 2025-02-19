% 8-puzzle middle game position, swapped 2 adjacency cells, should have a solution within 14 moves
tdom(1..15).
mtdom(1..14).
role(player).
base(step(1..15)).
base(cell(1..3,1..3,1..8)).
base(cell(1..3,1..3,b)).
input(player, move(1..3,1..3)).
init(cell(1,1,1)).
init(cell(1,2,8)).
init(cell(1,3,3)).
init(cell(2,1,4)).
init(cell(2,2,b)).
init(cell(2,3,2)).
init(cell(3,1,7)).
init(cell(3,2,6)).
init(cell(3,3,5)).
init(step(1)).
legal_rule(1..24).
old_rule(1..1583).
rule(1..1583).
goal(player, 100, J, T) :- true(cell(1,1,1), J, T), true(cell(1,2,2), J, T), true(cell(1,3,3), J, T), true(cell(2,1,4), J, T), true(cell(2,2,5), J, T), true(cell(2,3,6), J, T), true(cell(3,1,7), J, T), true(cell(3,2,8), J, T), true(cell(3,3,b), J, T), program(J), tdom(T).
goal(player, 0, J, T) :- not goal(player, 100, J, T), tdom(T), program(J).
terminal(J, T) :- goal(player, 100, J, T), program(J), tdom(T).
terminal(J, T) :- true(step(15), J, T), program(J), tdom(T).

