program(tl).
atom(fluent, F) :- base(F). atom(act, (R,A)) :- input(R, A).
tdom(act, T) :- tdom(T), tdom(T+1). tdom(fluent, T) :- tdom(T).
polar(pos;neg).

ferr(I,J,T) :- holds(body(I,pos,fluent,F)), tdom(fluent,T), program(J), not true(F,J,T).
ferr(I,J,T) :- holds(body(I,neg,fluent,F)), tdom(fluent,T), program(J), true(F,J,T).
aerr(I,J,T) :- holds(body(I,pos,act,(R,A))), tdom(act,T), program(J), not does(R,A,J,T).
aerr(I,J,T) :- holds(body(I,neg,act,(R,A))), tdom(act,T), program(J), does(R,A,J,T).

legal(R,A,J,T) :- program(J), tdom(fluent,T), holds(head(I,act,(R,A))), not ferr(I,J,T).
true(F,J,T+1)  :- program(J), tdom(act,T),    holds(head(I,fluent,F)),  not ferr(I,J,T),  not aerr(I,J,T).


% init
true(F, tl, 1) :- init(F), base(F), program(tl).

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

