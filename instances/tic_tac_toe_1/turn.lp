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

% additional constraints for the GDL encoding.
terminated(tl,T) :- terminal(tl,T).
terminated(tl,T) :- terminated(tl,T-1), tdom(T).

has_legal(R, tl, T) :- legal(R, M, tl, T).
no_legal(tl, T) :- not has_legal(R,tl,T), tdom(fluent, T), role(R).
terminated(tl, T) :- no_legal(tl, T).
bad_control(tl, T) :- true(control(xplayer), tl, T), true(control(oplayer), tl, T), tdom(T).
bad_control(tl, T) :- not true(control(xplayer), tl, T), not true(control(oplayer), tl, T), tdom(T). 
terminated(tl, T) :- bad_control(tl, T).

:- does(P,M,tl,T), not legal(P,M,tl,T).
% existential and universal players must take a move at its turn
1 {does(P,M,tl,T) : input(P, M)} 1 :- not terminated(tl,T), tdom(act,T), role(P).



% X X X X X X ... X p
end(tl, T) :- terminal(tl, T).
end(tl, T) :- end(tl, T+1), tdom(fluent, T+1).

% playability


%:- play_1(tl, 1). 
play(tl, 1) :- play_1_1(tl, 1), play_1_2(tl, 1).
play_1_1(tl, T) :- terminal(tl, T), tdom(T).
play_1_1(tl, T) :- not no_legal(tl, T), tdom(T).
play_1_2(tl, T) :- terminal(tl, T), tdom(T+1).
play_1_2(tl, T) :- no_legal(tl, T), tdom(T+1).
play_1_2(tl, T) :- tdom(T), not tdom(T+1).
play_1_2(tl, T) :- play_1_1(tl, T+1), play_1_2(tl,T+1), tdom(T+1).

turn(tl, 1) :- turn_1_1(tl, 1), turn_1_2(tl, 1).
turn_1_1(tl, T) :- not bad_control(tl,T), tdom(T).
turn_1_2(tl, T) :- terminal(tl, T), tdom(T+1).
turn_1_2(tl, T) :- no_legal(tl, T), tdom(T+1).
turn_1_2(tl, T) :- bad_control(tl, T), tdom(T+1).
turn_1_2(tl, T) :- tdom(T), not tdom(T+1).
turn_1_2(tl, T) :- turn_1_1(tl, T+1), turn_1_2(tl,T+1), tdom(T+1).


:- end(tl,1), play(tl,1), turn(tl, 1).

