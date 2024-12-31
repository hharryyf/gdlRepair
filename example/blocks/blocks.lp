% blocks world, 2 legal rules are removed
role(robot).
tdom(1..4).
base(clear(a)).
base(clear(b)).
base(clear(c)).
base(table(a)).
base(table(b)).
base(table(c)).
base(on(a,a)).
base(on(a,b)).
base(on(a,c)).
base(on(b,a)).
base(on(b,b)).
base(on(b,c)).
base(on(c,a)).
base(on(c,b)).
base(on(c,c)).
base(step(1)).
base(step(2)).
base(step(3)).
base(step(4)).
input(robot,s(a,a)).
input(robot,s(a,b)).
input(robot,s(a,c)).
input(robot,s(b,a)).
input(robot,s(b,b)).
input(robot,s(b,c)).
input(robot,s(c,a)).
input(robot,s(c,b)).
input(robot,s(c,c)).
input(robot,u(a,a)).
input(robot,u(a,b)).
input(robot,u(a,c)).
input(robot,u(b,a)).
input(robot,u(b,b)).
input(robot,u(b,c)).
input(robot,u(c,a)).
input(robot,u(c,b)).
input(robot,u(c,c)).
init(clear(b)).
init(clear(c)).
init(on(c,a)).
init(table(a)).
init(table(b)).
init(step(1)).
original_head(1, robot, s(a,b)). original_body(1, pos, clear(a)). original_body(1, pos, table(a)). original_body(1, pos, clear(b)). 
original_head(2, robot, s(a,c)). original_body(2, pos, clear(a)). original_body(2, pos, table(a)). original_body(2, pos, clear(c)). 
original_head(3, robot, s(b,a)). original_body(3, pos, clear(b)). original_body(3, pos, table(b)). original_body(3, pos, clear(a)). 
original_head(4, robot, s(b,c)). original_body(4, pos, clear(b)). original_body(4, pos, table(b)). original_body(4, pos, clear(c)). 
original_head(5, robot, s(c,a)). original_body(5, pos, clear(c)). original_body(5, pos, table(c)). original_body(5, pos, clear(a)). 
original_head(6, robot, s(c,b)). original_body(6, pos, clear(c)). original_body(6, pos, table(c)). original_body(6, pos, clear(b)). 
original_head(7, robot, u(a,a)). original_body(7, pos, clear(a)). original_body(7, pos, on(a,a)). 
original_head(8, robot, u(a,b)). original_body(8, pos, clear(a)). original_body(8, pos, on(a,b)). 
original_head(9, robot, u(a,c)). original_body(9, pos, clear(a)). original_body(9, pos, on(a,c)). 
original_head(10, robot, u(b,a)). original_body(10, pos, clear(b)). original_body(10, pos, on(b,a)). 
original_head(11, robot, u(b,b)). original_body(11, pos, clear(b)). original_body(11, pos, on(b,b)). 
original_head(12, robot, u(b,c)). original_body(12, pos, clear(b)). original_body(12, pos, on(b,c)). original_body(12, neg, on(b,c)).  
original_head(13, robot, u(c,a)). original_body(13, pos, clear(c)). original_body(13, pos, on(c,a)). original_body(13, neg, on(c,a)). 
original_head(14, robot, u(c,b)). original_body(14, pos, clear(c)). original_body(14, pos, on(c,b)). 
original_head(15, robot, u(c,c)). original_body(15, pos, clear(c)). original_body(15, pos, on(c,c)). 
original_head(16, on(a,a)). original_body(16, pos, robot, s(a,a)). 
original_head(17, on(a,b)). original_body(17, pos, robot, s(a,b)). 
original_head(18, on(a,c)). original_body(18, pos, robot, s(a,c)). 
original_head(19, on(b,a)). original_body(19, pos, robot, s(b,a)). 
original_head(20, on(b,b)). original_body(20, pos, robot, s(b,b)). 
original_head(21, on(b,c)). original_body(21, pos, robot, s(b,c)). 
original_head(22, on(c,a)). original_body(22, pos, robot, s(c,a)). 
original_head(23, on(c,b)). original_body(23, pos, robot, s(c,b)). 
original_head(24, on(c,c)). original_body(24, pos, robot, s(c,c)). 
original_head(25, on(a,a)). original_body(25, pos, robot, s(a,a)). original_body(25, pos, on(a,a)). 
original_head(26, on(a,a)). original_body(26, pos, robot, s(a,b)). original_body(26, pos, on(a,a)). 
original_head(27, on(a,a)). original_body(27, pos, robot, s(a,c)). original_body(27, pos, on(a,a)). 
original_head(28, on(a,a)). original_body(28, pos, robot, s(b,a)). original_body(28, pos, on(a,a)). 
original_head(29, on(a,a)). original_body(29, pos, robot, s(b,b)). original_body(29, pos, on(a,a)). 
original_head(30, on(a,a)). original_body(30, pos, robot, s(b,c)). original_body(30, pos, on(a,a)). 
original_head(31, on(a,a)). original_body(31, pos, robot, s(c,a)). original_body(31, pos, on(a,a)). 
original_head(32, on(a,a)). original_body(32, pos, robot, s(c,b)). original_body(32, pos, on(a,a)). 
original_head(33, on(a,a)). original_body(33, pos, robot, s(c,c)). original_body(33, pos, on(a,a)). 
original_head(34, on(a,b)). original_body(34, pos, robot, s(a,a)). original_body(34, pos, on(a,b)). 
original_head(35, on(a,b)). original_body(35, pos, robot, s(a,b)). original_body(35, pos, on(a,b)). 
original_head(36, on(a,b)). original_body(36, pos, robot, s(a,c)). original_body(36, pos, on(a,b)). 
original_head(37, on(a,b)). original_body(37, pos, robot, s(b,a)). original_body(37, pos, on(a,b)). 
original_head(38, on(a,b)). original_body(38, pos, robot, s(b,b)). original_body(38, pos, on(a,b)). 
original_head(39, on(a,b)). original_body(39, pos, robot, s(b,c)). original_body(39, pos, on(a,b)). 
original_head(40, on(a,b)). original_body(40, pos, robot, s(c,a)). original_body(40, pos, on(a,b)). 
original_head(41, on(a,b)). original_body(41, pos, robot, s(c,b)). original_body(41, pos, on(a,b)). 
original_head(42, on(a,b)). original_body(42, pos, robot, s(c,c)). original_body(42, pos, on(a,b)). 
original_head(43, on(a,c)). original_body(43, pos, robot, s(a,a)). original_body(43, pos, on(a,c)). 
original_head(44, on(a,c)). original_body(44, pos, robot, s(a,b)). original_body(44, pos, on(a,c)). 
original_head(45, on(a,c)). original_body(45, pos, robot, s(a,c)). original_body(45, pos, on(a,c)). 
original_head(46, on(a,c)). original_body(46, pos, robot, s(b,a)). original_body(46, pos, on(a,c)). 
original_head(47, on(a,c)). original_body(47, pos, robot, s(b,b)). original_body(47, pos, on(a,c)). 
original_head(48, on(a,c)). original_body(48, pos, robot, s(b,c)). original_body(48, pos, on(a,c)). 
original_head(49, on(a,c)). original_body(49, pos, robot, s(c,a)). original_body(49, pos, on(a,c)). 
original_head(50, on(a,c)). original_body(50, pos, robot, s(c,b)). original_body(50, pos, on(a,c)). 
original_head(51, on(a,c)). original_body(51, pos, robot, s(c,c)). original_body(51, pos, on(a,c)). 
original_head(52, on(b,a)). original_body(52, pos, robot, s(a,a)). original_body(52, pos, on(b,a)). 
original_head(53, on(b,a)). original_body(53, pos, robot, s(a,b)). original_body(53, pos, on(b,a)). 
original_head(54, on(b,a)). original_body(54, pos, robot, s(a,c)). original_body(54, pos, on(b,a)). 
original_head(55, on(b,a)). original_body(55, pos, robot, s(b,a)). original_body(55, pos, on(b,a)). 
original_head(56, on(b,a)). original_body(56, pos, robot, s(b,b)). original_body(56, pos, on(b,a)). 
original_head(57, on(b,a)). original_body(57, pos, robot, s(b,c)). original_body(57, pos, on(b,a)). 
original_head(58, on(b,a)). original_body(58, pos, robot, s(c,a)). original_body(58, pos, on(b,a)). 
original_head(59, on(b,a)). original_body(59, pos, robot, s(c,b)). original_body(59, pos, on(b,a)). 
original_head(60, on(b,a)). original_body(60, pos, robot, s(c,c)). original_body(60, pos, on(b,a)). 
original_head(61, on(b,b)). original_body(61, pos, robot, s(a,a)). original_body(61, pos, on(b,b)). 
original_head(62, on(b,b)). original_body(62, pos, robot, s(a,b)). original_body(62, pos, on(b,b)). 
original_head(63, on(b,b)). original_body(63, pos, robot, s(a,c)). original_body(63, pos, on(b,b)). 
original_head(64, on(b,b)). original_body(64, pos, robot, s(b,a)). original_body(64, pos, on(b,b)). 
original_head(65, on(b,b)). original_body(65, pos, robot, s(b,b)). original_body(65, pos, on(b,b)). 
original_head(66, on(b,b)). original_body(66, pos, robot, s(b,c)). original_body(66, pos, on(b,b)). 
original_head(67, on(b,b)). original_body(67, pos, robot, s(c,a)). original_body(67, pos, on(b,b)). 
original_head(68, on(b,b)). original_body(68, pos, robot, s(c,b)). original_body(68, pos, on(b,b)). 
original_head(69, on(b,b)). original_body(69, pos, robot, s(c,c)). original_body(69, pos, on(b,b)). 
original_head(70, on(b,c)). original_body(70, pos, robot, s(a,a)). original_body(70, pos, on(b,c)). 
original_head(71, on(b,c)). original_body(71, pos, robot, s(a,b)). original_body(71, pos, on(b,c)). 
original_head(72, on(b,c)). original_body(72, pos, robot, s(a,c)). original_body(72, pos, on(b,c)). 
original_head(73, on(b,c)). original_body(73, pos, robot, s(b,a)). original_body(73, pos, on(b,c)). 
original_head(74, on(b,c)). original_body(74, pos, robot, s(b,b)). original_body(74, pos, on(b,c)). 
original_head(75, on(b,c)). original_body(75, pos, robot, s(b,c)). original_body(75, pos, on(b,c)). 
original_head(76, on(b,c)). original_body(76, pos, robot, s(c,a)). original_body(76, pos, on(b,c)). 
original_head(77, on(b,c)). original_body(77, pos, robot, s(c,b)). original_body(77, pos, on(b,c)). 
original_head(78, on(b,c)). original_body(78, pos, robot, s(c,c)). original_body(78, pos, on(b,c)). 
original_head(79, on(c,a)). original_body(79, pos, robot, s(a,a)). original_body(79, pos, on(c,a)). 
original_head(80, on(c,a)). original_body(80, pos, robot, s(a,b)). original_body(80, pos, on(c,a)). 
original_head(81, on(c,a)). original_body(81, pos, robot, s(a,c)). original_body(81, pos, on(c,a)). 
original_head(82, on(c,a)). original_body(82, pos, robot, s(b,a)). original_body(82, pos, on(c,a)). 
original_head(83, on(c,a)). original_body(83, pos, robot, s(b,b)). original_body(83, pos, on(c,a)). 
original_head(84, on(c,a)). original_body(84, pos, robot, s(b,c)). original_body(84, pos, on(c,a)). 
original_head(85, on(c,a)). original_body(85, pos, robot, s(c,a)). original_body(85, pos, on(c,a)). 
original_head(86, on(c,a)). original_body(86, pos, robot, s(c,b)). original_body(86, pos, on(c,a)). 
original_head(87, on(c,a)). original_body(87, pos, robot, s(c,c)). original_body(87, pos, on(c,a)). 
original_head(88, on(c,b)). original_body(88, pos, robot, s(a,a)). original_body(88, pos, on(c,b)). 
original_head(89, on(c,b)). original_body(89, pos, robot, s(a,b)). original_body(89, pos, on(c,b)). 
original_head(90, on(c,b)). original_body(90, pos, robot, s(a,c)). original_body(90, pos, on(c,b)). 
original_head(91, on(c,b)). original_body(91, pos, robot, s(b,a)). original_body(91, pos, on(c,b)). 
original_head(92, on(c,b)). original_body(92, pos, robot, s(b,b)). original_body(92, pos, on(c,b)). 
original_head(93, on(c,b)). original_body(93, pos, robot, s(b,c)). original_body(93, pos, on(c,b)). 
original_head(94, on(c,b)). original_body(94, pos, robot, s(c,a)). original_body(94, pos, on(c,b)). 
original_head(95, on(c,b)). original_body(95, pos, robot, s(c,b)). original_body(95, pos, on(c,b)). 
original_head(96, on(c,b)). original_body(96, pos, robot, s(c,c)). original_body(96, pos, on(c,b)). 
original_head(97, on(c,c)). original_body(97, pos, robot, s(a,a)). original_body(97, pos, on(c,c)). 
original_head(98, on(c,c)). original_body(98, pos, robot, s(a,b)). original_body(98, pos, on(c,c)). 
original_head(99, on(c,c)). original_body(99, pos, robot, s(a,c)). original_body(99, pos, on(c,c)). 
original_head(100, on(c,c)). original_body(100, pos, robot, s(b,a)). original_body(100, pos, on(c,c)). 
original_head(101, on(c,c)). original_body(101, pos, robot, s(b,b)). original_body(101, pos, on(c,c)). 
original_head(102, on(c,c)). original_body(102, pos, robot, s(b,c)). original_body(102, pos, on(c,c)). 
original_head(103, on(c,c)). original_body(103, pos, robot, s(c,a)). original_body(103, pos, on(c,c)). 
original_head(104, on(c,c)). original_body(104, pos, robot, s(c,b)). original_body(104, pos, on(c,c)). 
original_head(105, on(c,c)). original_body(105, pos, robot, s(c,c)). original_body(105, pos, on(c,c)). 
original_head(106, table(a)). original_body(106, pos, robot, s(b,a)). original_body(106, pos, table(a)). 
original_head(107, table(a)). original_body(107, pos, robot, s(b,b)). original_body(107, pos, table(a)). 
original_head(108, table(a)). original_body(108, pos, robot, s(b,c)). original_body(108, pos, table(a)). 
original_head(109, table(a)). original_body(109, pos, robot, s(c,a)). original_body(109, pos, table(a)). 
original_head(110, table(a)). original_body(110, pos, robot, s(c,b)). original_body(110, pos, table(a)). 
original_head(111, table(a)). original_body(111, pos, robot, s(c,c)). original_body(111, pos, table(a)). 
original_head(112, table(b)). original_body(112, pos, robot, s(a,a)). original_body(112, pos, table(b)). 
original_head(113, table(b)). original_body(113, pos, robot, s(a,b)). original_body(113, pos, table(b)). 
original_head(114, table(b)). original_body(114, pos, robot, s(a,c)). original_body(114, pos, table(b)). 
original_head(115, table(b)). original_body(115, pos, robot, s(c,a)). original_body(115, pos, table(b)). 
original_head(116, table(b)). original_body(116, pos, robot, s(c,b)). original_body(116, pos, table(b)). 
original_head(117, table(b)). original_body(117, pos, robot, s(c,c)). original_body(117, pos, table(b)). 
original_head(118, table(c)). original_body(118, pos, robot, s(a,a)). original_body(118, pos, table(c)). 
original_head(119, table(c)). original_body(119, pos, robot, s(a,b)). original_body(119, pos, table(c)). 
original_head(120, table(c)). original_body(120, pos, robot, s(a,c)). original_body(120, pos, table(c)). 
original_head(121, table(c)). original_body(121, pos, robot, s(b,a)). original_body(121, pos, table(c)). 
original_head(122, table(c)). original_body(122, pos, robot, s(b,b)). original_body(122, pos, table(c)). 
original_head(123, table(c)). original_body(123, pos, robot, s(b,c)). original_body(123, pos, table(c)). 
original_head(124, clear(a)). original_body(124, pos, robot, s(a,b)). original_body(124, pos, clear(a)). 
original_head(125, clear(a)). original_body(125, pos, robot, s(a,c)). original_body(125, pos, clear(a)). 
original_head(126, clear(a)). original_body(126, pos, robot, s(b,b)). original_body(126, pos, clear(a)). 
original_head(127, clear(a)). original_body(127, pos, robot, s(b,c)). original_body(127, pos, clear(a)). 
original_head(128, clear(a)). original_body(128, pos, robot, s(c,b)). original_body(128, pos, clear(a)). 
original_head(129, clear(a)). original_body(129, pos, robot, s(c,c)). original_body(129, pos, clear(a)). 
original_head(130, clear(b)). original_body(130, pos, robot, s(a,a)). original_body(130, pos, clear(b)). 
original_head(131, clear(b)). original_body(131, pos, robot, s(a,c)). original_body(131, pos, clear(b)). 
original_head(132, clear(b)). original_body(132, pos, robot, s(b,a)). original_body(132, pos, clear(b)). 
original_head(133, clear(b)). original_body(133, pos, robot, s(b,c)). original_body(133, pos, clear(b)). 
original_head(134, clear(b)). original_body(134, pos, robot, s(c,a)). original_body(134, pos, clear(b)). 
original_head(135, clear(b)). original_body(135, pos, robot, s(c,c)). original_body(135, pos, clear(b)). 
original_head(136, clear(c)). original_body(136, pos, robot, s(a,a)). original_body(136, pos, clear(c)). 
original_head(137, clear(c)). original_body(137, pos, robot, s(a,b)). original_body(137, pos, clear(c)). 
original_head(138, clear(c)). original_body(138, pos, robot, s(b,a)). original_body(138, pos, clear(c)). 
original_head(139, clear(c)). original_body(139, pos, robot, s(b,b)). original_body(139, pos, clear(c)). 
original_head(140, clear(c)). original_body(140, pos, robot, s(c,a)). original_body(140, pos, clear(c)). 
original_head(141, clear(c)). original_body(141, pos, robot, s(c,b)). original_body(141, pos, clear(c)). 
original_head(142, on(a,a)). original_body(142, pos, robot, u(b,a)). original_body(142, pos, on(a,a)). 
original_head(143, on(a,a)). original_body(143, pos, robot, u(b,b)). original_body(143, pos, on(a,a)). 
original_head(144, on(a,a)). original_body(144, pos, robot, u(b,c)). original_body(144, pos, on(a,a)). 
original_head(145, on(a,a)). original_body(145, pos, robot, u(c,a)). original_body(145, pos, on(a,a)). 
original_head(146, on(a,a)). original_body(146, pos, robot, u(c,b)). original_body(146, pos, on(a,a)). 
original_head(147, on(a,a)). original_body(147, pos, robot, u(c,c)). original_body(147, pos, on(a,a)). 
original_head(148, on(a,b)). original_body(148, pos, robot, u(b,a)). original_body(148, pos, on(a,b)). 
original_head(149, on(a,b)). original_body(149, pos, robot, u(b,b)). original_body(149, pos, on(a,b)). 
original_head(150, on(a,b)). original_body(150, pos, robot, u(b,c)). original_body(150, pos, on(a,b)). 
original_head(151, on(a,b)). original_body(151, pos, robot, u(c,a)). original_body(151, pos, on(a,b)). 
original_head(152, on(a,b)). original_body(152, pos, robot, u(c,b)). original_body(152, pos, on(a,b)). 
original_head(153, on(a,b)). original_body(153, pos, robot, u(c,c)). original_body(153, pos, on(a,b)). 
original_head(154, on(a,c)). original_body(154, pos, robot, u(b,a)). original_body(154, pos, on(a,c)). 
original_head(155, on(a,c)). original_body(155, pos, robot, u(b,b)). original_body(155, pos, on(a,c)). 
original_head(156, on(a,c)). original_body(156, pos, robot, u(b,c)). original_body(156, pos, on(a,c)). 
original_head(157, on(a,c)). original_body(157, pos, robot, u(c,a)). original_body(157, pos, on(a,c)). 
original_head(158, on(a,c)). original_body(158, pos, robot, u(c,b)). original_body(158, pos, on(a,c)). 
original_head(159, on(a,c)). original_body(159, pos, robot, u(c,c)). original_body(159, pos, on(a,c)). 
original_head(160, on(b,a)). original_body(160, pos, robot, u(a,a)). original_body(160, pos, on(b,a)). 
original_head(161, on(b,a)). original_body(161, pos, robot, u(a,b)). original_body(161, pos, on(b,a)). 
original_head(162, on(b,a)). original_body(162, pos, robot, u(a,c)). original_body(162, pos, on(b,a)). 
original_head(163, on(b,a)). original_body(163, pos, robot, u(c,a)). original_body(163, pos, on(b,a)). 
original_head(164, on(b,a)). original_body(164, pos, robot, u(c,b)). original_body(164, pos, on(b,a)). 
original_head(165, on(b,a)). original_body(165, pos, robot, u(c,c)). original_body(165, pos, on(b,a)). 
original_head(166, on(b,b)). original_body(166, pos, robot, u(a,a)). original_body(166, pos, on(b,b)). 
original_head(167, on(b,b)). original_body(167, pos, robot, u(a,b)). original_body(167, pos, on(b,b)). 
original_head(168, on(b,b)). original_body(168, pos, robot, u(a,c)). original_body(168, pos, on(b,b)). 
original_head(169, on(b,b)). original_body(169, pos, robot, u(c,a)). original_body(169, pos, on(b,b)). 
original_head(170, on(b,b)). original_body(170, pos, robot, u(c,b)). original_body(170, pos, on(b,b)). 
original_head(171, on(b,b)). original_body(171, pos, robot, u(c,c)). original_body(171, pos, on(b,b)). 
original_head(172, on(b,c)). original_body(172, pos, robot, u(a,a)). original_body(172, pos, on(b,c)). 
original_head(173, on(b,c)). original_body(173, pos, robot, u(a,b)). original_body(173, pos, on(b,c)). 
original_head(174, on(b,c)). original_body(174, pos, robot, u(a,c)). original_body(174, pos, on(b,c)). 
original_head(175, on(b,c)). original_body(175, pos, robot, u(c,a)). original_body(175, pos, on(b,c)). 
original_head(176, on(b,c)). original_body(176, pos, robot, u(c,b)). original_body(176, pos, on(b,c)). 
original_head(177, on(b,c)). original_body(177, pos, robot, u(c,c)). original_body(177, pos, on(b,c)). 
original_head(178, on(c,a)). original_body(178, pos, robot, u(a,a)). original_body(178, pos, on(c,a)). 
original_head(179, on(c,a)). original_body(179, pos, robot, u(a,b)). original_body(179, pos, on(c,a)). 
original_head(180, on(c,a)). original_body(180, pos, robot, u(a,c)). original_body(180, pos, on(c,a)). 
original_head(181, on(c,a)). original_body(181, pos, robot, u(b,a)). original_body(181, pos, on(c,a)). 
original_head(182, on(c,a)). original_body(182, pos, robot, u(b,b)). original_body(182, pos, on(c,a)). 
original_head(183, on(c,a)). original_body(183, pos, robot, u(b,c)). original_body(183, pos, on(c,a)). 
original_head(184, on(c,b)). original_body(184, pos, robot, u(a,a)). original_body(184, pos, on(c,b)). 
original_head(185, on(c,b)). original_body(185, pos, robot, u(a,b)). original_body(185, pos, on(c,b)). 
original_head(186, on(c,b)). original_body(186, pos, robot, u(a,c)). original_body(186, pos, on(c,b)). 
original_head(187, on(c,b)). original_body(187, pos, robot, u(b,a)). original_body(187, pos, on(c,b)). 
original_head(188, on(c,b)). original_body(188, pos, robot, u(b,b)). original_body(188, pos, on(c,b)). 
original_head(189, on(c,b)). original_body(189, pos, robot, u(b,c)). original_body(189, pos, on(c,b)). 
original_head(190, on(c,c)). original_body(190, pos, robot, u(a,a)). original_body(190, pos, on(c,c)). 
original_head(191, on(c,c)). original_body(191, pos, robot, u(a,b)). original_body(191, pos, on(c,c)). 
original_head(192, on(c,c)). original_body(192, pos, robot, u(a,c)). original_body(192, pos, on(c,c)). 
original_head(193, on(c,c)). original_body(193, pos, robot, u(b,a)). original_body(193, pos, on(c,c)). 
original_head(194, on(c,c)). original_body(194, pos, robot, u(b,b)). original_body(194, pos, on(c,c)). 
original_head(195, on(c,c)). original_body(195, pos, robot, u(b,c)). original_body(195, pos, on(c,c)). 
original_head(196, table(a)). original_body(196, pos, robot, u(a,a)). 
original_head(197, table(a)). original_body(197, pos, robot, u(a,b)). 
original_head(198, table(a)). original_body(198, pos, robot, u(a,c)). 
original_head(199, table(b)). original_body(199, pos, robot, u(b,a)). 
original_head(200, table(b)). original_body(200, pos, robot, u(b,b)). 
original_head(201, table(b)). original_body(201, pos, robot, u(b,c)). 
original_head(202, table(c)). original_body(202, pos, robot, u(c,a)). 
original_head(203, table(c)). original_body(203, pos, robot, u(c,b)). 
original_head(204, table(c)). original_body(204, pos, robot, u(c,c)). 
original_head(205, clear(a)). original_body(205, pos, robot, u(a,a)). 
original_head(206, clear(b)). original_body(206, pos, robot, u(a,b)). 
original_head(207, clear(c)). original_body(207, pos, robot, u(a,c)). 
original_head(208, clear(a)). original_body(208, pos, robot, u(b,a)). 
original_head(209, clear(b)). original_body(209, pos, robot, u(b,b)). 
original_head(210, clear(c)). original_body(210, pos, robot, u(b,c)). 
original_head(211, clear(a)). original_body(211, pos, robot, u(c,a)). 
original_head(212, clear(b)). original_body(212, pos, robot, u(c,b)). 
original_head(213, clear(c)). original_body(213, pos, robot, u(c,c)). 
original_head(214, table(a)). original_body(214, pos, robot, u(a,a)). original_body(214, pos, table(a)). 
original_head(215, table(a)). original_body(215, pos, robot, u(a,b)). original_body(215, pos, table(a)). 
original_head(216, table(a)). original_body(216, pos, robot, u(a,c)). original_body(216, pos, table(a)). 
original_head(217, table(a)). original_body(217, pos, robot, u(b,a)). original_body(217, pos, table(a)). 
original_head(218, table(a)). original_body(218, pos, robot, u(b,b)). original_body(218, pos, table(a)). 
original_head(219, table(a)). original_body(219, pos, robot, u(b,c)). original_body(219, pos, table(a)). 
original_head(220, table(a)). original_body(220, pos, robot, u(c,a)). original_body(220, pos, table(a)). 
original_head(221, table(a)). original_body(221, pos, robot, u(c,b)). original_body(221, pos, table(a)). 
original_head(222, table(a)). original_body(222, pos, robot, u(c,c)). original_body(222, pos, table(a)). 
original_head(223, table(b)). original_body(223, pos, robot, u(a,a)). original_body(223, pos, table(b)). 
original_head(224, table(b)). original_body(224, pos, robot, u(a,b)). original_body(224, pos, table(b)). 
original_head(225, table(b)). original_body(225, pos, robot, u(a,c)). original_body(225, pos, table(b)). 
original_head(226, table(b)). original_body(226, pos, robot, u(b,a)). original_body(226, pos, table(b)). 
original_head(227, table(b)). original_body(227, pos, robot, u(b,b)). original_body(227, pos, table(b)). 
original_head(228, table(b)). original_body(228, pos, robot, u(b,c)). original_body(228, pos, table(b)). 
original_head(229, table(b)). original_body(229, pos, robot, u(c,a)). original_body(229, pos, table(b)). 
original_head(230, table(b)). original_body(230, pos, robot, u(c,b)). original_body(230, pos, table(b)). 
original_head(231, table(b)). original_body(231, pos, robot, u(c,c)). original_body(231, pos, table(b)). 
original_head(232, table(c)). original_body(232, pos, robot, u(a,a)). original_body(232, pos, table(c)). 
original_head(233, table(c)). original_body(233, pos, robot, u(a,b)). original_body(233, pos, table(c)). 
original_head(234, table(c)). original_body(234, pos, robot, u(a,c)). original_body(234, pos, table(c)). 
original_head(235, table(c)). original_body(235, pos, robot, u(b,a)). original_body(235, pos, table(c)). 
original_head(236, table(c)). original_body(236, pos, robot, u(b,b)). original_body(236, pos, table(c)). 
original_head(237, table(c)). original_body(237, pos, robot, u(b,c)). original_body(237, pos, table(c)). 
original_head(238, table(c)). original_body(238, pos, robot, u(c,a)). original_body(238, pos, table(c)). 
original_head(239, table(c)). original_body(239, pos, robot, u(c,b)). original_body(239, pos, table(c)). 
original_head(240, table(c)). original_body(240, pos, robot, u(c,c)). original_body(240, pos, table(c)). 
original_head(241, clear(a)). original_body(241, pos, robot, u(a,a)). original_body(241, pos, clear(a)). 
original_head(242, clear(a)). original_body(242, pos, robot, u(a,b)). original_body(242, pos, clear(a)). 
original_head(243, clear(a)). original_body(243, pos, robot, u(a,c)). original_body(243, pos, clear(a)). 
original_head(244, clear(a)). original_body(244, pos, robot, u(b,a)). original_body(244, pos, clear(a)). 
original_head(245, clear(a)). original_body(245, pos, robot, u(b,b)). original_body(245, pos, clear(a)). 
original_head(246, clear(a)). original_body(246, pos, robot, u(b,c)). original_body(246, pos, clear(a)). 
original_head(247, clear(a)). original_body(247, pos, robot, u(c,a)). original_body(247, pos, clear(a)). 
original_head(248, clear(a)). original_body(248, pos, robot, u(c,b)). original_body(248, pos, clear(a)). 
original_head(249, clear(a)). original_body(249, pos, robot, u(c,c)). original_body(249, pos, clear(a)). 
original_head(250, clear(b)). original_body(250, pos, robot, u(a,a)). original_body(250, pos, clear(b)). 
original_head(251, clear(b)). original_body(251, pos, robot, u(a,b)). original_body(251, pos, clear(b)). 
original_head(252, clear(b)). original_body(252, pos, robot, u(a,c)). original_body(252, pos, clear(b)). 
original_head(253, clear(b)). original_body(253, pos, robot, u(b,a)). original_body(253, pos, clear(b)). 
original_head(254, clear(b)). original_body(254, pos, robot, u(b,b)). original_body(254, pos, clear(b)). 
original_head(255, clear(b)). original_body(255, pos, robot, u(b,c)). original_body(255, pos, clear(b)). 
original_head(256, clear(b)). original_body(256, pos, robot, u(c,a)). original_body(256, pos, clear(b)). 
original_head(257, clear(b)). original_body(257, pos, robot, u(c,b)). original_body(257, pos, clear(b)). 
original_head(258, clear(b)). original_body(258, pos, robot, u(c,c)). original_body(258, pos, clear(b)). 
original_head(259, clear(c)). original_body(259, pos, robot, u(a,a)). original_body(259, pos, clear(c)). 
original_head(260, clear(c)). original_body(260, pos, robot, u(a,b)). original_body(260, pos, clear(c)). 
original_head(261, clear(c)). original_body(261, pos, robot, u(a,c)). original_body(261, pos, clear(c)). 
original_head(262, clear(c)). original_body(262, pos, robot, u(b,a)). original_body(262, pos, clear(c)). 
original_head(263, clear(c)). original_body(263, pos, robot, u(b,b)). original_body(263, pos, clear(c)). 
original_head(264, clear(c)). original_body(264, pos, robot, u(b,c)). original_body(264, pos, clear(c)). 
original_head(265, clear(c)). original_body(265, pos, robot, u(c,a)). original_body(265, pos, clear(c)). 
original_head(266, clear(c)). original_body(266, pos, robot, u(c,b)). original_body(266, pos, clear(c)). 
original_head(267, clear(c)). original_body(267, pos, robot, u(c,c)). original_body(267, pos, clear(c)). 
original_head(268, step(2)). original_body(268, pos, step(1)). 
original_head(269, step(3)). original_body(269, pos, step(2)). 
original_head(270, step(4)). original_body(270, pos, step(3)). 
legal_rule(1..15).
old_rule(1..270).
rule(1..270).
goal(robot,100,J,T) :- true(on(a,b),J,T), true(on(b,c),J,T), program(J), tdom(T).
goal(robot,0,J,T) :- not true(on(a,b),J,T), program(J), tdom(T).
goal(robot,0,J,T) :- not true(on(b,c),J,T), program(J), tdom(T).
terminal(J,T) :- true(step(4),J,T), program(J), tdom(T).
terminal(J,T) :- true(on(a,b),J,T), true(on(b,c),J,T), program(J), tdom(T).
