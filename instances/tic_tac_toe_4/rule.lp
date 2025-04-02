original_head(1, oplayer, noop). original_body(1, pos, control(oplayer)). % the head is wrong, should be xplayer
original_head(2, oplayer, noop). original_body(2, pos, control(xplayer)). 
original_head(3, xplayer, mark(1,1)). original_body(3, pos, control(xplayer)). original_body(3, neg, cell(1,1,x)). original_body(3, neg, cell(1,1,o)). 
original_head(4, oplayer, mark(1,1)). original_body(4, pos, control(oplayer)). original_body(4, neg, cell(1,1,x)). original_body(4, neg, cell(1,1,o)). 
original_head(5, xplayer, mark(1,2)). original_body(5, pos, control(xplayer)). original_body(5, neg, cell(1,2,x)). original_body(5, neg, cell(1,2,o)). 
original_head(6, oplayer, mark(1,2)). original_body(6, pos, control(oplayer)). original_body(6, neg, cell(1,2,x)). original_body(6, neg, cell(1,2,o)). 
original_head(7, xplayer, mark(1,3)). original_body(7, pos, control(xplayer)). original_body(7, neg, cell(1,3,x)). original_body(7, neg, cell(1,3,o)). 
original_head(8, oplayer, mark(1,3)). original_body(8, pos, control(oplayer)). original_body(8, neg, cell(1,3,x)). original_body(8, neg, cell(1,3,o)). 
original_head(9, xplayer, mark(2,1)). original_body(9, pos, control(xplayer)). original_body(9, neg, cell(2,1,x)). original_body(9, neg, cell(2,1,o)). 
original_head(10, oplayer, mark(2,1)). original_body(10, pos, control(oplayer)). original_body(10, neg, cell(2,1,x)). original_body(10, neg, cell(2,1,o)). 
original_head(11, xplayer, mark(2,2)). original_body(11, pos, control(xplayer)). original_body(11, neg, cell(2,2,x)). original_body(11, neg, cell(2,2,o)). 
original_head(12, oplayer, mark(2,2)). original_body(12, pos, control(oplayer)). original_body(12, neg, cell(2,2,x)). original_body(12, neg, cell(2,2,o)). 
original_head(13, xplayer, mark(2,3)). original_body(13, pos, control(xplayer)). original_body(13, neg, cell(2,3,x)). original_body(13, neg, cell(2,3,o)). 
original_head(14, oplayer, mark(2,3)). original_body(14, pos, control(oplayer)). original_body(14, neg, cell(2,3,x)). original_body(14, neg, cell(2,3,o)). 
original_head(15, xplayer, mark(3,1)). original_body(15, pos, control(xplayer)). original_body(15, neg, cell(3,1,x)). original_body(15, neg, cell(3,1,o)). 
original_head(16, oplayer, mark(3,1)). original_body(16, pos, control(oplayer)). original_body(16, neg, cell(3,1,x)). original_body(16, neg, cell(3,1,o)). 
original_head(17, xplayer, mark(3,2)). original_body(17, pos, control(xplayer)). original_body(17, neg, cell(3,2,x)). original_body(17, neg, cell(3,2,o)). 
original_head(18, oplayer, mark(3,2)). original_body(18, pos, control(oplayer)). original_body(18, neg, cell(3,2,x)). original_body(18, neg, cell(3,2,o)). 
original_head(19, xplayer, mark(3,3)). original_body(19, pos, control(xplayer)). original_body(19, neg, cell(3,3,x)). original_body(19, neg, cell(3,3,o)). 
original_head(20, oplayer, mark(3,3)). original_body(20, pos, control(oplayer)). original_body(20, neg, cell(3,3,x)). original_body(20, neg, cell(3,3,o)). 
original_head(21, cell(1,1,x)). original_body(21, pos, xplayer, mark(1,1)). original_body(21, neg, cell(1,1,x)). original_body(21, neg, cell(1,1,o)). 
original_head(22, cell(1,1,o)). original_body(22, pos, oplayer, mark(1,1)). original_body(22, neg, cell(1,1,x)). original_body(22, neg, cell(1,1,o)). 
original_head(23, cell(1,1,x)). original_body(23, pos, cell(1,1,x)). 
original_head(24, cell(1,1,o)). original_body(24, pos, cell(1,1,o)). 
original_head(25, cell(1,2,x)). original_body(25, pos, xplayer, mark(1,2)). original_body(25, neg, cell(1,2,x)). original_body(25, neg, cell(1,2,o)). 
original_head(26, cell(1,2,o)). original_body(26, pos, oplayer, mark(1,2)). original_body(26, neg, cell(1,2,x)). original_body(26, neg, cell(1,2,o)). 
original_head(27, cell(1,2,x)). original_body(27, pos, cell(1,2,x)). 
original_head(28, cell(1,2,o)). original_body(28, pos, cell(1,2,o)). 
original_head(29, cell(1,3,x)). original_body(29, pos, xplayer, mark(1,3)). original_body(29, neg, cell(1,3,x)). original_body(29, neg, cell(1,3,o)). 
original_head(30, cell(1,3,o)). original_body(30, pos, oplayer, mark(1,3)). original_body(30, neg, cell(1,3,x)). original_body(30, neg, cell(1,3,o)). 
original_head(31, cell(1,3,x)). original_body(31, pos, cell(1,3,x)). 
original_head(32, cell(1,3,o)). original_body(32, pos, cell(1,3,o)). 
original_head(33, cell(2,1,x)). original_body(33, pos, xplayer, mark(2,1)). original_body(33, neg, cell(2,1,x)). original_body(33, neg, cell(2,1,o)). 
original_head(34, cell(2,1,o)). original_body(34, pos, oplayer, mark(2,1)). original_body(34, neg, cell(2,1,x)). original_body(34, neg, cell(2,1,o)). 
original_head(35, cell(2,1,x)). original_body(35, pos, cell(2,1,x)). 
original_head(36, cell(2,1,o)). original_body(36, pos, cell(2,1,o)). 
original_head(37, cell(2,2,x)). original_body(37, pos, xplayer, mark(2,2)). original_body(37, neg, cell(2,2,x)). original_body(37, neg, cell(2,2,o)). 
original_head(38, cell(2,2,o)). original_body(38, pos, oplayer, mark(2,2)). original_body(38, neg, cell(2,2,x)). original_body(38, neg, cell(2,2,o)). 
original_head(39, cell(2,2,x)). original_body(39, pos, cell(2,2,x)). 
original_head(40, cell(2,2,o)). original_body(40, pos, cell(2,2,o)). 
original_head(41, cell(2,3,x)). original_body(41, pos, xplayer, mark(2,3)). original_body(41, neg, cell(2,3,x)). original_body(41, neg, cell(2,3,o)). 
original_head(42, cell(2,3,o)). original_body(42, pos, oplayer, mark(2,3)). original_body(42, neg, cell(2,3,x)). original_body(42, neg, cell(2,3,o)). 
original_head(43, cell(2,3,x)). original_body(43, pos, cell(2,3,x)). 
original_head(44, cell(2,3,o)). original_body(44, pos, cell(2,3,o)). 
original_head(45, cell(3,1,x)). original_body(45, pos, xplayer, mark(3,1)). original_body(45, neg, cell(3,1,x)). original_body(45, neg, cell(3,1,o)). 
original_head(46, cell(3,1,o)). original_body(46, pos, oplayer, mark(3,1)). original_body(46, neg, cell(3,1,x)). original_body(46, neg, cell(3,1,o)). 
original_head(47, cell(3,1,x)). original_body(47, pos, cell(3,1,x)). 
original_head(48, cell(3,1,o)). original_body(48, pos, cell(3,1,o)). 
original_head(49, cell(3,2,x)). original_body(49, pos, xplayer, mark(3,2)). original_body(49, neg, cell(3,2,x)). original_body(49, neg, cell(3,2,o)). 
original_head(50, cell(3,2,o)). original_body(50, pos, oplayer, mark(3,2)). original_body(50, neg, cell(3,2,x)). original_body(50, neg, cell(3,2,o)). 
original_head(51, cell(3,2,x)). original_body(51, pos, cell(3,2,x)). 
original_head(52, cell(3,2,o)). original_body(52, pos, cell(3,2,o)). 
original_head(53, cell(3,3,x)). original_body(53, pos, xplayer, mark(3,3)). original_body(53, neg, cell(3,3,x)). original_body(53, neg, cell(3,3,o)). 
original_head(54, cell(3,3,o)). original_body(54, pos, oplayer, mark(3,3)). original_body(54, neg, cell(3,3,x)). original_body(54, neg, cell(3,3,o)). 
original_head(55, cell(3,3,x)). original_body(55, pos, cell(3,3,x)). %original_body(55, pos, control(o)).  % a bad insertion
original_head(56, cell(3,3,o)). original_body(56, pos, cell(3,3,o)). 
original_head(57, control(xplayer)). original_body(57, pos, control(oplayer)). 
original_head(58, control(oplayer)). original_body(58, pos, control(xplayer)). 
