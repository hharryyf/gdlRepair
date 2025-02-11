% :- 2 {add_body(I, P, T, F) ; remove_body(I1, P1, T1,F1) ; add_head(I2,T2,F2) ; remove_head(I3) }.

% :- add_body(I,P,T,F), remove_body(I1,P1,T1,F1).
% :- add_body(I,P,T,F), add_head(I2,T2,F2).
% :- add_body(I,P,T,F), remove_head(I3).
% :- add_head(I2,T2,F2), remove_head(I3).
% :- add_head(I2,T2,F2), remove_body(I1,P1,T1,F1).
% :- remove_body(I1,P1,T1,F1), remove_head(I3).
% :- add_body(I,P,T,F), add_body(I1,P1,T1,F1), 1{I != I1;P!=P1;T!=T1;F!=F1}.
% :- remove_body(I,P,T,F), remove_body(I1,P1,T1,F1), 1{I != I1;P!=P1;T!=T1;F!=F1}.
% :- add_head(I2,T2,F2), add_head(I,T,F), 1 {I != I2;T2 != T;F2!=F}.
% :- remove_head(I), remove_head(I1), I != I1.


% time clingo --output=smodels repair-qbf-4.lp example/tic-tac-toe/tic-tac-toe-real.lp example/tic-tac-toe/tic-tac-toe-real-log-encoding.lp example/tic-tac-toe/tic-tac-toe-real-quantifier.lp example/tic-tac-toe/bound-cnf.lp example/tic-tac-toe/win.lp | python qasp2qbf.py | lp2normal2 | lp2acyc | lp2sat | python qasp2qbf.py --cnf2qdimacs > game.qdimacs
% qratpre+  --no-qat --no-qrate --no-eabs --no-eabs-improved-nesting  --print-formula  game.qdimacs > game-qbce.qdimacs

% :- add_body(I, P, T, F).
% :- remove_body(I1, P1, T1,F1).
% :- add_head(I2,T2,F2).
% :- remove_head(I4).
% :- 1 <= #sum{ 1,I,P,T,F,add:add_body(I, P, T, F); 
%                1,I1, P1, T1,F1,remove: remove_body(I1, P1, T1,F1); 
%                1,I2,T2,F2:add_head(I2,T2,F2) ;
%                1,I4:remove_head(I4)
%             }.
:- 2 <= #sum{ 1,I,P,T,F,add:add_body(I, P, T, F); 
               1,I1, P1, T1,F1,remove: remove_body(I1, P1, T1,F1); 
               1,I2,T2,F2:add_head(I2,T2,F2) ;
               2:remove_head(1);
               2:remove_head(2);
               4:remove_head(3);
               4:remove_head(4);
               4:remove_head(5);
               4:remove_head(6);
               4:remove_head(7);
               4:remove_head(8);
               4:remove_head(9);
               4:remove_head(10);
               4:remove_head(11);
               4:remove_head(12);
               4:remove_head(13);
               4:remove_head(14);
               4:remove_head(15);
               4:remove_head(16);
               4:remove_head(17);
               4:remove_head(18);
               4:remove_head(19);
               4:remove_head(20);
               2:remove_head(21);
               2:remove_head(22);
               4:remove_head(23);
               4:remove_head(24);
               2:remove_head(25);
               2:remove_head(26);
               4:remove_head(27);
               4:remove_head(28);
               2:remove_head(29);
               2:remove_head(30);
               4:remove_head(31);
               4:remove_head(32);
               2:remove_head(33);
               2:remove_head(34);
               4:remove_head(35);
               4:remove_head(36);
               2:remove_head(37);
               2:remove_head(38);
               4:remove_head(39);
               4:remove_head(40);
               2:remove_head(41);
               2:remove_head(42);
               4:remove_head(43);
               4:remove_head(44);
               2:remove_head(45);
               2:remove_head(46);
               4:remove_head(47);
               4:remove_head(48);
               2:remove_head(49);
               2:remove_head(50);
               4:remove_head(51);
               4:remove_head(52);
               2:remove_head(53);
               2:remove_head(54);
               2:remove_head(55);
               2:remove_head(56);
               2:remove_head(57);
               2:remove_head(58)}.




%:- 2 {add_body(I,P,T,F) = 1; remove_body(I1, P1, T1,F1) = 1; add_head(I2,T2,F2) = 1; remove_head(I) = 2}.

%cost(I,N) :- N=#count { P,T,A : o_body(I,P,T,A) }, old_rule(I).
%:- N = #sum{P : remove_head(I), cost(I,P)}, M = #count{I,P,T,F: add_body(I, P, T, F)}, O = #count{I,P,T,F:remove_body(I, P, T,F)}, W = #count{I,T,F:add_head(I,T,F)}, N + M + O + W >= 2.
% #show add_body/4.
% #show remove_body/4.
% #show add_head/3.
% #show remove_head/1.


