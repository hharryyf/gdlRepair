tdom(1..2).
input(p, left).
input(p, right).

base(s1).
base(s2).
base(s3).
base(round(0..1)).

% true(round(0), 1).
init(round(0)).
role(p).

%%%%% part we can change  %%%%


% remove the body of a rule
% remove the head if the body is empty
% add [not] true/does to the body of a rule
% add a head next/legal

% weakly winnability
% termination
% playable

% original game description

%legal(p, left, T) :- true(round(0), T), tdom(T).
%legal(p, right, T) :- true(round(0), T), tdom(T).
%true(round(1), T + 1) :- true(round(0), T), tdom(T).
%true(s1, T + 1) :- does(p, left, T), tdom(T).
%true(s3, T + 1) :- does(p, left, T), tdom(T).
%true(s2, T + 1) :- tdom(T)


terminal(T) :- true(round(1), T), tdom(T).
goal(p, 100, T) :- true(s1, T), not true(s2, T), true(s3, T), tdom(T).
goal(p, 0, T) :- not goal(p, 100, T), tdom(T).


% {pos_f(39, F)} :- base(F).
% {neg_f(39, F)} :- base(F).
% {pos_a(39, R, A)} :- input(R, A).
% {neg_a(39, R, A)} :- input(R, A).


% :- pos_f(39, F), neg_f(39, F).

% :- pos_a(39, R, A1), neg_a(39, R, A2).

% :- pos_a(39, R, A1), pos_a(39, R, A2), A1 != A2.


rule(1..7).
old_rule(1..6).
legal_rule(1..2).


original_head(1, p, left). original_body(1, pos, round(0)).

original_head(2, p, right). original_body(2, pos, round(0)).

original_head(3, round(1)). original_body(3, pos, round(0)).

original_head(4, s1). original_body(4, pos, p, left).

original_head(5, s3). original_body(5, pos, p, left).

original_head(6, s2).


% head(I, R, A) :- original_head(I, R, A).
% head(I, F) :- original_head(I, F).

{add_body(I, P, R, A) : rule(I), input(R, A), polar(P) ; 
remove_body(I, P, R, A) : polar(P), rule(I), input(R, A) ; 
add_body(I, P, F) : rule(I), base(F), polar(P) ; 
remove_body(I, P, F) : polar(P), rule(I), base(F)} 0.

{add_head(I) : rule(I) ; remove_head(I) : rule(I)} 1.



%:- pos_f(39, F).
%:- neg_f(39, F).
%:- pos_a(39, R, A).
% :- not neg_a(39, R, left), role(R).
%:- not neg_a(39, R, right), role(R).

%true(s2, T + 1) :- not does(p, left,T), ..., tdom(T).

%%%%%%% add body %%%%%%%%%%

%not_does_fix(p, left,T) :- tdom(T), not add_body. 
%not_does_fix(p, left,T) :- add_body, not does(p, left,T), tdom(T).

%{add_body}.



%%%%%%%%%%%%%%%

#show does/3.
#show true/2.
#show add_body/3.
#show add_body/4.
#show remove_body/3.
#show remove_body/4.
#show remove_head/1.
#show add_head/1.
#show head/3.
#show head/2.
