
% allowed user-defined cost

% introduce a cost predicate

% cost(I,P,R,A,add/remove,C) -> it costs C to add/remove P,R,A from rule I
% cost(I,N) -> it costs N to remove the head of rule I
% cost(I,R,A,C) -> it costs C to add/change the head of rule I to R,A 



:~ add_body(I, P, R, A). [1@2,I,P,R,A,add]
:~ remove_body(I, P, R, A). [1@2, I, P, R, A,remove]
:~ add_head(I,R,A). [1@2,I,R,A,add_head]
:~ replace_head(I,R,A), cost(I,N). [(2*N+1)@2,I,R,A,replace_head]
:~ deleted(I), cost(I,N). [(1+N)@2,I,remove]
%:~ remove_head(I). [1,I,remove]


cost(I,N) :- N=#count { P,T,A : o_body(I,P,T,A) }, old_rule(I).


% touch(I) :- add_body(I, P, R, A).
% touch(I) :- remove_body(I, P, R, A).
% touch(I) :- add_head(I,R,A).
% touch(I) :- deleted(I).
% touch(I) :- replace_head(I,R,A).

% :~ touch(I). [1@1,I,touch]
% :~ add_head(I,R,A). [1@1,I,R,A,add_head]
% :~ remove_head(I). [1@1,I,remove]
