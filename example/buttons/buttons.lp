role(robot).

base(p).
base(q).
base(r).
base(round(1..7)).

tdom(1..7).
mtdom(1..6).
input(robot, a).
input(robot, b).
input(robot, c).

init(round(1)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% fix

legal_rule(1..3).
old_rule(1..17).
rule(1..17).



original_head(1, robot, a).
original_head(2, robot, b).
original_head(3, robot, c).
original_head(4, p). original_body(4, pos, robot, a). original_body(4, neg, p).
original_head(5, p). original_body(5, pos, robot, b). original_body(5, pos, q).
original_head(6, p). original_body(6, neg, robot, a). original_body(6, neg, robot, b). original_body(6, pos, p).
original_head(7, q). original_body(7, pos, robot, b). original_body(7, pos, p).
original_head(8, q). original_body(8, pos, robot, c). original_body(8, pos, r).
original_head(9, q). original_body(9, neg, robot, b). original_body(9, neg, robot, c). original_body(9, pos, q).
original_head(10, r). original_body(10, pos, robot, c). original_body(10, pos, q). 
original_head(11, r). original_body(11, neg, robot, c). original_body(11, pos, r).
original_head(12, round(2)). original_body(12, pos, round(1)).
original_head(13, round(3)). original_body(13, pos, round(2)).
original_head(14, round(4)). original_body(14, pos, round(3)).
original_head(15, round(5)). original_body(15, pos, round(4)).
original_head(16, round(6)). original_body(16, pos, round(5)).
original_head(17, round(7)). original_body(17, pos, round(6)).


{add_body(I, P, R, A) : rule(I), input(R, A), polar(P) ; 
remove_body(I, P, R, A) : polar(P), rule(I), input(R, A) ; 
add_body(I, P, F) : rule(I), base(F), polar(P) ; 
remove_body(I, P, F) : polar(P), rule(I), base(F)} 0.

{add_head(I) : rule(I) ; remove_head(I) : rule(I)} 0.


%%%%%%%%%%%%%%%%%%%%%%%% goal and terminal

goal(robot, 100, J, T) :- true(p, J, T), true(q, J, T), true(r, J, T), tdom(T), program(J).
goal(robot, 0, J, T) :- not true(p, J, T), tdom(T), program(J).
goal(robot, 0, J, T) :- not true(q, J, T), tdom(T), program(J).
goal(robot, 0, J, T) :- not true(r, J, T), tdom(T), program(J).


terminal(J, T) :- true(p, J, T), true(q, J, T), true(r, J, T), tdom(T), program(J).
terminal(J, T) :- true(round(7), J, T), tdom(T), program(J).

