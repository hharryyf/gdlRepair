% disjunction
score(0;50;100).
wincond(1..8).
index(1..3,1..3).
d_terminal(T, P) : polar(P) :- tdom(fluent,T).
d_goal(R,S,T,P) : polar(P) :- tdom(fluent, T), score(S), role(R).
d_empty(T, P) : polar(P) :- tdom(fluent, T).
d_cell_empty(X,Y,T,P) : polar(P) :- tdom(fluent,T), index(X,Y).
d_line_r(x,X,T,P) : polar(P) :- tdom(fluent,T), wincond(X).
d_line_r(o,X,T,P) : polar(P) :- tdom(fluent,T), wincond(X).
d_line(x, T, P) : polar(P) :- tdom(fluent, T).
d_line(o, T, P) : polar(P) :- tdom(fluent, T).
% saturation
d_terminal(T, P) :- w, tdom(fluent,T), polar(P).
d_goal(R,S,T,P) :- w, polar(P), tdom(fluent, T), score(S), role(R).
d_empty(T, P) :- w, polar(P), tdom(fluent, T).
d_cell_empty(X,Y,T,P) :- w, index(X,Y), polar(P), tdom(fluent, T).
d_line(x, T, P) :- w, polar(P), tdom(fluent, T).
d_line(o, T, P) :- w, polar(P), tdom(fluent, T).
d_line_r(x,X,T,P) :- w, polar(P), tdom(fluent, T), wincond(X).
d_line_r(o,X,T,P) :- w, polar(P), tdom(fluent, T), wincond(X).
% completion

% goal
w :- d_goal(xplayer, 100, T, P1), d_line(x, T, P2), opp(P1, P2).
w :- d_goal(oplayer, 100, T, P1), d_line(o, T, P2), opp(P1, P2).

w :- d_goal(xplayer, 50, T, neg), d_goal(xplayer,100,T,neg), d_goal(oplayer,100,T,neg), d_empty(T,neg).
w :- d_goal(xplayer, 50, T, pos), d_goal(xplayer,100,T,pos).
w :- d_goal(xplayer, 50, T, pos), d_goal(oplayer,100,T,pos).
w :- d_goal(xplayer, 50, T, pos), d_empty(T,pos).
w :- d_goal(oplayer, 50, T, pos), d_goal(oplayer,100,T,pos).
w :- d_goal(oplayer, 50, T, pos), d_goal(xplayer,100,T,pos).
w :- d_goal(oplayer, 50, T, pos), d_empty(T,pos).

w :- d_goal(R, 0, T, neg), role(R), d_goal(R,100,T,neg), d_goal(R,50,T,neg).
w :- d_goal(R, 0, T, pos), role(R), d_goal(R,100,T,pos).
w :- d_goal(R, 0, T, pos), role(R), d_goal(R,50,T,pos).
% terminal
w :- d_terminal(T,neg), d_line(x,T,pos).
w :- d_terminal(T,neg),d_line(o,T,pos).
w :- d_terminal(T,neg), d_empty(T,neg).
w :- d_terminal(T,pos), d_line(x,T,neg), d_line(o,T,neg), d_empty(T,pos).
% empty
w :- d_cell_empty(X,Y,T,neg), d_true(cell(X,Y,x),T,neg), d_true(cell(X,Y,o),T,neg).
w :- d_cell_empty(X,Y,T,pos), d_true(cell(X,Y,x),T,pos).
w :- d_cell_empty(X,Y,T,pos), d_true(cell(X,Y,o),T,pos).
w :- d_empty(T,pos), d_cell_empty(X,Y,T,neg) : index(X,Y). 
w :- d_empty(T,neg), d_cell_empty(X,Y,T,pos).
% line
w :- d_line_r(x,1,T,neg), d_true(cell(1,1,x),T,pos), d_true(cell(1,2,x),T,pos), d_true(cell(1,3,x),T,pos).
w :- d_line_r(x,1,T,pos), d_true(cell(1,1,x),T,neg).
w :- d_line_r(x,1,T,pos), d_true(cell(1,2,x),T,neg).
w :- d_line_r(x,1,T,pos), d_true(cell(1,3,x),T,neg).


w :- d_line_r(x,2,T,neg), d_true(cell(2,1,x),T,pos), d_true(cell(2,2,x),T,pos), d_true(cell(2,3,x),T,pos).
w :- d_line_r(x,2,T,pos), d_true(cell(2,1,x),T,neg).
w :- d_line_r(x,2,T,pos), d_true(cell(2,2,x),T,neg).
w :- d_line_r(x,2,T,pos), d_true(cell(2,3,x),T,neg).


