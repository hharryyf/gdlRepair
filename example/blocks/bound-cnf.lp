:- 3 <= #sum{ 1,I,P,T,F,add:add_body(I, P, T, F); 
               1,I1, P1, T1,F1,remove: remove_body(I1, P1, T1,F1); 
               1,I2,T2,F2:add_head(I2,T2,F2) ;
               1,I4:remove_head(I4)
            }.

% :- 2 { add_body(I, P, T, F); 
%               remove_body(I1, P1, T1,F1); 
%               add_head(I2,T2,F2) ;
%             remove_head(I4)
%             }.