polar(pos;neg).

{fluent(I, P, F)} :- base(F), polar(P), rule(I).
{act(I, P, R, A)} :- input(R, A), rule(I), polar(P), not legal_rule(I).

:- fluent(I, pos, F), fluent(I, neg, F).
:- act(I, pos, R, A1), act(I, neg, R, A2).
:- act(I, pos, R, A1), act(I, pos, R, A2), A1 != A2.


activated_f(I, pos, F, T) :- fluent(I, pos, F), true(F, T), tdom(T), base(F), rule(I).
activated_f(I, neg, F, T) :- fluent(I, neg, F), not true(F, T), tdom(T), base(F), rule(I).
activated_f(I, P, F, T) :- not fluent(I, P, F), tdom(T), base(F), rule(I), polar(P).

activated_a(I, pos, R, A, T) :- act(I, pos, R, A), does(R, A, T), tdom(T), input(R, A), rule(I).
activated_a(I, neg, R, A, T) :- act(I, neg, R, A), not does(R, A, T), tdom(T), input(R, A), rule(I).
activated_a(I, P, R, A, T) :- not act(I, P, R, A), tdom(T), input(R, A), rule(I), polar(P).

% remove from the body
remove_body(I, P, F) :- original_body(I, P, F), not fluent(I, P, F), base(F), rule(I), polar(P).
remove_body(I, P, R, A) :- original_body(I, P, R, A), not act(I, P, R, A), rule(I), input(R, A), polar(P).

% add to the body
add_body(I, P, F) :- not original_body(I, P, F), fluent(I, P, F), base(F), rule(I), polar(P).
add_body(I, P, R, A) :- not original_body(I, P, R, A), act(I, P, R, A), rule(I), input(R, A), polar(P).

% new rules, should not remove body
:- rule(I), not old_rule(I), remove_body(I, P, F).
:- rule(I), not old_rule(I), remove_body(I, P, R, A).

% generate the legal rule and the next rule
legal(R, A, T) :- tdom(T), head(I, R, A), activated_f(I, P, F, T) : base(F), polar(P).
               
true(F, T + 1) :- tdom(T), head(I, F), activated_f(I, P, F, T) : base(F), polar(P) ; activated_a(I, P, R, A, T) : input(R, A), polar(P).

% any new rule can be either a legal rule or a next rule
{legal_rule(I)} :- rule(I), not old_rule(I).
% generate head
1 {dummy(I) ; head(I, R, A) : input(R, A)} 1:- rule(I), legal_rule(I).
1 {dummy(I) ; head(I, F) : base(F)} 1:- rule(I), not legal_rule(I).
% a new rule cannot have an empty head
% new rules with dummy head should not contain
:- dummy(I), not old_rule(I), fluent(I, P, F).
:- dummy(I), not old_rule(I), act(I, P, R, A).
:- dummy(I), legal_rule(I).

% remove head
remove_head(I) :- dummy(I), old_rule(I).
remove_head(I) :- head(I, R1, A1), original_head(I, R2, A2), old_rule(I), R1 != R2.
remove_head(I) :- head(I, R1, A1), original_head(I, R2, A2), old_rule(I), A1 != A2.
remove_head(I) :- head(I, F1), original_head(I, F2), old_rule(I), F1 != F2.
% add head cost
add_head(I) :- head(I, R1, A1), original_head(I, R2, A2), old_rule(I), R1 != R2.
add_head(I) :- head(I, R1, A1), original_head(I, R2, A2), old_rule(I), A1 != A2.
add_head(I) :- head(I, F1), original_head(I, F2), old_rule(I), F1 != F2.
% add head of a new rule
add_head(I) :- rule(I), not old_rule(I), head(I, R, A).
add_head(I) :- rule(I), not old_rule(I), head(I, F).

