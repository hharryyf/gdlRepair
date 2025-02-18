program(tl).
atom(fluent, F) :- base(F). atom(act, (R,A)) :- input(R, A).
tdom(act, T) :- tdom(T), tdom(T+1). tdom(fluent, T) :- tdom(T).
polar(pos;neg).

activated_h(I,P,TYPE,H,J,T) :- holds(body(I,P,TYPE,H)), tdom(TYPE,T), program(J), true(H,J,T) : TYPE=fluent, P=pos;
                                                                           not true(H,J,T) : TYPE=fluent, P=neg;
                                                                           does(R,A,J,T) : TYPE=act,H=(R,A), P=pos;
                                                                           not does(R,A,J,T) : TYPE=act,H=(R,A), P=neg.
activated_h(I,P,TYPE,H,J,T) :- tdom(TYPE,T), program(J), rule(I), polar(P), atom(TYPE,H), not holds(body(I,P,TYPE,H)).


has_legal(R, J, T) :- legal(R, M, J, T).
:- not terminated(J,T), not has_legal(R, J,T), role(R), program(J), tdom(fluent, T).


% generate the legal rule and the next rule
legal(R,A,J,T) :- program(J), tdom(fluent,T), holds(head(I,act,(R,A))), activated_h(I,P,fluent,F,J,T) : atom(fluent,F), polar(P).
true(F,J,T+1)  :- program(J), tdom(act,T),    holds(head(I,fluent,F)),  activated_h(I,P,TYPE,H,J,T) : atom(TYPE,H), polar(P).

% init
true(F, J, 1) :- init(F), base(F), program(J).


% additional constraints for the GDL encoding.
terminated(tl,T) :- terminal(tl,T).
terminated(tl,T) :- terminated(tl,T-1), tdom(T).

:- does(P,M,tl,T), not legal(P,M,tl,T).

% existential and universal players must take a move at its turn
1 {does(P,M,tl,T) : input(P, M)} 1 :- not terminated(tl,T), tdom(act,T), role(P).
:- terminated(tl,T), does(P,M,tl,T).
% game must terminate
:- terminated(tl,T).
