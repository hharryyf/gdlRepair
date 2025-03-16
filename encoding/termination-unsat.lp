program(tl).
atom(fluent, F) :- base(F). atom(act, (R,A)) :- input(R, A).
tdom(act, T) :- tdom(T), tdom(T+1). tdom(fluent, T) :- tdom(T).
polar(pos;neg).

% activated_h(I,P,TYPE,H,tl,T) :- holds(body(I,P,TYPE,H)), tdom(TYPE,T), program(tl), true(H,tl,T) : TYPE=fluent, P=pos;
%                                                                            not true(H,tl,T) : TYPE=fluent, P=neg;
%                                                                            does(R,A,tl,T) : TYPE=act,H=(R,A), P=pos;
%                                                                            not does(R,A,tl,T) : TYPE=act,H=(R,A), P=neg.
% activated_h(I,P,TYPE,H,tl,T) :- tdom(TYPE,T), program(tl), rule(I), polar(P), atom(TYPE,H), not holds(body(I,P,TYPE,H)).



% % generate the legal rule and the next rule
% legal(R,A,tl,T) :- program(tl), tdom(fluent,T), holds(head(I,act,(R,A))), activated_h(I,P,fluent,F,tl,T) : atom(fluent,F), polar(P).
% true(F,tl,T+1)  :- program(tl), tdom(act,T),    holds(head(I,fluent,F)),  activated_h(I,P,TYPE,H,tl,T) : atom(TYPE,H), polar(P).



ferr(I,J,T) :- holds(body(I,pos,fluent,F)), tdom(fluent,T), program(J), not true(F,J,T).
ferr(I,J,T) :- holds(body(I,neg,fluent,F)), tdom(fluent,T), program(J), true(F,J,T).
aerr(I,J,T) :- holds(body(I,pos,act,(R,A))), tdom(act,T), program(J), not does(R,A,J,T).
aerr(I,J,T) :- holds(body(I,neg,act,(R,A))), tdom(act,T), program(J), does(R,A,J,T).

legal(R,A,J,T) :- program(J), tdom(fluent,T), holds(head(I,act,(R,A))), not ferr(I,J,T).
true(F,J,T+1)  :- program(J), tdom(act,T),    holds(head(I,fluent,F)),  not ferr(I,J,T),  not aerr(I,J,T).


% init
true(F, tl, 1) :- init(F), base(F), program(tl).


% either player takes control not both
%bad_control(tl, 1) :- true(control(x), tl, 1), true(control(o), tl, 1).
%bad_control(tl, 1) :- not true(control(x), tl, 1), not true(control(o), tl, 1).
%bad_control(tl, 2) :- true(control(x), tl, 2), true(control(o), tl, 2).
%bad_control(tl, 2) :- not true(control(x), tl, 2), not true(control(o), t%bad_cell(tl, T) :- true(cell(X,Y,x), tl, T), true(cell(X,Y,o), tl, T), tdom(fluent, T), base(cell(X,Y,x)).
% bad_control(tl, T+1) :- true(control(xplayer), tl, T), not true(control(oplayer), tl, T+1), tdom(fluent, T+1).
% bad_control(tl, T+1) :- true(control(oplayer), tl, T), not true(control(xplayer), tl, T+1), tdom(fluent, T+1).
% bad_control(tl, T) :- true(control(xplayer), tl, T), true(control(oplayer), tl, T), tdom(fluent, T), not terminated(tl, T), not no_legal(T).
% bad_control(tl, T) :- not true(control(xplayer), tl, T), not true(control(oplayer), tl, T), tdom(fluent, T), not terminated(tl, T), not no_legal(T).
% bad_control(tl, T+1) :- bad_control(tl, T), tdom(act, T).
%bad_cell(tl, T+1) :- bad_cell(tl, T), tdom(act, T).

has_legal(R, tl, T) :- legal(R, M, tl, T).
no_legal(T) :- tdom(fluent, T), role(R), not has_legal(R,tl,T), not terminated(tl,T).
%:- not terminated(tl,T), not has_legal(R, tl,T), role(R), program(tl), tdom(fluent, T).
no_legal(T+1) :- no_legal(T), tdom(act, T).
% additional constraints for the GDL encoding.
terminated(tl,T) :- terminal(tl,T).
terminated(tl,T) :- terminated(tl,T-1), tdom(T).

:- does(P,M,tl,T), not legal(P,M,tl,T), not no_legal(T).

% existential and universal players must take a move at its turn
1 {does(P,M,tl,T) : input(P, M)} 1 :- not terminated(tl,T), tdom(act,T), role(P), not no_legal(T).
%:- terminated(tl,T), does(P,M,tl,T).
% game must terminate
:- terminated(tl,T), not no_legal(T).

