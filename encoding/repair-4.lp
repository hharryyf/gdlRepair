polar(pos;neg).
o_body(I,P,fluent,F) :- original_body(I,P,F). o_body(I,P,act,(R,A)) :- original_body(I,P,R,A).
o_head(I,fluent,F) :- original_head(I,F). o_head(I,act,(R,A)) :- original_head(I,R,A).
atom(fluent, F) :- base(F). atom(act, (R,A)) :- input(R, A).
tdom(act, T) :- tdom(T), tdom(T+1). tdom(fluent, T) :- tdom(T).
% %%%%%%%%%%%%%%%%%%% deal with new heads
% num_old_rules(N) :- N = #count{I : old_rule(I)}.
% 1 {num_new_rules(0..N)} 1 :- N = #count{I:rule(I), not old_rule(I)}.
% new_rule(M+1..M+N) :- num_old_rules(M), num_new_rules(N).
% 1 {head(I,TYPE,F) : atom(TYPE,F) } 1:- new_rule(I).

num_old_rules(N) :- N = #count{I : old_rule(I)}.
num_new_rules(N) :- N = #count{I:rule(I), not old_rule(I)}.
new_rule(M+1..M+N) :- num_old_rules(M), num_new_rules(N).
0 {head(I,TYPE,F) : atom(TYPE,F)} 1:- new_rule(I).

%%%%%%%%%%%%%%%%%% deal with old heads
{deleted(I)} :- old_rule(I).
1 {head(I,TYPE,F) : atom(TYPE,F)} 1 :- htype(I,TYPE), old_rule(I), not deleted(I).
htype(I,TYPE) :- head(I,TYPE,F), not old_rule(I). % new htype rule
htype(I,TYPE) :- o_head(I,TYPE,F).
add_head(I,TYPE,F) :- head(I,TYPE,F), new_rule(I).
replace_head(I,TYPE,F) :- old_rule(I), head(I,TYPE,F), not o_head(I,TYPE,F).
%%%%%%%%%%%%%%%%%% body
{remove_body(I,P,TYPE,F)} :- o_body(I,P,TYPE,F), not deleted(I).
{add_body(I,P,act,F)} :- polar(P), not o_body(I,P,act,F), htype(I,fluent), atom(act,F), not deleted(I).
{add_body(I,P,fluent,F)} :-atom(fluent,F), polar(P), not o_body(I,P,fluent,F), htype(I, TYPE), not deleted(I).

body(I,P,TYPE,F) :- add_body(I,P,TYPE,F).
body(I,P,TYPE,F) :- o_body(I,P,TYPE,F), not remove_body(I,P,TYPE,F), not deleted(I).

:- body(I,pos,fluent,F), body(I,neg,fluent,F).
:- body(I,pos,act,(R,A1)), body(I,neg,act, (R,A2)).
:- body(I,pos,act,(R,A1)), body(I,pos,act, (R,A2)), A1 < A2.

activated_h(I,P,TYPE,H,J,T) :- body(I,P,TYPE,H), tdom(TYPE,T), program(J), true(H,J,T) : TYPE=fluent, P=pos;
                                                                           not true(H,J,T) : TYPE=fluent, P=neg;
                                                                           does(R,A,J,T) : TYPE=act,H=(R,A), P=pos;
                                                                           not does(R,A,J,T) : TYPE=act,H=(R,A), P=neg.
activated_h(I,P,TYPE,H,J,T) :- tdom(TYPE,T), program(J), rule(I), polar(P), atom(TYPE,H), not body(I,P,TYPE,H).

% generate the legal rule and the next rule
legal(R,A,J,T) :- program(J), tdom(fluent,T), head(I,act,(R,A)), activated_h(I,P,fluent,F,J,T) : atom(fluent,F), polar(P).
true(F,J,T+1)  :- program(J), tdom(act,T),    head(I,fluent,F),  activated_h(I,P,TYPE,H,J,T) : atom(TYPE,H), polar(P).

% init
true(F, J, 1) :- init(F), base(F), program(J).

#show does/4.
#show add_body/4.
#show remove_body/4.
%#show remove_head/1.
#show add_head/3.
#show replace_head/3.
#show deleted/1.
#show num_new_rules/1.
#show new_rule/1.
%#show dummy/1.
%#show true(control(R),J,T) : true(control(R),J,T), program(J), tdom(T).
