d_terminal(T,P) : polar(P) :- tdom(T).
d_terminal(T,P) :- w, polar(P), tdom(T).

w :- d_terminal(T,neg), d_true(step(15), T, pos).
w :- d_terminal(T,neg), d_true(cell(1,1,1),T,pos), d_true(cell(1,2,2),T,pos), d_true(cell(1,3,3),T,pos), d_true(cell(2,1,4),T,pos), d_true(cell(2,2,5),T,pos), d_true(cell(2,3,6),T,pos), d_true(cell(3,1,7),T,pos), d_true(cell(3,2,8),T,pos), d_true(cell(3,3,b),T,pos).
w :- d_terminal(T,pos), d_true(step(15), T, neg), d_true(cell(1,1,1),T,neg).
w :- d_terminal(T,pos), d_true(step(15), T, neg), d_true(cell(1,2,2),T,neg).
w :- d_terminal(T,pos), d_true(step(15), T, neg), d_true(cell(1,3,3),T,neg).
w :- d_terminal(T,pos), d_true(step(15), T, neg), d_true(cell(2,1,4),T,neg).
w :- d_terminal(T,pos), d_true(step(15), T, neg), d_true(cell(2,2,5),T,neg).
w :- d_terminal(T,pos), d_true(step(15), T, neg), d_true(cell(2,3,6),T,neg).
w :- d_terminal(T,pos), d_true(step(15), T, neg), d_true(cell(3,1,7),T,neg).
w :- d_terminal(T,pos), d_true(step(15), T, neg), d_true(cell(3,2,8),T,neg).
w :- d_terminal(T,pos), d_true(step(15), T, neg), d_true(cell(3,3,b),T,neg).
