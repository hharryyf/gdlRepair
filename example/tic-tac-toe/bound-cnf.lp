:- 4 {add_body(I, P, T, F) : atom(T,F), polar(P), rule(I); 
      remove_body(I, P, T,F) : atom(T,F), polar(P), rule(I) ;
    add_head(I,T,F) : rule(I), atom(T,F);
    remove_head(I) : rule(I)}.

