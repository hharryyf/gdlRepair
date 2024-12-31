:- 15 {add_body(I, P, R, A) : rule(I), input(R, A), polar(P);
    add_body(I, P, F) : rule(I), base(F), polar(P);
    remove_body(I, P, F) : polar(P), rule(I), base(F);
    remove_body(I, P, R, A) : polar(P), rule(I), input(R, A);
    add_head(I) : rule(I);
    remove_head(I) : rule(I)}.

:~ add_body(I, P, R, A). [1,I,P,R,A,add]
:~ add_body(I, P, F). [1,I,P,F,add]
:~ remove_body(I, P, R, A). [1, I, P, R, A,remove]
:~ remove_body(I, P, F). [1,I,P,F,remove]
:~ add_head(I). [1,I,add_head]
:~ remove_head(I). [1,I,remove]
