role(robot).
tdom(1..4).
base(clear(a)).
base(clear(b)).
base(clear(c)).
base(table(a)).
base(table(b)).
base(table(c)).
base(on(a,b)).
base(on(a,c)).
base(on(b,a)).
base(on(b,c)).
base(on(c,a)).
base(on(c,b)).
base(step(1)).
base(step(2)).
base(step(3)).
base(step(4)).
input(robot,s(a,b)).
input(robot,s(a,c)).
input(robot,s(b,a)).
input(robot,s(b,c)).
input(robot,s(c,a)).
input(robot,s(c,b)).
input(robot,u(a,b)).
input(robot,u(a,c)).
input(robot,u(b,a)).
input(robot,u(b,c)).
input(robot,u(c,a)).
input(robot,u(c,b)).
init(clear(b)).
init(clear(c)).
init(on(c,a)).
init(table(a)).
init(table(b)).
init(step(1)).
original_head(1, robot, s(a,c)). original_body(1, pos, clear(a)). original_body(1, pos, table(a)). original_body(1, pos, clear(c)). 
original_head(2, robot, s(b,a)). original_body(2, pos, clear(b)). original_body(2, pos, table(b)). original_body(2, pos, clear(a)). 
original_head(3, robot, s(b,c)). original_body(3, pos, clear(b)). original_body(3, pos, table(b)). original_body(3, pos, clear(c)). 
original_head(4, robot, s(c,a)). original_body(4, pos, clear(c)). original_body(4, pos, table(c)). original_body(4, pos, clear(a)). 
original_head(5, robot, s(c,b)). original_body(5, pos, clear(c)). original_body(5, pos, table(c)). original_body(5, pos, clear(b)). 
original_head(6, robot, u(a,b)). original_body(6, pos, clear(a)). original_body(6, pos, on(a,b)). 
original_head(7, robot, u(a,c)). original_body(7, pos, clear(a)). original_body(7, pos, on(a,c)). 
original_head(8, robot, u(b,a)). original_body(8, pos, clear(b)). original_body(8, pos, on(b,a)). 
original_head(9, robot, u(b,c)). original_body(9, pos, clear(b)). original_body(9, pos, on(b,c)). 
original_head(10, robot, u(c,a)). original_body(10, pos, clear(c)). original_body(10, pos, on(c,a)). 
original_head(11, robot, u(c,b)). original_body(11, pos, clear(c)). original_body(11, pos, on(c,b)). 
original_head(12, on(a,b)). original_body(12, pos, robot, s(a,b)). 
original_head(13, on(a,c)). original_body(13, pos, robot, s(a,c)). 
original_head(14, on(b,a)). original_body(14, pos, robot, s(b,a)). 
original_head(15, on(b,c)). original_body(15, pos, robot, s(b,c)). 
original_head(16, on(c,a)). original_body(16, pos, robot, s(c,a)). 
original_head(17, on(c,b)). original_body(17, pos, robot, s(c,b)). 
original_head(18, on(a,b)). original_body(18, pos, robot, s(a,b)). original_body(18, pos, on(a,b)). 
original_head(19, on(a,b)). original_body(19, pos, robot, s(a,c)). original_body(19, pos, on(a,b)). 
original_head(20, on(a,b)). original_body(20, pos, robot, s(b,a)). original_body(20, pos, on(a,b)). 
original_head(21, on(a,b)). original_body(21, pos, robot, s(b,c)). original_body(21, pos, on(a,b)). 
original_head(22, on(a,b)). original_body(22, pos, robot, s(c,a)). original_body(22, pos, on(a,b)). 
original_head(23, on(a,b)). original_body(23, pos, robot, s(c,b)). original_body(23, pos, on(a,b)). 
original_head(24, on(a,c)). original_body(24, pos, robot, s(a,b)). original_body(24, pos, on(a,c)). 
original_head(25, on(a,c)). original_body(25, pos, robot, s(a,c)). original_body(25, pos, on(a,c)). 
original_head(26, on(a,c)). original_body(26, pos, robot, s(b,a)). original_body(26, pos, on(a,c)). 
original_head(27, on(a,c)). original_body(27, pos, robot, s(b,c)). original_body(27, pos, on(a,c)). 
original_head(28, on(a,c)). original_body(28, pos, robot, s(c,a)). original_body(28, pos, on(a,c)). 
original_head(29, on(a,c)). original_body(29, pos, robot, s(c,b)). original_body(29, pos, on(a,c)). 
original_head(30, on(b,a)). original_body(30, pos, robot, s(a,b)). original_body(30, pos, on(b,a)). 
original_head(31, on(b,a)). original_body(31, pos, robot, s(a,c)). original_body(31, pos, on(b,a)). 
original_head(32, on(b,a)). original_body(32, pos, robot, s(b,a)). original_body(32, pos, on(b,a)). 
original_head(33, on(b,a)). original_body(33, pos, robot, s(b,c)). original_body(33, pos, on(b,a)). 
original_head(34, on(b,a)). original_body(34, pos, robot, s(c,a)). original_body(34, pos, on(b,a)). 
original_head(35, on(b,a)). original_body(35, pos, robot, s(c,b)). original_body(35, pos, on(b,a)). 
original_head(36, on(b,c)). original_body(36, pos, robot, s(a,b)). original_body(36, pos, on(b,c)). 
original_head(37, on(b,c)). original_body(37, pos, robot, s(a,c)). original_body(37, pos, on(b,c)). 
original_head(38, on(b,c)). original_body(38, pos, robot, s(b,a)). original_body(38, pos, on(b,c)). 
original_head(39, on(b,c)). original_body(39, pos, robot, s(b,c)). original_body(39, pos, on(b,c)). 
original_head(40, on(b,c)). original_body(40, pos, robot, s(c,a)). original_body(40, pos, on(b,c)). 
original_head(41, on(b,c)). original_body(41, pos, robot, s(c,b)). original_body(41, pos, on(b,c)). 
original_head(42, on(c,a)). original_body(42, pos, robot, s(a,b)). original_body(42, pos, on(c,a)). 
original_head(43, on(c,a)). original_body(43, pos, robot, s(a,c)). original_body(43, pos, on(c,a)). 
original_head(44, on(c,a)). original_body(44, pos, robot, s(b,a)). original_body(44, pos, on(c,a)). 
original_head(45, on(c,a)). original_body(45, pos, robot, s(b,c)). original_body(45, pos, on(c,a)). 
original_head(46, on(c,a)). original_body(46, pos, robot, s(c,a)). original_body(46, pos, on(c,a)). 
original_head(47, on(c,a)). original_body(47, pos, robot, s(c,b)). original_body(47, pos, on(c,a)). 
original_head(48, on(c,b)). original_body(48, pos, robot, s(a,b)). original_body(48, pos, on(c,b)). 
original_head(49, on(c,b)). original_body(49, pos, robot, s(a,c)). original_body(49, pos, on(c,b)). 
original_head(50, on(c,b)). original_body(50, pos, robot, s(b,a)). original_body(50, pos, on(c,b)). 
original_head(51, on(c,b)). original_body(51, pos, robot, s(b,c)). original_body(51, pos, on(c,b)). 
original_head(52, on(c,b)). original_body(52, pos, robot, s(c,a)). original_body(52, pos, on(c,b)). 
original_head(53, on(c,b)). original_body(53, pos, robot, s(c,b)). original_body(53, pos, on(c,b)). 
original_head(54, table(a)). original_body(54, pos, robot, s(b,a)). original_body(54, pos, table(a)). 
original_head(55, table(a)). original_body(55, pos, robot, s(b,c)). original_body(55, pos, table(a)). 
original_head(56, table(a)). original_body(56, pos, robot, s(c,a)). original_body(56, pos, table(a)). 
original_head(57, table(a)). original_body(57, pos, robot, s(c,b)). original_body(57, pos, table(a)). 
original_head(58, table(b)). original_body(58, pos, robot, s(a,b)). original_body(58, pos, table(b)). 
original_head(59, table(b)). original_body(59, pos, robot, s(a,c)). original_body(59, pos, table(b)). 
original_head(60, table(b)). original_body(60, pos, robot, s(c,a)). original_body(60, pos, table(b)). 
original_head(61, table(b)). original_body(61, pos, robot, s(c,b)). original_body(61, pos, table(b)). 
original_head(62, table(c)). original_body(62, pos, robot, s(a,b)). original_body(62, pos, table(c)). 
original_head(63, table(c)). original_body(63, pos, robot, s(a,c)). original_body(63, pos, table(c)). 
original_head(64, table(c)). original_body(64, pos, robot, s(b,a)). original_body(64, pos, table(c)). 
original_head(65, table(c)). original_body(65, pos, robot, s(b,c)). original_body(65, pos, table(c)). 
original_head(66, clear(a)). original_body(66, pos, robot, s(a,b)). original_body(66, pos, clear(a)). 
original_head(67, clear(a)). original_body(67, pos, robot, s(a,c)). original_body(67, pos, clear(a)). 
original_head(68, clear(a)). original_body(68, pos, robot, s(b,c)). original_body(68, pos, clear(a)). 
original_head(69, clear(a)). original_body(69, pos, robot, s(c,b)). original_body(69, pos, clear(a)). 
original_head(70, clear(b)). original_body(70, pos, robot, s(a,c)). original_body(70, pos, clear(b)). 
original_head(71, clear(b)). original_body(71, pos, robot, s(b,a)). original_body(71, pos, clear(b)). 
original_head(72, clear(b)). original_body(72, pos, robot, s(b,c)). original_body(72, pos, clear(b)). 
original_head(73, clear(b)). original_body(73, pos, robot, s(c,a)). original_body(73, pos, clear(b)). 
original_head(74, clear(c)). original_body(74, pos, robot, s(a,b)). original_body(74, pos, clear(c)). 
original_head(75, clear(c)). original_body(75, pos, robot, s(b,a)). original_body(75, pos, clear(c)). 
original_head(76, clear(c)). original_body(76, pos, robot, s(c,a)). original_body(76, pos, clear(c)). 
original_head(77, clear(c)). original_body(77, pos, robot, s(c,b)). original_body(77, pos, clear(c)). 
original_head(78, on(a,b)). original_body(78, pos, robot, u(b,a)). original_body(78, pos, on(a,b)). 
original_head(79, on(a,b)). original_body(79, pos, robot, u(b,c)). original_body(79, pos, on(a,b)). 
original_head(80, on(a,b)). original_body(80, pos, robot, u(c,a)). original_body(80, pos, on(a,b)). 
original_head(81, on(a,b)). original_body(81, pos, robot, u(c,b)). original_body(81, pos, on(a,b)). 
original_head(82, on(a,c)). original_body(82, pos, robot, u(b,a)). original_body(82, pos, on(a,c)). 
original_head(83, on(a,c)). original_body(83, pos, robot, u(b,c)). original_body(83, pos, on(a,c)). 
original_head(84, on(a,c)). original_body(84, pos, robot, u(c,a)). original_body(84, pos, on(a,c)). 
original_head(85, on(a,c)). original_body(85, pos, robot, u(c,b)). original_body(85, pos, on(a,c)). 
original_head(86, on(b,a)). original_body(86, pos, robot, u(a,b)). original_body(86, pos, on(b,a)). 
original_head(87, on(b,a)). original_body(87, pos, robot, u(a,c)). original_body(87, pos, on(b,a)). 
original_head(88, on(b,a)). original_body(88, pos, robot, u(c,a)). original_body(88, pos, on(b,a)). 
original_head(89, on(b,a)). original_body(89, pos, robot, u(c,b)). original_body(89, pos, on(b,a)). 
original_head(90, on(b,c)). original_body(90, pos, robot, u(a,b)). original_body(90, pos, on(b,c)). 
original_head(91, on(b,c)). original_body(91, pos, robot, u(a,c)). original_body(91, pos, on(b,c)). 
original_head(92, on(b,c)). original_body(92, pos, robot, u(c,a)). original_body(92, pos, on(b,c)). 
original_head(93, on(b,c)). original_body(93, pos, robot, u(c,b)). original_body(93, pos, on(b,c)). 
original_head(94, on(c,a)). original_body(94, pos, robot, u(a,b)). original_body(94, pos, on(c,a)). 
original_head(95, on(c,a)). original_body(95, pos, robot, u(a,c)). original_body(95, pos, on(c,a)). 
original_head(96, on(c,a)). original_body(96, pos, robot, u(b,a)). original_body(96, pos, on(c,a)). 
original_head(97, on(c,a)). original_body(97, pos, robot, u(b,c)). original_body(97, pos, on(c,a)). 
original_head(98, on(c,b)). original_body(98, pos, robot, u(a,b)). original_body(98, pos, on(c,b)). 
original_head(99, on(c,b)). original_body(99, pos, robot, u(a,c)). original_body(99, pos, on(c,b)). 
original_head(100, on(c,b)). original_body(100, pos, robot, u(b,a)). original_body(100, pos, on(c,b)). 
original_head(101, on(c,b)). original_body(101, pos, robot, u(b,c)). original_body(101, pos, on(c,b)). 
original_head(102, table(a)). original_body(102, pos, robot, u(a,b)). 
original_head(103, table(a)). original_body(103, pos, robot, u(a,c)). 
original_head(104, table(b)). original_body(104, pos, robot, u(b,a)). 
original_head(105, table(b)). original_body(105, pos, robot, u(b,c)). 
original_head(106, table(c)). original_body(106, pos, robot, u(c,a)). 
original_head(107, table(c)). original_body(107, pos, robot, u(c,b)). 
original_head(108, clear(b)). original_body(108, pos, robot, u(a,b)). 
original_head(109, clear(c)). original_body(109, pos, robot, u(a,c)). 
original_head(110, clear(a)). original_body(110, pos, robot, u(b,a)). 
original_head(111, clear(c)). original_body(111, pos, robot, u(b,c)). 
original_head(112, clear(a)). original_body(112, pos, robot, u(c,a)). 
original_head(113, clear(b)). original_body(113, pos, robot, u(c,b)). 
original_head(114, table(a)). original_body(114, pos, robot, u(a,b)). original_body(114, pos, table(a)). 
original_head(115, table(a)). original_body(115, pos, robot, u(a,c)). original_body(115, pos, table(a)). 
original_head(116, table(a)). original_body(116, pos, robot, u(b,a)). original_body(116, pos, table(a)). 
original_head(117, table(a)). original_body(117, pos, robot, u(b,c)). original_body(117, pos, table(a)). 
original_head(118, table(a)). original_body(118, pos, robot, u(c,a)). original_body(118, pos, table(a)). 
original_head(119, table(a)). original_body(119, pos, robot, u(c,b)). original_body(119, pos, table(a)). 
original_head(120, table(b)). original_body(120, pos, robot, u(a,b)). original_body(120, pos, table(b)). 
original_head(121, table(b)). original_body(121, pos, robot, u(a,c)). original_body(121, pos, table(b)). 
original_head(122, table(b)). original_body(122, pos, robot, u(b,a)). original_body(122, pos, table(b)). 
original_head(123, table(b)). original_body(123, pos, robot, u(b,c)). original_body(123, pos, table(b)). 
original_head(124, table(b)). original_body(124, pos, robot, u(c,a)). original_body(124, pos, table(b)). 
original_head(125, table(b)). original_body(125, pos, robot, u(c,b)). original_body(125, pos, table(b)). 
original_head(126, table(c)). original_body(126, pos, robot, u(a,b)). original_body(126, pos, table(c)). 
original_head(127, table(c)). original_body(127, pos, robot, u(a,c)). original_body(127, pos, table(c)). 
original_head(128, table(c)). original_body(128, pos, robot, u(b,a)). original_body(128, pos, table(c)). 
original_head(129, table(c)). original_body(129, pos, robot, u(b,c)). original_body(129, pos, table(c)). 
original_head(130, table(c)). original_body(130, pos, robot, u(c,a)). original_body(130, pos, table(c)). 
original_head(131, table(c)). original_body(131, pos, robot, u(c,b)). original_body(131, pos, table(c)). 
original_head(132, clear(a)). original_body(132, pos, robot, u(a,b)). original_body(132, pos, clear(a)). 
original_head(133, clear(a)). original_body(133, pos, robot, u(a,c)). original_body(133, pos, clear(a)). 
original_head(134, clear(a)). original_body(134, pos, robot, u(b,a)). original_body(134, pos, clear(a)). 
original_head(135, clear(a)). original_body(135, pos, robot, u(b,c)). original_body(135, pos, clear(a)). 
original_head(136, clear(a)). original_body(136, pos, robot, u(c,a)). original_body(136, pos, clear(a)). 
original_head(137, clear(a)). original_body(137, pos, robot, u(c,b)). original_body(137, pos, clear(a)). 
original_head(138, clear(b)). original_body(138, pos, robot, u(a,b)). original_body(138, pos, clear(b)). 
original_head(139, clear(b)). original_body(139, pos, robot, u(a,c)). original_body(139, pos, clear(b)). 
original_head(140, clear(b)). original_body(140, pos, robot, u(b,a)). original_body(140, pos, clear(b)). 
original_head(141, clear(b)). original_body(141, pos, robot, u(b,c)). original_body(141, pos, clear(b)). 
original_head(142, clear(b)). original_body(142, pos, robot, u(c,a)). original_body(142, pos, clear(b)). 
original_head(143, clear(b)). original_body(143, pos, robot, u(c,b)). original_body(143, pos, clear(b)). 
original_head(144, clear(c)). original_body(144, pos, robot, u(a,b)). original_body(144, pos, clear(c)). 
original_head(145, clear(c)). original_body(145, pos, robot, u(a,c)). original_body(145, pos, clear(c)). 
original_head(146, clear(c)). original_body(146, pos, robot, u(b,a)). original_body(146, pos, clear(c)). 
original_head(147, clear(c)). original_body(147, pos, robot, u(b,c)). original_body(147, pos, clear(c)). 
original_head(148, clear(c)). original_body(148, pos, robot, u(c,a)). original_body(148, pos, clear(c)). 
original_head(149, clear(c)). original_body(149, pos, robot, u(c,b)). original_body(149, pos, clear(c)). 
original_head(150, step(2)). original_body(150, pos, step(1)). 
original_head(151, step(3)). original_body(151, pos, step(2)). 
original_head(152, step(4)). original_body(152, pos, step(3)). 
legal_rule(1..11).
old_rule(1..152).
rule(1..152).
goal(robot,100,J,T) :- true(on(a,b),J,T), true(on(b,c),J,T), program(J), tdom(T).
goal(robot,0,J,T) :- not true(on(a,b),J,T), program(J), tdom(T).
goal(robot,0,J,T) :- not true(on(b,c),J,T), program(J), tdom(T).
terminal(J,T) :- true(step(4),J,T), program(J), tdom(T).
terminal(J,T) :- true(on(a,b),J,T), true(on(b,c),J,T), program(J), tdom(T).