w :- d_line_r(x,3,T,neg), d_true(cell(3,1,x),T,pos), d_true(cell(3,2,x),T,pos), d_true(cell(3,3,x),T,pos).
w :- d_line_r(x,3,T,pos), d_true(cell(3,1,x),T,neg).
w :- d_line_r(x,3,T,pos), d_true(cell(3,2,x),T,neg).
w :- d_line_r(x,3,T,pos), d_true(cell(3,3,x),T,neg).


w :- d_line_r(x,4,T,neg), d_true(cell(1,1,x),T,pos), d_true(cell(2,1,x),T,pos), d_true(cell(3,1,x),T,pos).
w :- d_line_r(x,4,T,pos), d_true(cell(1,1,x),T,neg).
w :- d_line_r(x,4,T,pos), d_true(cell(2,1,x),T,neg).
w :- d_line_r(x,4,T,pos), d_true(cell(3,1,x),T,neg).


w :- d_line_r(x,5,T,neg), d_true(cell(1,2,x),T,pos), d_true(cell(2,2,x),T,pos), d_true(cell(3,2,x),T,pos).
w :- d_line_r(x,5,T,pos), d_true(cell(1,2,x),T,neg).
w :- d_line_r(x,5,T,pos), d_true(cell(2,2,x),T,neg).
w :- d_line_r(x,5,T,pos), d_true(cell(3,2,x),T,neg).


w :- d_line_r(x,6,T,neg), d_true(cell(1,3,x),T,pos), d_true(cell(2,3,x),T,pos), d_true(cell(3,3,x),T,pos).
w :- d_line_r(x,6,T,pos), d_true(cell(1,3,x),T,neg).
w :- d_line_r(x,6,T,pos), d_true(cell(2,3,x),T,neg).
w :- d_line_r(x,6,T,pos), d_true(cell(3,3,x),T,neg).


w :- d_line_r(x,7,T,neg), d_true(cell(1,1,x),T,pos), d_true(cell(2,2,x),T,pos), d_true(cell(3,3,x),T,pos).
w :- d_line_r(x,7,T,pos), d_true(cell(1,1,x),T,neg).
w :- d_line_r(x,7,T,pos), d_true(cell(2,2,x),T,neg).
w :- d_line_r(x,7,T,pos), d_true(cell(3,3,x),T,neg).



w :- d_line_r(x,8,T,neg), d_true(cell(3,1,x),T,pos), d_true(cell(2,2,x),T,pos), d_true(cell(1,3,x),T,pos).
w :- d_line_r(x,8,T,pos), d_true(cell(3,1,x),T,neg).
w :- d_line_r(x,8,T,pos), d_true(cell(2,2,x),T,neg).
w :- d_line_r(x,8,T,pos), d_true(cell(1,3,x),T,neg).


w :- d_line_r(o,1,T,neg), d_true(cell(1,1,o),T,pos), d_true(cell(1,2,o),T,pos), d_true(cell(1,3,o),T,pos).
w :- d_line_r(o,1,T,pos), d_true(cell(1,1,o),T,neg).
w :- d_line_r(o,1,T,pos), d_true(cell(1,2,o),T,neg).
w :- d_line_r(o,1,T,pos), d_true(cell(1,3,o),T,neg).


w :- d_line_r(o,2,T,neg), d_true(cell(2,1,o),T,pos), d_true(cell(2,2,o),T,pos), d_true(cell(2,3,o),T,pos).
w :- d_line_r(o,2,T,pos), d_true(cell(2,1,o),T,neg).
w :- d_line_r(o,2,T,pos), d_true(cell(2,2,o),T,neg).
w :- d_line_r(o,2,T,pos), d_true(cell(2,3,o),T,neg).


w :- d_line_r(o,3,T,neg), d_true(cell(3,1,o),T,pos), d_true(cell(3,2,o),T,pos), d_true(cell(3,3,o),T,pos).
w :- d_line_r(o,3,T,pos), d_true(cell(3,1,o),T,neg).
w :- d_line_r(o,3,T,pos), d_true(cell(3,2,o),T,neg).
w :- d_line_r(o,3,T,pos), d_true(cell(3,3,o),T,neg).


