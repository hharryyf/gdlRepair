% completion
wincond(1..8).
index(1..3,1..3).

% goal
d_goal(xplayer, 100, T, P) :- d_line(x, T, P).
d_goal(oplayer, 100, T, P) :- d_line(o, T, P).

d_goal(xplayer, 50, T, pos) :- d_goal(xplayer,100,T,neg), d_goal(oplayer,100,T,neg), d_empty(T,neg).
d_goal(xplayer, 50, T, neg) :- d_goal(xplayer,100,T,pos).
d_goal(xplayer, 50, T, neg) :- d_goal(oplayer,100,T,pos).
d_goal(xplayer, 50, T, neg) :- d_empty(T,pos).
d_goal(oplayer, 50, T, neg) :- d_goal(oplayer,100,T,pos).
d_goal(oplayer, 50, T, neg) :- d_goal(xplayer,100,T,pos).
d_goal(oplayer, 50, T, neg) :- d_empty(T,pos).

d_goal(R, 0, T, pos) :- role(R), d_goal(R,100,T,neg), d_goal(R,50,T,neg).
d_goal(R, 0, T, neg) :- role(R), d_goal(R,100,T,pos).
d_goal(R, 0, T, neg) :- role(R), d_goal(R,50,T,pos).
% terminal
d_terminal(T,pos) :- d_line(x,T,pos).
d_terminal(T,pos) :- d_line(o,T,pos).
d_terminal(T,pos) :- d_empty(T,neg).
d_terminal(T,neg) :- d_line(x,T,neg), d_line(o,T,neg), d_empty(T,pos).
% empty
d_cell_empty(X,Y,T,pos) :- d_true(cell(X,Y,x),T,neg), d_true(cell(X,Y,o),T,neg).
d_cell_empty(X,Y,T,neg) :- d_true(cell(X,Y,x),T,pos).
d_cell_empty(X,Y,T,neg) :- d_true(cell(X,Y,o),T,pos).
d_empty(T,neg) :- tdom(fluent, T), d_cell_empty(X,Y,T,neg) : index(X,Y). 
d_empty(T,pos) :- d_cell_empty(X,Y,T,pos).
% line
d_line_r(x,1,T,pos) :- d_true(cell(1,1,x),T,pos), d_true(cell(1,2,x),T,pos), d_true(cell(1,3,x),T,pos).
d_line_r(x,1,T,neg) :- d_true(cell(1,1,x),T,neg).
d_line_r(x,1,T,neg) :- d_true(cell(1,2,x),T,neg).
d_line_r(x,1,T,neg) :- d_true(cell(1,3,x),T,neg).


d_line_r(x,2,T,pos) :- d_true(cell(2,1,x),T,pos), d_true(cell(2,2,x),T,pos), d_true(cell(2,3,x),T,pos).
d_line_r(x,2,T,neg) :- d_true(cell(2,1,x),T,neg).
d_line_r(x,2,T,neg) :- d_true(cell(2,2,x),T,neg).
d_line_r(x,2,T,neg) :- d_true(cell(2,3,x),T,neg).


d_line_r(x,3,T,pos) :- d_true(cell(3,1,x),T,pos), d_true(cell(3,2,x),T,pos), d_true(cell(3,3,x),T,pos).
d_line_r(x,3,T,neg) :- d_true(cell(3,1,x),T,neg).
d_line_r(x,3,T,neg) :- d_true(cell(3,2,x),T,neg).
d_line_r(x,3,T,neg) :- d_true(cell(3,3,x),T,neg).


d_line_r(x,4,T,pos) :- d_true(cell(1,1,x),T,pos), d_true(cell(2,1,x),T,pos), d_true(cell(3,1,x),T,pos).
d_line_r(x,4,T,neg) :- d_true(cell(1,1,x),T,neg).
d_line_r(x,4,T,neg) :- d_true(cell(2,1,x),T,neg).
d_line_r(x,4,T,neg) :- d_true(cell(3,1,x),T,neg).


d_line_r(x,5,T,pos) :- d_true(cell(1,2,x),T,pos), d_true(cell(2,2,x),T,pos), d_true(cell(3,2,x),T,pos).
d_line_r(x,5,T,neg) :- d_true(cell(1,2,x),T,neg).
d_line_r(x,5,T,neg) :- d_true(cell(2,2,x),T,neg).
d_line_r(x,5,T,neg) :- d_true(cell(3,2,x),T,neg).

d_line_r(x,6,T,pos) :- d_true(cell(1,3,x),T,pos), d_true(cell(2,3,x),T,pos), d_true(cell(3,3,x),T,pos).
d_line_r(x,6,T,neg) :- d_true(cell(1,3,x),T,neg).
d_line_r(x,6,T,neg) :- d_true(cell(2,3,x),T,neg).
d_line_r(x,6,T,neg) :- d_true(cell(3,3,x),T,neg).


