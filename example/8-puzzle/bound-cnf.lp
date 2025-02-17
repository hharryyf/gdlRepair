:- 1 <= #sum{ 1,I,P,T,F,add:add_body(I, P, T, F); 
               1,I1, P1, T1,F1,remove: remove_body(I1, P1, T1,F1); 
               1,I2,T2,F2:add_head(I2,T2,F2) ;
               (N+1),I4:remove_head(I4), cost(I4, N)
            }.

cost(I,N) :- N=#count { P,T,A : o_body(I,P,T,A) }, old_rule(I).

% :- 2 { add_body(I, P, T, F); 
%               remove_body(I1, P1, T1,F1); 
%               add_head(I2,T2,F2) ;
%             remove_head(I4)
%             }.