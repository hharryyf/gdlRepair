:~ add_body(I, P, R, A). [1@2,I,P,R,A,add]
:~ remove_body(I, P, R, A). [1@2, I, P, R, A,remove]
:~ add_head(I,R,A). [1@2,I,R,A,add_head]
:~ remove_head(I), cost(I,N). [(1+N)@2,I,remove]

cost(I,N) :- N=#count { P,T,A : o_body(I,P,T,A) }, old_rule(I).


touch(I) :- add_body(I, P, R, A).
touch(I) :- remove_body(I, P, R, A).
touch(I) :- add_head(I,R,A).
touch(I) :- remove_head(I).

:~ touch(I). [1@1,I,touch]