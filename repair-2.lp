polar(pos;neg).
%%%%%%%%%%%%%%%%%% body
{remove_body(I, P, F)} :- original_body(I,P,F), not deleted(I).
{remove_body(I,P,R,A)} :- original_body(I,P,R,A), not deleted(I).
{add_body(I, P, F)} :- old_rule(I), polar(P), base(F), not original_body(I,P,F), not deleted(I).
{add_body(I,P,R,A)} :- old_rule(I), not legal_rule(I), not original_body(I,P,R,A), input(R,A), polar(P), not deleted(I).
{add_body(I, P, F)} :- new_rule(I), polar(P), base(F).
{add_body(I,P,R,A)} :- new_legal_rule(I), input(R,A), polar(P).

fluent(I,P,F) :- original_body(I,P,F), not remove_body(I,P,F).
act(I,P,R,A) :- original_body(I,P,R,A), not remove_body(I,P,R,A).
act(I,P,R,A) :- add_body(I,P,R,A).
fluent(I,P,F) :- add_body(I,P,F).

:- fluent(I, pos, F), fluent(I, neg, F).
:- act(I, pos, R, A1), act(I, neg, R, A2).
:- act(I, pos, R, A1), act(I, pos, R, A2), A1 < A2.

%%%%%%%%%%%%%%% head
% any new rule can be either a legal rule or a next rule
num_old_rules(N) :- N = #count{I : old_rule(I)}.
1 {num_new_rules(0..N)} 1 :- N = #count{I:rule(I), not old_rule(I)}.
1 {num_new_legal_rules(0..M)} 1 :- num_new_rules(M).
new_legal_rule(M+1..N+M) :- num_new_legal_rules(N), num_old_rules(M).
new_next_rule(K+M+1..K+N) :- num_old_rules(K), num_new_rules(N), num_new_legal_rules(M).
new_rule(M+1..M+N) :- num_old_rules(M), num_new_rules(N).

1 {add_head(I, F) : base(F)} 1 :- new_next_rule(I).
1 {add_head(I, R, A) : input(R, A)} 1 :- new_legal_rule(I).

% generate head for old rules
1 {keep_head(I) ; update_head(I); deleted(I)} 1 :- old_rule(I).
head(I, R, A) :- keep_head(I), original_head(I, R, A).
head(I, F) :- keep_head(I), original_head(I, F).
% updated version should have a new head
1 {add_head(I, R, A) : input(R, A), not original_head(I, R, A)} 1 :- update_head(I), legal_rule(I), old_rule(I).
1 {add_head(I, F) : base(F), not original_head(I, F)} 1 :- update_head(I), not legal_rule(I), old_rule(I).
% for both old rules and new rules, add head
head(I, R, A) :- add_head(I, R, A).
head(I, F) :- add_head(I, F).
% update meand remove + add
remove_head(I) :- update_head(I).
% only remove without add
remove_head(I) :- deleted(I).

% activate fluents
activated_f(J, I, pos, F, T) :- fluent(I, pos, F), true(F, J, T), tdom(T), base(F), rule(I), program(J).
activated_f(J, I, neg, F, T) :- fluent(I, neg, F), not true(F, J, T), tdom(T), base(F), rule(I), program(J).
activated_f(J, I, P, F, T) :- not fluent(I, P, F), tdom(T), base(F), rule(I), polar(P), program(J).
% activate actions
activated_a(J, I, pos, R, A, T) :- act(I, pos, R, A), does(R, A, J, T), tdom(T), input(R, A), rule(I), program(J).
activated_a(J, I, neg, R, A, T) :- act(I, neg, R, A), not does(R, A, J, T), tdom(T), input(R, A), rule(I), program(J).
activated_a(J, I, P, R, A, T) :- not act(I, P, R, A), tdom(T), input(R, A), rule(I), polar(P), program(J).

% generate the legal rule and the next rule
legal(R, A, J, T) :- rule(I), tdom(T), input(R, A), head(I, R, A), program(J), activated_f(J, I, P, F, T) : base(F), polar(P).
               
true(F, J, T + 1) :- rule(I), tdom(T), tdom(T+1), head(I, F),  program(J), activated_f(J, I, P, G, T) : base(G), polar(P) ;  activated_a(J, I, P, R, A, T) : input(R, A), polar(P).

% init
true(F, J, 1) :- init(F), base(F), program(J).

#show does/4.
#show add_body/3.
#show add_body/4.
#show remove_body/3.
#show remove_body/4.
#show remove_head/1.
#show add_head/3.
#show add_head/2.
#show deleted/1.
#show num_new_legal_rules/1.
#show num_new_rules/1.
#show new_rule/1.
#show new_legal_rule/1.
#show new_next_rule/1.

