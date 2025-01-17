
count(I,N) :- old_rule(I), N=#count{I,P,T,F:o_body(I,P,T,F)}.

#show count/2.