polar(pos;neg).

{fluent(I, P, F)} :- base(F), polar(P), rule(I).
{act(I, P, R, A)} :- input(R, A), rule(I), polar(P), not legal_rule(I).

:- fluent(I, pos, F), fluent(I, neg, F).
:- act(I, pos, R, A1), act(I, neg, R, A2).
:- act(I, pos, R, A1), act(I, pos, R, A2), A1 < A2.

% remove from the body
remove_body(I, P, F) :- original_body(I, P, F), not fluent(I, P, F), base(F), rule(I), polar(P).
remove_body(I, P, R, A) :- original_body(I, P, R, A), not act(I, P, R, A), rule(I), input(R, A), polar(P).

% add to the body
add_body(I, P, F) :- not original_body(I, P, F), fluent(I, P, F), base(F), rule(I), polar(P).
add_body(I, P, R, A) :- not original_body(I, P, R, A), act(I, P, R, A), rule(I), input(R, A), polar(P).

% any new rule can be either a legal rule or a next rule
{legal_rule(I)} :- rule(I), not old_rule(I).
% generate head for old rules
1 {keep_head(I) ; update_head(I); dummy(I)} 1 :- old_rule(I).
% generate head for new rules
1 {dummy(I) ; add_head(I, F) : base(F)} 1 :- rule(I), not old_rule(I), not legal_rule(I).
1 {dummy(I) ; add_head(I, R, A) : input(R, A)} 1 :- rule(I), not old_rule(I), legal_rule(I).
head(I, R, A) :- keep_head(I), original_head(I, R, A).
head(I, F) :- keep_head(I), original_head(I, F).
% updated version should have a new head
1 {add_head(I, R, A) : input(R, A)} 1 :- update_head(I), legal_rule(I), old_rule(I).
1 {add_head(I, F) : base(F)} 1 :- update_head(I), not legal_rule(I), old_rule(I).
% add head should "change" the head
% add head -> new head
head(I, R, A) :- add_head(I, R, A).
head(I, F) :- add_head(I, F).
% update meand remove + add
remove_head(I) :- update_head(I).
% only remove without add
remove_head(I) :- dummy(I), old_rule(I).
% new rules, dummy should be consecutive
dummy(I + 1) :- dummy(I), not old_rule(I), rule(I + 1), rule(I). 
:- dummy(I), not old_rule(I), fluent(I, P, F).
:- dummy(I), not old_rule(I), act(I, P, R, A).

% we have fixed all the rules
% activated
activated_f(J, I, pos, F, T) :- fluent(I, pos, F), true(F, J, T), tdom(T), base(F), rule(I), program(J).
activated_f(J, I, neg, F, T) :- fluent(I, neg, F), not true(F, J, T), tdom(T), base(F), rule(I), program(J).
activated_f(J, I, P, F, T) :- not fluent(I, P, F), tdom(T), base(F), rule(I), polar(P), program(J).

activated_a(J, I, pos, R, A, T) :- act(I, pos, R, A), does(R, A, J, T), tdom(T), input(R, A), rule(I), program(J).
activated_a(J, I, neg, R, A, T) :- act(I, neg, R, A), not does(R, A, J, T), tdom(T), input(R, A), rule(I), program(J).
activated_a(J, I, P, R, A, T) :- not act(I, P, R, A), tdom(T), input(R, A), rule(I), polar(P), program(J).

% generate the legal rule and the next rule
legal(R, A, J, T) :- rule(I), tdom(T), input(R, A), head(I, R, A), program(J), activated_f(J, I, P, F, T) : base(F), polar(P).
               
true(F, J, T + 1) :- rule(I), tdom(T), tdom(T+1), head(I, F),  program(J), activated_f(J, I, P, G, T) : base(G), polar(P) ;  activated_a(J, I, P, R, A, T) : input(R, A), polar(P).

% init
% true(round(1), 1).
true(F, J, 1) :- init(F), base(F), program(J).

#show does/4.
#show add_body/3.
#show add_body/4.
#show remove_body/3.
#show remove_body/4.
#show remove_head/1.
#show add_head/3.
#show add_head/2.
#show dummy/1.
