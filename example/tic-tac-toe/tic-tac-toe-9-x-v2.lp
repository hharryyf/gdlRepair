tdom(1..10).
mtdom(1..9).
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
original_head(1, xplayer, noop). original_body(1, pos, control(oplayer)). 
original_head(2, oplayer, noop). original_body(2, pos, control(xplayer)). 
original_head(3, xplayer, mark(1,1)). original_body(3, pos, control(xplayer)). original_body(3, neg, cell(1,1,x)). original_body(3, neg, cell(1,1,o)). 
original_head(4, oplayer, mark(1,1)). original_body(4, pos, control(oplayer)). original_body(4, neg, cell(1,1,x)). original_body(4, neg, cell(1,1,o)). 
original_head(5, xplayer, mark(1,2)). original_body(5, pos, control(xplayer)). original_body(5, neg, cell(1,2,x)). original_body(5, neg, cell(1,2,o)). 
original_head(6, oplayer, mark(1,2)). original_body(6, pos, control(oplayer)). original_body(6, neg, cell(1,2,x)). original_body(6, neg, cell(1,2,o)). 
original_head(7, xplayer, mark(1,3)). original_body(7, pos, control(xplayer)). original_body(7, neg, cell(1,3,x)). original_body(7, neg, cell(1,3,o)). 
original_head(8, oplayer, mark(1,3)). original_body(8, pos, control(oplayer)). original_body(8, neg, cell(1,3,x)). original_body(8, neg, cell(1,3,o)). 
original_head(9, xplayer, mark(2,1)). original_body(9, pos, control(xplayer)). original_body(9, neg, cell(2,1,x)). original_body(9, neg, cell(2,1,o)). 
original_head(10, oplayer, mark(2,1)). original_body(10, pos, control(oplayer)). original_body(10, neg, cell(2,1,x)). original_body(10, neg, cell(2,1,o)). 
original_head(11, xplayer, mark(2,2)). original_body(11, pos, control(xplayer)). original_body(11, neg, cell(2,2,x)). original_body(11, neg, cell(2,2,o)). 
original_head(12, oplayer, mark(2,2)). original_body(12, pos, control(oplayer)). original_body(12, neg, cell(2,2,x)). original_body(12, neg, cell(2,2,o)). 
original_head(13, xplayer, mark(2,3)). original_body(13, pos, control(xplayer)). original_body(13, neg, cell(2,3,x)). original_body(13, neg, cell(2,3,o)). 
original_head(14, oplayer, mark(2,3)). original_body(14, pos, control(oplayer)). original_body(14, neg, cell(2,3,x)). original_body(14, neg, cell(2,3,o)). 
original_head(15, xplayer, mark(3,1)). original_body(15, pos, control(xplayer)). original_body(15, neg, cell(3,1,x)). original_body(15, neg, cell(3,1,o)). 
original_head(16, oplayer, mark(3,1)). original_body(16, pos, control(oplayer)). original_body(16, neg, cell(3,1,x)). original_body(16, neg, cell(3,1,o)). 
original_head(17, xplayer, mark(3,2)). original_body(17, pos, control(xplayer)). original_body(17, neg, cell(3,2,x)). original_body(17, neg, cell(3,2,o)). 
original_head(18, oplayer, mark(3,2)). original_body(18, pos, control(oplayer)). original_body(18, neg, cell(3,2,x)). original_body(18, neg, cell(3,2,o)). 
original_head(19, xplayer, mark(3,3)). original_body(19, pos, control(xplayer)). original_body(19, neg, cell(3,3,x)). original_body(19, neg, cell(3,3,o)). 
original_head(20, oplayer, mark(3,3)). original_body(20, pos, control(oplayer)). original_body(20, neg, cell(3,3,x)). original_body(20, neg, cell(3,3,o)). 
original_head(21, control(xplayer)). original_body(21, pos, control(oplayer)). 
original_head(22, control(oplayer)). original_body(22, pos, control(xplayer)). 
original_head(23, cell(1,1,x)). original_body(23, pos, xplayer, mark(1,1)). original_body(23, neg, cell(1,1,x)). original_body(23, neg, cell(1,1,o)). 
original_head(24, cell(1,1,x)). original_body(24, pos, oplayer, mark(1,1)). original_body(24, neg, cell(1,1,x)). original_body(24, neg, cell(1,1,o)). 
original_head(25, cell(1,1,x)). original_body(25, pos, cell(1,1,x)). 
original_head(26, cell(1,1,o)). original_body(26, pos, cell(1,1,o)). 
original_head(27, cell(1,2,x)). original_body(27, pos, xplayer, mark(1,2)). original_body(27, neg, cell(1,2,x)). original_body(27, neg, cell(1,2,o)). 
original_head(28, cell(1,2,x)). original_body(28, pos, oplayer, mark(1,2)). original_body(28, neg, cell(1,2,x)). original_body(28, neg, cell(1,2,o)). 
original_head(29, cell(1,2,x)). original_body(29, pos, cell(1,2,x)). 
original_head(30, cell(1,2,o)). original_body(30, pos, cell(1,2,o)). 
original_head(31, cell(1,3,x)). original_body(31, pos, xplayer, mark(1,3)). original_body(31, neg, cell(1,3,x)). original_body(31, neg, cell(1,3,o)). 
original_head(32, cell(1,3,x)). original_body(32, pos, oplayer, mark(1,3)). original_body(32, neg, cell(1,3,x)). original_body(32, neg, cell(1,3,o)). 
original_head(33, cell(1,3,x)). original_body(33, pos, cell(1,3,x)). 
original_head(34, cell(1,3,o)). original_body(34, pos, cell(1,3,o)). 
original_head(35, cell(2,1,x)). original_body(35, pos, xplayer, mark(2,1)). original_body(35, neg, cell(2,1,x)). original_body(35, neg, cell(2,1,o)). 
original_head(36, cell(2,1,x)). original_body(36, pos, oplayer, mark(2,1)). original_body(36, neg, cell(2,1,x)). original_body(36, neg, cell(2,1,o)). 
original_head(37, cell(2,1,x)). original_body(37, pos, cell(2,1,x)). 
original_head(38, cell(2,1,o)). original_body(38, pos, cell(2,1,o)). 
original_head(39, cell(2,2,x)). original_body(39, pos, xplayer, mark(2,2)). original_body(39, neg, cell(2,2,x)). original_body(39, neg, cell(2,2,o)). 
original_head(40, cell(2,2,x)). original_body(40, pos, oplayer, mark(2,2)). original_body(40, neg, cell(2,2,x)). original_body(40, neg, cell(2,2,o)). 
original_head(41, cell(2,2,x)). original_body(41, pos, cell(2,2,x)). 
original_head(42, cell(2,2,o)). original_body(42, pos, cell(2,2,o)). 
original_head(43, cell(2,3,x)). original_body(43, pos, xplayer, mark(2,3)). original_body(43, neg, cell(2,3,x)). original_body(43, neg, cell(2,3,o)). 
original_head(44, cell(2,3,x)). original_body(44, pos, oplayer, mark(2,3)). original_body(44, neg, cell(2,3,x)). original_body(44, neg, cell(2,3,o)). 
original_head(45, cell(2,3,x)). original_body(45, pos, cell(2,3,x)). 
original_head(46, cell(2,3,o)). original_body(46, pos, cell(2,3,o)). 
original_head(47, cell(3,1,x)). original_body(47, pos, xplayer, mark(3,1)). original_body(47, neg, cell(3,1,x)). original_body(47, neg, cell(3,1,o)). 
original_head(48, cell(3,1,x)). original_body(48, pos, oplayer, mark(3,1)). original_body(48, neg, cell(3,1,x)). original_body(48, neg, cell(3,1,o)). 
original_head(49, cell(3,1,x)). original_body(49, pos, cell(3,1,x)). 
original_head(50, cell(3,1,o)). original_body(50, pos, cell(3,1,o)). 
original_head(51, cell(3,2,x)). original_body(51, pos, xplayer, mark(3,2)). original_body(51, neg, cell(3,2,x)). original_body(51, neg, cell(3,2,o)). 
original_head(52, cell(3,2,x)). original_body(52, pos, oplayer, mark(3,2)). original_body(52, neg, cell(3,2,x)). original_body(52, neg, cell(3,2,o)). 
original_head(53, cell(3,2,x)). original_body(53, pos, cell(3,2,x)). 
original_head(54, cell(3,2,o)). original_body(54, pos, cell(3,2,o)). 
original_head(55, cell(3,3,x)). original_body(55, pos, xplayer, mark(3,3)). original_body(55, neg, cell(3,3,x)). original_body(55, neg, cell(3,3,o)). 
original_head(56, cell(3,3,x)). original_body(56, pos, oplayer, mark(3,3)). original_body(56, neg, cell(3,3,x)). original_body(56, neg, cell(3,3,o)). 
original_head(57, cell(3,3,x)). original_body(57, pos, cell(3,3,x)). 
original_head(58, cell(3,3,o)). original_body(58, pos, cell(3,3,o)). 
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
