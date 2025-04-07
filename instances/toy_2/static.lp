tdom(1..2).
role(p). 
base(win). 
base(loss). 
input(p,l). 
input(p,r).
legal_rule(1..1).
old_rule(1..3).
rule(1..4).
terminal(J,T) :- true(win,J,T), tdom(T), program(J).   
terminal(J,T) :- true(loss,J,T), tdom(T), program(J).  
goal(p,100,J,T):- true(win,J,T), tdom(T), program(J).