w :- d_line_r(o,4,T,neg), d_true(cell(1,1,o),T,pos), d_true(cell(2,1,o),T,pos), d_true(cell(3,1,o),T,pos).
w :- d_line_r(o,4,T,pos), d_true(cell(1,1,o),T,neg).
w :- d_line_r(o,4,T,pos), d_true(cell(2,1,o),T,neg).
w :- d_line_r(o,4,T,pos), d_true(cell(3,1,o),T,neg).


w :- d_line_r(o,5,T,neg), d_true(cell(1,2,o),T,pos), d_true(cell(2,2,o),T,pos), d_true(cell(3,2,o),T,pos).
w :- d_line_r(o,5,T,pos), d_true(cell(1,2,o),T,neg).
w :- d_line_r(o,5,T,pos), d_true(cell(2,2,o),T,neg).
w :- d_line_r(o,5,T,pos), d_true(cell(3,2,o),T,neg).


w :- d_line_r(o,6,T,neg), d_true(cell(1,3,o),T,pos), d_true(cell(2,3,o),T,pos), d_true(cell(3,3,o),T,pos).
w :- d_line_r(o,6,T,pos), d_true(cell(1,3,o),T,neg).
w :- d_line_r(o,6,T,pos), d_true(cell(2,3,o),T,neg).
w :- d_line_r(o,6,T,pos), d_true(cell(3,3,o),T,neg).


w :- d_line_r(o,7,T,neg), d_true(cell(1,1,o),T,pos), d_true(cell(2,2,o),T,pos), d_true(cell(3,3,o),T,pos).
w :- d_line_r(o,7,T,pos), d_true(cell(1,1,o),T,neg).
w :- d_line_r(o,7,T,pos), d_true(cell(2,2,o),T,neg).
w :- d_line_r(o,7,T,pos), d_true(cell(3,3,o),T,neg).



w :- d_line_r(o,8,T,neg), d_true(cell(3,1,o),T,pos), d_true(cell(2,2,o),T,pos), d_true(cell(1,3,o),T,pos).
w :- d_line_r(o,8,T,pos), d_true(cell(3,1,o),T,neg).
w :- d_line_r(o,8,T,pos), d_true(cell(2,2,o),T,neg).
w :- d_line_r(o,8,T,pos), d_true(cell(1,3,o),T,neg).


w :- d_line(R,T,neg), d_line_r(R,X,T,pos).
w :- d_line(R,T,pos), d_line_r(R,X,T,neg) : wincond(X).

% w :- d_line(x,T,neg), d_true(cell(1,1,x),T,pos), d_true(cell(1,2,x),T,pos), d_true(cell(1,3,x),T,pos).
% w :- d_line(x,T,neg), d_true(cell(2,1,x),T,pos), d_true(cell(2,2,x),T,pos), d_true(cell(2,3,x),T,pos). 
% w :- d_line(x,T,neg), d_true(cell(3,1,x),T,pos), d_true(cell(3,2,x),T,pos), d_true(cell(3,3,x),T,pos).
% w :- d_line(x,T,neg), d_true(cell(1,1,x),T,pos), d_true(cell(2,1,x),T,pos), d_true(cell(3,1,x),T,pos).
% w :- d_line(x,T,neg), d_true(cell(1,2,x),T,pos), d_true(cell(2,2,x),T,pos), d_true(cell(3,2,x),T,pos).
% w :- d_line(x,T,neg), d_true(cell(1,3,x),T,pos), d_true(cell(2,3,x),T,pos), d_true(cell(3,3,x),T,pos).
% w :- d_line(x,T,neg), d_true(cell(1,1,x),T,pos), d_true(cell(2,2,x),T,pos), d_true(cell(3,3,x),T,pos).
% w :- d_line(x,T,neg), d_true(cell(3,1,x),T,pos), d_true(cell(2,2,x),T,pos), d_true(cell(1,3,x),T,pos).
% w :- d_line(x,T,pos), 1{d_true(cell(1,1,x),T,neg);d_true(cell(2,1,x),T,neg);d_true(cell(3,1,x),T,neg)},
%                     1{d_true(cell(1,2,x),T,neg);d_true(cell(2,2,x),T,neg);d_true(cell(3,2,x),T,neg)},
%                     1{d_true(cell(1,3,x),T,neg);d_true(cell(2,3,x),T,neg);d_true(cell(3,3,x),T,neg)},
%                     1{d_true(cell(1,1,x),T,neg);d_true(cell(1,2,x),T,neg);d_true(cell(1,3,x),T,neg)},
%                     1{d_true(cell(2,1,x),T,neg);d_true(cell(2,2,x),T,neg);d_true(cell(2,3,x),T,neg)},
%                     1{d_true(cell(3,1,x),T,neg);d_true(cell(3,2,x),T,neg);d_true(cell(3,3,x),T,neg)},
%                     1{d_true(cell(1,3,x),T,neg);d_true(cell(2,2,x),T,neg);d_true(cell(3,1,x),T,neg)},
%                     1{d_true(cell(1,1,x),T,neg);d_true(cell(2,2,x),T,neg);d_true(cell(3,3,x),T,neg)}.

