tdom(1..2).
input(p, left).
input(p, right).

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

next(round(1)) :- true(round(0)), .

% remove the body of a rule
% remove the head if the body is empty
% add [not] true/does to the body of a rule
% add a head next/legal

% weakly winnability
% termination
% playable

%     00
   
% 01     10 


% 11


% init(f0).
% init(s0).

% legal(r, a) :- true(s0), true(f0).
% legal(r, a) :- true(s1), true(f0).

% next(f0) :- true(f0), true(s0), does(r, a).
% next(s1) :- true(f0), true(s0), does(r, a).

% next(f1) :- true(f0), true(s1), does(r, a).
% next(s1) :- true(f0), true(s1), does(r, a).

% terminal :- true(f1), true(s1).



% init(r).

% next(r) :- true(r).





true(round(1), T + 1) :- true(round(0), T), tdom(T), not removed_rule(1).
legal(p, left, T) :- true(round(0), T), tdom(T), not removed_rule(2).
legal(p, right, T) :- true(round(0), T), tdom(T), not removed_rule(3).

true(s1, T + 1) :- does(p, left, T), tdom(T), not removed_rule(4).
true(s2, T + 1) :- does(p, left, T), tdom(T), not removed_rule(5).
true(s3, T + 1) :- does(p, left, T), tdom(T), not removed_rule(6).
true(s2, T + 1) :- does(p, right, T), tdom(T), not removed_rule(7).

%%%%%%% remove %%%%%%%%%%

{removed_rule(1..7)} 1.

%%%%%%%%%%%%%%%

terminal(T) :- true(round(1), T), tdom(T).


goal(p, 100, T) :- true(s1, T), not true(s2, T), true(s3, T), tdom(T).
goal(p, 0, T) :- not goal(p, 100, T), tdom(T).

#show does/3.
#show removed_rule/1.


% a.

% b :- a.
% c :- d.
% c :- b.
% f :- e.
% {e}.

% a
% d -> false
% b <- a
% b -> a 
% b -> c
% d -> c
% c -> (b | d)
% f -> e 
% e -> f 


