polar(pos;neg).

% any new rule can be either a legal rule or a next rule
{legal_rule(I)} :- rule(I), not old_rule(I).
% add to the body of old rules
{add_body(I, P, F)} :- old_rule(I), base(F), polar(P), not original_body(I, P, F).
% add to the body of new rules
{add_body(I, P, F)} :- rule(I), not old_rule(I), base(F), polar(P).
% add to the body old rules, not legal rules
{add_body(I, P, R, A)} :- old_rule(I), input(R, A), polar(P), not original_body(I, P, R, A), not legal_rule(I).
% add to the body new rules, legal rule cannot have does in the body
{add_body(I, P, R, A)} :- rule(I), not old_rule(I), polar(P), input(R, A), not legal_rule(I).
% remove from the body
{remove_body(I, P, F)} :- old_rule(I), base(F), polar(P), original_body(I, P, F).
{remove_body(I, P, R, A)} :- old_rule(I), input(R, A), polar(P), original_body(I, P, R, A).


:- add_body(I, pos, F), add_body(I, neg, F).
:- add_body(I, P1, F), not remove_body(I, P2, F), original_body(I, P2, F), P1 != P2.
:- not remove_body(I, P1, F), original_body(I, P1, F), not remove_body(I, P2, F), original_body(I, P2, F), P1 != P2.

:- add_body(I, pos, R, A1), add_body(I, neg, R, A2).
:- add_body(I, pos, R, A1), not remove_body(I, neg, R, A2), original_body(I, neg, R, A2).
:- not remove_body(I, pos, R, A1), original_body(I, pos, R, A1), not remove_body(I, neg, R, A2), original_body(I, neg, R, A2).

:- add_body(I, pos, R, A1), add_body(I, pos, R, A2), A1 < A2.
:- add_body(I, pos, R, A1), not remove_body(I, pos, R, A2), original_body(I, pos, R, A2), A1 < A2.
:- not remove_body(I, pos, R, A1), original_body(I, pos, R, A1), not remove_body(I, pos, R, A2), original_body(I, pos, R, A2), A1 < A2.

% remove head
% {remove_head(I)} :- old_rule(I).
% % add head to an old legal rule
% {add_head(I, R, A) : input(R, A)} 1 :- old_rule(I), legal_rule(I).
% % add head to a new legal rule
% {add_head(I, R, A) : input(R, A)} 1 :- rule(I), not old_rule(I), legal_rule(I).
% % add head to an old next rule
% {add_head(I, F) : base(F)} 1 :- old_rule(I), not legal_rule(I).
% % add head to a new next rule
% {add_head(I, F) : base(F)} 1 :- rule(I), not old_rule(I), not legal_rule(I).


% generate head
1 {dummy(I) ; head(I, R, A) : input(R, A)} 1 :- rule(I), legal_rule(I).
1 {dummy(I) ; head(I, F) : base(F)} 1 :- rule(I), not legal_rule(I).
% a new rule cannot have an empty head
% new rules with dummy head should not contain
:- dummy(I), not old_rule(I), add_body(I, P, F).
:- dummy(I), not old_rule(I), add_body(I, P, R, A).
:- dummy(I), legal_rule(I).
dummy(I + 1) :- dummy(I), not old_rule(I), rule(I + 1), rule(I). 

% remove head
remove_head(I) :- dummy(I), old_rule(I).
remove_head(I) :- head(I, R1, A1), original_head(I, R2, A2), old_rule(I), R1 != R2.
remove_head(I) :- head(I, R1, A1), original_head(I, R2, A2), old_rule(I), A1 != A2.
remove_head(I) :- head(I, F1), original_head(I, F2), old_rule(I), F1 != F2.
% add head
add_head(I, R1, A1) :- head(I, R1, A1), original_head(I, R2, A2), old_rule(I), R1 != R2.
add_head(I, R1, A1) :- head(I, R1, A1), original_head(I, R2, A2), old_rule(I), A1 != A2.
add_head(I, F1) :- head(I, F1), original_head(I, F2), old_rule(I), F1 != F2.
% add head of a new rule
add_head(I, R, A) :- rule(I), not old_rule(I), head(I, R, A).
add_head(I, F) :- rule(I), not old_rule(I), head(I, F).

% we have fixed all the rules
% activated
activated_f(J, I, pos, F, T) :- add_body(I, pos, F), true(F, J, T), tdom(T), base(F), rule(I), program(J).
activated_f(J, I, pos, F, T) :- not remove_body(I, pos, F), original_body(I, pos, F), true(F, J, T), tdom(T), base(F), rule(I), program(J).
activated_f(J, I, neg, F, T) :- add_body(I, neg, F), not true(F, J, T), tdom(T), base(F), rule(I), program(J).
activated_f(J, I, neg, F, T) :- not remove_body(I, neg, F), original_body(I, neg, F), not true(F, J, T), tdom(T), base(F), rule(I), program(J).
activated_f(J, I, P, F, T) :- remove_body(I, P, F), tdom(T), base(F), rule(I), polar(P), program(J).
activated_f(J, I, P, F, T) :- not original_body(I, P, F), not add_body(I, P, F), tdom(T), base(F), rule(I), polar(P), program(J).


activated_a(J, I, pos, R, A, T) :- add_body(I, pos, R, A), does(R, A, J, T), tdom(T), input(R, A), rule(I), program(J).
activated_a(J, I, pos, R, A, T) :- not remove_body(I, pos, R, A), original_body(I, pos, R, A), does(R, A, J, T), tdom(T), input(R, A), rule(I), program(J).
activated_a(J, I, neg, R, A, T) :- add_body(I, neg, R, A), not does(R, A, J, T), tdom(T), input(R, A), rule(I), program(J).
activated_a(J, I, neg, R, A, T) :- not remove_body(I, neg, R, A), original_body(I, neg, R, A), does(R, A, J, T), tdom(T), input(R, A), rule(I), program(J).
activated_a(J, I, P, R, A, T) :- remove_body(I, P, R, A), tdom(T), input(R, A), rule(I), polar(P), program(J).
activated_a(J, I, P, R, A, T) :- not original_body(I, P, R, A), not add_body(I, P, R, A), tdom(T), input(R, A), rule(I), polar(P), program(J).


% generate the legal rule and the next rule
legal(R, A, J, T) :- rule(I), tdom(T), input(R, A), head(I, R, A), program(J), activated_f(J, I, P, F, T) : base(F), polar(P).
               
true(F, J, T + 1) :- rule(I), tdom(T), head(I, F),  program(J), activated_f(J, I, P, G, T) : base(G), polar(P) ;  activated_a(J, I, P, R, A, T) : input(R, A), polar(P).

% init
% true(round(1), 1).
true(F, J, 1) :- init(F), base(F), program(J).

#show does/4.
#show add_body/3.
#show add_body/4.
#show remove_body/3.
#show remove_body/4.
#show remove_head/1.
#show add_head/2.
#show add_head/3.
#show dummy/1.
