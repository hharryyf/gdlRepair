% G = G_{next,legal} \cup G_{rem}
% promise: There exists a set of fluents A such that G_{rem} \cup A^{true} \models terminal and goal(p, 100)


% problem: GDL-repair-winnability
% instance: set of inits I, goal/terminal rules T, incorrect next/legal R, a budget k
% promise: There exists a set of correct rules RC such that RC \cup I \cup T is winnable
% solution: set of rules R' such that I \cup R \cup T is winnable, and delta(R,R') < k
% 
% a given GDL is
% winnable = for every player, there is a collabortive path from init to terminal goal
% terminal = every sequence of play ends in a terminal state
% playable = every non-terminal state every player has >= 1 legal actions

% what we do is take a

%% exists S_red forall S_blue S_green, red wins
%% exists S_blue forall S_red S_green, blue wins

polar(pos;neg).
o_head(I,fluent,F) :- original_head(I,F).
o_head(I,act,(R,A)) :- original_head(I,R,A).
o_body(I,P,fluent,F) :- original_body(I,P,F).
o_body(I,P,act,(R,A)) :- original_body(I,P,R,A).
atom(fluent,F) :- base(F).
atom(act,(R,A)) :- input(R,A).

tdom(fluent,T) :- tdom(T).
tdom(act,T) :- tdom(T), tdom(T+1).

num_old_rules(N) :- N = #count{I : old_rule(I)}.
1 {num_new_rules(0..N)} 1 :- N = #count{I:rule(I), not old_rule(I)}.
new_rule(M+1..M+N) :- num_old_rules(M), num_new_rules(N).

%%%%%%%%%%%%%%% head
{ head(I,TYPE,A) : atom(TYPE,A) } 1 :- o_head(I,TYPE,OA).
delete(I) :- old_rule(I), not head(I,_,_).
%head_type(I,TYPE) :- o_head(I,TYPE,A), not delete(I). % any rule can be either a legal rule or a next rule
head_type(I,TYPE) :- head(I,TYPE,A). % any rule can be either a legal rule or a next rule

1 { head(I,TYPE,A) : atom(TYPE,A) } 1 :- new_rule(I).
head_type(I,TYPE) :- head(I,TYPE,A), not old_rule(I).

%%%%%%%%%%%%%%%%%% body
{ body(I,P,fluent,F)  : polar(P) } 1 :- head_type(I,TYPE), atom(fluent,F).
{ body(I,P,act,(R,A)) : polar(P) } 1 :- head_type(I,fluent), atom(act,(R,A)). % only next rules may have action hypotheses.

change(add,I,P,TYPE,A) :- body(I,P,TYPE,A), not o_body(I,P,TYPE,A).
change(rem,I,P,TYPE,A) :- not body(I,P,TYPE,A), o_body(I,P,TYPE,A).
%change(rem,I,P,TYPE,A) :- not body(I,P,TYPE,A), o_body(I,P,TYPE,A), not delete(I).

:- body(I,pos,act,(R,A1)), body(I,neg,act,(R,A2)).
:- body(I,pos,act,(R,A1)), body(I,pos,act,(R,A2)), A1 < A2.

%:~ head(I,TYPE,A), not o_head(I,TYPE,A). [2@2,I,TYPE,A]
:~ head(I,TYPE,A), not o_head(I,TYPE,A), NBATOMS = #count { TYPE2,A2 : o_body(I,P,TYPE2,A2) }. [(1+NBATOMS)@2,I,TYPE,A]
:~ delete(I). [1@2,I,delete]
:~ change(C,I,P,TYPE,A). [1@2,I,P,TYPE,A,C]
%:~ change(C,I,P,TYPE,A). [1@2,I,P,TYPE,A] %% if we want to give swapping the polarity of a literal a cost of 1 instead of cost 2.

% activate hypothesis
activated_h(I,P,TYPE,H,J,T) :- body(I,P,TYPE,H), tdom(TYPE,T), program(J), true(H,J,T) : TYPE=fluent, P=pos;
                                                                           not true(H,J,T) : TYPE=fluent, P=neg;
                                                                           does(R,A,J,T) : TYPE=act,H=(R,A), P=pos;
                                                                           not does(R,A,J,T) : TYPE=act,H=(R,A), P=neg.
activated_h(I,P,TYPE,H,J,T) :- tdom(TYPE,T), program(J), rule(I), polar(P), atom(TYPE,H), not body(I,P,TYPE,H).

% generate the legal rule and the next rule
legal(R,A,J,T) :- program(J), tdom(fluent,T), head(I,act,(R,A)), activated_h(I,P,fluent,F,J,T) : atom(fluent,F), polar(P).
true(F,J,T+1)  :- program(J), tdom(act,T),    head(I,fluent,F),  activated_h(I,P,TYPE,H,J,T) : atom(TYPE,H), polar(P).

% init
true(F,J,1) :- init(F), base(F), program(J).

#show.
%#show does/4.
#show upd_head(I,TYPE,A) : head(I,TYPE,A), not o_head(I,TYPE,A).
%#show add_body(I,P,TYPE,A) : body(I,P,TYPE,A), not o_body(I,_,TYPE,A).
%#show rem_body(I,P,TYPE,A) : not body(I,_,TYPE,A), o_body(I,P,TYPE,A).
%#show swa_body(I,P2,P1,TYPE,A) : body(I,P1,TYPE,A), o_body(I,P2,TYPE,A), P1 != P2.
#show del_rule(I) : delete(I).
#show change/5.