% w :- d_line(o,T,neg), d_true(cell(1,1,o),T,pos), d_true(cell(1,2,o),T,pos), d_true(cell(1,3,o),T,pos).
% w :- d_line(o,T,neg), d_true(cell(2,1,o),T,pos), d_true(cell(2,2,o),T,pos), d_true(cell(2,3,o),T,pos). 
% w :- d_line(o,T,neg), d_true(cell(3,1,o),T,pos), d_true(cell(3,2,o),T,pos), d_true(cell(3,3,o),T,pos).
% w :- d_line(o,T,neg), d_true(cell(1,1,o),T,pos), d_true(cell(2,1,o),T,pos), d_true(cell(3,1,o),T,pos).
% w :- d_line(o,T,neg), d_true(cell(1,2,o),T,pos), d_true(cell(2,2,o),T,pos), d_true(cell(3,2,o),T,pos).
% w :- d_line(o,T,neg), d_true(cell(1,3,o),T,pos), d_true(cell(2,3,o),T,pos), d_true(cell(3,3,o),T,pos).
% w :- d_line(o,T,neg), d_true(cell(1,1,o),T,pos), d_true(cell(2,2,o),T,pos), d_true(cell(3,3,o),T,pos).
% w :- d_line(o,T,neg), d_true(cell(1,3,o),T,pos), d_true(cell(2,2,o),T,pos), d_true(cell(3,1,o),T,pos).
% w :- d_line(o,T,pos), 1{d_true(cell(1,1,o),T,neg);d_true(cell(2,1,o),T,neg);d_true(cell(3,1,o),T,neg)},
%                     1{d_true(cell(1,2,o),T,neg);d_true(cell(2,2,o),T,neg);d_true(cell(3,2,o),T,neg)},
%                     1{d_true(cell(1,3,o),T,neg);d_true(cell(2,3,o),T,neg);d_true(cell(3,3,o),T,neg)},
%                     1{d_true(cell(1,1,o),T,neg);d_true(cell(1,2,o),T,neg);d_true(cell(1,3,o),T,neg)},
%                     1{d_true(cell(2,1,o),T,neg);d_true(cell(2,2,o),T,neg);d_true(cell(2,3,o),T,neg)},
%                     1{d_true(cell(3,1,o),T,neg);d_true(cell(3,2,o),T,neg);d_true(cell(3,3,o),T,neg)},
%                     1{d_true(cell(1,3,o),T,neg);d_true(cell(2,2,o),T,neg);d_true(cell(3,1,o),T,neg)},
%                     1{d_true(cell(1,1,o),T,neg);d_true(cell(2,2,o),T,neg);d_true(cell(3,3,o),T,neg)}.
% w :- d_empty(T,pos), d_true(cell(X,Y,x),T,neg), d_true(cell(X,Y,o),T,neg).
% w :- d_empty(T,neg), 1{d_true(cell(1,1,x),T,pos); d_true(cell(1,1,o),T,pos)}, 
%                    1{d_true(cell(1,2,x),T,pos); d_true(cell(1,2,o),T,pos)},
%                    1{d_true(cell(1,3,x),T,pos); d_true(cell(1,3,o),T,pos)},
%                    1{d_true(cell(2,1,x),T,pos); d_true(cell(2,1,o),T,pos)},
%                    1{d_true(cell(2,2,x),T,pos); d_true(cell(2,2,o),T,pos)},
%                    1{d_true(cell(2,3,x),T,pos); d_true(cell(2,3,o),T,pos)},
%                    1{d_true(cell(3,1,x),T,pos); d_true(cell(3,1,o),T,pos)},
%                    1{d_true(cell(3,2,x),T,pos); d_true(cell(3,2,o),T,pos)},
%                    1{d_true(cell(3,3,x),T,pos); d_true(cell(3,3,o),T,pos)}.

