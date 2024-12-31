% :- 14 {add_body(I, P, R, A) : rule(I), input(R, A), polar(P);
%     add_body(I, P, F) : rule(I), base(F), polar(P);
%     remove_body(I, P, F) : polar(P), rule(I), base(F);
%     remove_body(I, P, R, A) : polar(P), rule(I), input(R, A);
%     add_head(I,F) : rule(I), base(F);
%     add_head(I,R,A) : rule(I), input(R, A);
%     remove_head(I) : rule(I)}.

:~ add_body(I, P, R, A). [1,I,P,R,A,add]
:~ add_body(I, P, F). [1,I,P,F,add]
:~ remove_body(I, P, R, A). [1, I, P, R, A,remove]
:~ remove_body(I, P, F). [1,I,P,F,remove]
:~ add_head(I,F). [2,I,F,add_head]
:~ add_head(I,R,A). [2,I,R,A,add_head]
:~ remove_head(I). [2,I,remove]

% clingo --opt-mode=opt,8  construct-2.lp example/tic-tac-toe/tic-tac-toe-9-x.lp example/tic-tac-toe/bound.lp example/tic-tac-toe/win.lp 
