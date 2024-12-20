tdom(1..2).
input(p, left).
input(p, right).

base(s1).
base(s2).
base(s3).
base(round(0..1)).


:- not legal(P, A, T), does(P, A, T).

1 {does(p, A, T) : input(p, A)} 1 :- tdom(T), not terminated(T).

terminated(T) :- terminal(T), tdom(T).
terminated(T+1) :- terminal(T), tdom(T).

:- 0 { terminated(T) : tdom(T) } 0.
:- terminated(T), not terminated(T-1), not goal(p,100,T).
:- terminated(1), not goal(p,100,1).

true(round(0), 1).
role(p).

%%%%% part we can change  %%%%


% remove the body of a rule
% remove the head if the body is empty
% add [not] true/does to the body of a rule
% add a head next/legal

% weakly winnability
% termination
% playable

true(round(1), T + 1) :- true(round(0), T), tdom(T).
legal(p, left, T) :- true(round(0), T), tdom(T).
legal(p, right, T) :- true(round(0), T), tdom(T).

true(s1, T + 1) :- does(p, left, T), tdom(T).
true(s3, T + 1) :- does(p, left, T), tdom(T). 
% true(s2, T + 1) :- not does(p, left, T), tdom(T). %%%%%%%%% rule 39



{pos_f(39, F)} :- base(F).
{neg_f(39, F)} :- base(F).
{pos_a(39, R, A)} :- input(R, A).
{neg_a(39, R, A)} :- input(R, A).


:- pos_f(39, F), neg_f(39, F).

:- pos_a(39, R, A1), neg_a(39, R, A2).

:- pos_a(39, R, A1), pos_a(39, R, A2), A1 != A2.



activated_f(39, pos, F, T) :- pos_f(39, F), true(F, T), tdom(T), base(F).
activated_f(39, pos, F, T) :- not pos_f(39, F), tdom(T), base(F).

activated_f(39, neg, F, T) :- neg_f(39, F), not true(F, T), tdom(T), base(F).
activated_f(39, neg, F, T) :- not neg_f(39, F), tdom(T), base(F).

activated_a(39, pos, R, A, T) :- pos_a(39, R, A), does(R, A, T), tdom(T), input(R, A).
activated_a(39, pos, R, A, T) :- not pos_a(39, R, A), tdom(T), input(R, A).

activated_a(39, neg, R, A, T) :- neg_a(39, R, A), not does(R, A, T), tdom(T), input(R, A).
activated_a(39, neg, R, A, T) :- not neg_a(39, R, A), tdom(T), input(R, A).


true(s2, T + 1) :- tdom(T), activated_f(39, pos, F, T) : base(F) ; activated_f(39, neg, F, T) : base(F) ;
               activated_a(39, pos, R, A, T) : input(R, A) ; activated_a(39, neg, R, A, T) : input(R, A).

%:- pos_f(39, F).
%:- neg_f(39, F).
%:- pos_a(39, R, A).
:- not neg_a(39, R, left), role(R).
%:- not neg_a(39, R, right), role(R).

#show does/3.
#show pos_f/2.
#show neg_f/2.
#show pos_a/3.
#show neg_a/3.

%true(s2, T + 1) :- not does(p, left,T), ..., tdom(T).

%%%%%%% add body %%%%%%%%%%

%not_does_fix(p, left,T) :- tdom(T), not add_body. 
%not_does_fix(p, left,T) :- add_body, not does(p, left,T), tdom(T).

%{add_body}.



%%%%%%%%%%%%%%%

terminal(T) :- true(round(1), T), tdom(T).


goal(p, 100, T) :- true(s1, T), not true(s2, T), true(s3, T), tdom(T).
goal(p, 0, T) :- not goal(p, 100, T), tdom(T).

#show does/3.
