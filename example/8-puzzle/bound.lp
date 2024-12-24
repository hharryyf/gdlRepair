:- 3 {add_body(I, P, R, A) : rule(I), input(R, A), polar(P) ; 
remove_body(I, P, R, A) : polar(P), rule(I), input(R, A);
add_body(I, P, F) : rule(I), base(F), polar(P) ; 
remove_body(I, P, F) : polar(P), rule(I), base(F)}.

{add_head(I) : rule(I) ; remove_head(I) : rule(I)} 0.