d_line_r(x,7,T,pos) :- d_true(cell(1,1,x),T,pos), d_true(cell(2,2,x),T,pos), d_true(cell(3,3,x),T,pos).
d_line_r(x,7,T,neg) :- d_true(cell(1,1,x),T,neg).
d_line_r(x,7,T,neg) :- d_true(cell(2,2,x),T,neg).
d_line_r(x,7,T,neg) :- d_true(cell(3,3,x),T,neg).



d_line_r(x,8,T,pos) :- d_true(cell(3,1,x),T,pos), d_true(cell(2,2,x),T,pos), d_true(cell(1,3,x),T,pos).
d_line_r(x,8,T,neg) :- d_true(cell(3,1,x),T,neg).
d_line_r(x,8,T,neg) :- d_true(cell(2,2,x),T,neg).
d_line_r(x,8,T,neg) :- d_true(cell(1,3,x),T,neg).


d_line_r(o,1,T,pos) :- d_true(cell(1,1,o),T,pos), d_true(cell(1,2,o),T,pos), d_true(cell(1,3,o),T,pos).
d_line_r(o,1,T,neg) :- d_true(cell(1,1,o),T,neg).
d_line_r(o,1,T,neg) :- d_true(cell(1,2,o),T,neg).
d_line_r(o,1,T,neg) :- d_true(cell(1,3,o),T,neg).


d_line_r(o,2,T,pos) :- d_true(cell(2,1,o),T,pos), d_true(cell(2,2,o),T,pos), d_true(cell(2,3,o),T,pos).
d_line_r(o,2,T,neg) :- d_true(cell(2,1,o),T,neg).
d_line_r(o,2,T,neg) :- d_true(cell(2,2,o),T,neg).
d_line_r(o,2,T,neg) :- d_true(cell(2,3,o),T,neg).


d_line_r(o,3,T,pos) :- d_true(cell(3,1,o),T,pos), d_true(cell(3,2,o),T,pos), d_true(cell(3,3,o),T,pos).
d_line_r(o,3,T,neg) :- d_true(cell(3,1,o),T,neg).
d_line_r(o,3,T,neg) :- d_true(cell(3,2,o),T,neg).
d_line_r(o,3,T,neg) :- d_true(cell(3,3,o),T,neg).


d_line_r(o,4,T,pos) :- d_true(cell(1,1,o),T,pos), d_true(cell(2,1,o),T,pos), d_true(cell(3,1,o),T,pos).
d_line_r(o,4,T,neg) :- d_true(cell(1,1,o),T,neg).
d_line_r(o,4,T,neg) :- d_true(cell(2,1,o),T,neg).
d_line_r(o,4,T,neg) :- d_true(cell(3,1,o),T,neg).


d_line_r(o,5,T,pos) :- d_true(cell(1,2,o),T,pos), d_true(cell(2,2,o),T,pos), d_true(cell(3,2,o),T,pos).
d_line_r(o,5,T,neg) :- d_true(cell(1,2,o),T,neg).
d_line_r(o,5,T,neg) :- d_true(cell(2,2,o),T,neg).
d_line_r(o,5,T,neg) :- d_true(cell(3,2,o),T,neg).

d_line_r(o,6,T,pos) :- d_true(cell(1,3,o),T,pos), d_true(cell(2,3,o),T,pos), d_true(cell(3,3,o),T,pos).
d_line_r(o,6,T,neg) :- d_true(cell(1,3,o),T,neg).
d_line_r(o,6,T,neg) :- d_true(cell(2,3,o),T,neg).
d_line_r(o,6,T,neg) :- d_true(cell(3,3,o),T,neg).


d_line_r(o,7,T,pos) :- d_true(cell(1,1,o),T,pos), d_true(cell(2,2,o),T,pos), d_true(cell(3,3,o),T,pos).
d_line_r(o,7,T,neg) :- d_true(cell(1,1,o),T,neg).
d_line_r(o,7,T,neg) :- d_true(cell(2,2,o),T,neg).
d_line_r(o,7,T,neg) :- d_true(cell(3,3,o),T,neg).



d_line_r(o,8,T,pos) :- d_true(cell(3,1,o),T,pos), d_true(cell(2,2,o),T,pos), d_true(cell(1,3,o),T,pos).
d_line_r(o,8,T,neg) :- d_true(cell(3,1,o),T,neg).
d_line_r(o,8,T,neg) :- d_true(cell(2,2,o),T,neg).
d_line_r(o,8,T,neg) :- d_true(cell(1,3,o),T,neg).



d_line(R,T,pos) :- d_line_r(R,X,T,pos).
d_line(R,T,neg) :- role(R), tdom(fluent, T), d_line_r(R,X,T,neg) : wincond(X).

