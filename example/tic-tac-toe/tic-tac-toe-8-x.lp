tdom(1..10).
role(xplayer).
role(oplayer).
base(cell(1..3,1..3,x)).
base(cell(1..3,1..3,o)).
base(cell(1..3,1..3,b)).
base(control(xplayer)).
base(control(oplayer)).
input(xplayer, mark(1..3,1..3)).
input(oplayer, mark(1..3,1..3)).
input(xplayer, noop).
input(oplayer, noop).
init(cell(1,1,b)).
init(cell(1,2,b)).
init(cell(1,3,b)).
init(cell(2,1,b)).
init(cell(2,2,b)).
init(cell(2,3,b)).
init(cell(3,1,b)).
init(cell(3,2,b)).
init(cell(3,3,b)).
init(control(xplayer)).
original_head(1, xplayer, noop). original_body(1, pos, control(oplayer)). 
original_head(2, oplayer, noop). original_body(2, pos, control(xplayer)). 
original_head(3, xplayer, mark(1,1)). original_body(3, pos, control(xplayer)). original_body(3, pos, cell(1,1,b)). 
original_head(4, oplayer, mark(1,1)). original_body(4, pos, control(oplayer)). original_body(4, pos, cell(1,1,b)). 
original_head(5, xplayer, mark(1,2)). original_body(5, pos, control(xplayer)). original_body(5, pos, cell(1,2,b)). 
original_head(6, oplayer, mark(1,2)). original_body(6, pos, control(oplayer)). original_body(6, pos, cell(1,2,b)). 
original_head(7, xplayer, mark(1,3)). original_body(7, pos, control(xplayer)). original_body(7, pos, cell(1,3,b)). 
original_head(8, oplayer, mark(1,3)). original_body(8, pos, control(oplayer)). original_body(8, pos, cell(1,3,b)). 
original_head(9, xplayer, mark(2,1)). original_body(9, pos, control(xplayer)). original_body(9, pos, cell(2,1,b)). 
original_head(10, oplayer, mark(2,1)). original_body(10, pos, control(oplayer)). original_body(10, pos, cell(2,1,b)). 
original_head(11, xplayer, mark(2,2)). original_body(11, pos, control(xplayer)). original_body(11, pos, cell(2,2,b)). 
original_head(12, oplayer, mark(2,2)). original_body(12, pos, control(oplayer)). original_body(12, pos, cell(2,2,b)). 
original_head(13, xplayer, mark(2,3)). original_body(13, pos, control(xplayer)). original_body(13, pos, cell(2,3,b)). 
original_head(14, oplayer, mark(2,3)). original_body(14, pos, control(oplayer)). original_body(14, pos, cell(2,3,b)). 
original_head(15, xplayer, mark(3,1)). original_body(15, pos, control(xplayer)). original_body(15, pos, cell(3,1,b)). 
original_head(16, oplayer, mark(3,1)). original_body(16, pos, control(oplayer)). original_body(16, pos, cell(3,1,b)). 
original_head(17, xplayer, mark(3,2)). original_body(17, pos, control(xplayer)). original_body(17, pos, cell(3,2,b)). 
original_head(18, oplayer, mark(3,2)). original_body(18, pos, control(oplayer)). original_body(18, pos, cell(3,2,b)). 
original_head(19, xplayer, mark(3,3)). original_body(19, pos, control(xplayer)). original_body(19, pos, cell(3,3,b)). 
original_head(20, oplayer, mark(3,3)). original_body(20, pos, control(oplayer)). original_body(20, pos, cell(3,3,b)). 
original_head(21, control(xplayer)). original_body(21, pos, control(oplayer)). 
original_head(22, control(oplayer)). original_body(22, pos, control(xplayer)). 
original_head(23, cell(1,1,x)). original_body(23, pos, xplayer, mark(1,1)). original_body(23, pos, cell(1,1,b)). 
original_head(24, cell(1,1,o)). original_body(24, pos, oplayer, mark(1,1)). original_body(24, pos, cell(1,1,b)). 
original_head(25, cell(1,1,x)). original_body(25, pos, cell(1,1,x)). 
original_head(26, cell(1,1,o)). original_body(26, pos, cell(1,1,o)). 
original_head(27, cell(1,2,x)). original_body(27, pos, xplayer, mark(1,2)). original_body(27, pos, cell(1,2,b)). 
original_head(28, cell(1,2,x)). original_body(28, pos, oplayer, mark(1,2)). original_body(28, pos, cell(1,2,b)). 
original_head(29, cell(1,2,x)). original_body(29, pos, cell(1,2,x)). 
original_head(30, cell(1,2,o)). original_body(30, pos, cell(1,2,o)). 
original_head(31, cell(1,3,x)). original_body(31, pos, xplayer, mark(1,3)). original_body(31, pos, cell(1,3,b)). 
original_head(32, cell(1,3,x)). original_body(32, pos, oplayer, mark(1,3)). original_body(32, pos, cell(1,3,b)). 
original_head(33, cell(1,3,x)). original_body(33, pos, cell(1,3,x)). 
original_head(34, cell(1,3,o)). original_body(34, pos, cell(1,3,o)). 
original_head(35, cell(2,1,x)). original_body(35, pos, xplayer, mark(2,1)). original_body(35, pos, cell(2,1,b)). 
original_head(36, cell(2,1,x)). original_body(36, pos, oplayer, mark(2,1)). original_body(36, pos, cell(2,1,b)). 
original_head(37, cell(2,1,x)). original_body(37, pos, cell(2,1,x)). 
original_head(38, cell(2,1,o)). original_body(38, pos, cell(2,1,o)). 
original_head(39, cell(2,2,x)). original_body(39, pos, xplayer, mark(2,2)). original_body(39, pos, cell(2,2,b)). 
original_head(40, cell(2,2,x)). original_body(40, pos, oplayer, mark(2,2)). original_body(40, pos, cell(2,2,b)). 
original_head(41, cell(2,2,x)). original_body(41, pos, cell(2,2,x)). 
original_head(42, cell(2,2,o)). original_body(42, pos, cell(2,2,o)). 
original_head(43, cell(2,3,x)). original_body(43, pos, xplayer, mark(2,3)). original_body(43, pos, cell(2,3,b)). 
original_head(44, cell(2,3,x)). original_body(44, pos, oplayer, mark(2,3)). original_body(44, pos, cell(2,3,b)). 
original_head(45, cell(2,3,x)). original_body(45, pos, cell(2,3,x)). 
original_head(46, cell(2,3,o)). original_body(46, pos, cell(2,3,o)). 
original_head(47, cell(3,1,x)). original_body(47, pos, xplayer, mark(3,1)). original_body(47, pos, cell(3,1,b)). 
original_head(48, cell(3,1,x)). original_body(48, pos, oplayer, mark(3,1)). original_body(48, pos, cell(3,1,b)). 
original_head(49, cell(3,1,x)). original_body(49, pos, cell(3,1,x)). 
original_head(50, cell(3,1,o)). original_body(50, pos, cell(3,1,o)). 
original_head(51, cell(3,2,x)). original_body(51, pos, xplayer, mark(3,2)). original_body(51, pos, cell(3,2,b)). 
original_head(52, cell(3,2,x)). original_body(52, pos, oplayer, mark(3,2)). original_body(52, pos, cell(3,2,b)). 
original_head(53, cell(3,2,x)). original_body(53, pos, cell(3,2,x)). 
original_head(54, cell(3,2,o)). original_body(54, pos, cell(3,2,o)). 
original_head(55, cell(3,3,x)). original_body(55, pos, xplayer, mark(3,3)). original_body(55, pos, cell(3,3,b)). 
original_head(56, cell(3,3,x)). original_body(56, pos, oplayer, mark(3,3)). original_body(56, pos, cell(3,3,b)). 
original_head(57, cell(3,3,x)). original_body(57, pos, cell(3,3,x)). 
original_head(58, cell(3,3,o)). original_body(58, pos, cell(3,3,o)). 
original_head(59, cell(1,1,b)). original_body(59, pos, cell(1,1,b)). original_body(59, pos, xplayer, mark(1,2)). 
original_head(60, cell(1,1,b)). original_body(60, pos, cell(1,1,b)). original_body(60, pos, oplayer, mark(1,2)). 
original_head(61, cell(1,1,b)). original_body(61, pos, cell(1,1,b)). original_body(61, pos, xplayer, mark(1,3)). 
original_head(62, cell(1,1,b)). original_body(62, pos, cell(1,1,b)). original_body(62, pos, oplayer, mark(1,3)). 
original_head(63, cell(1,1,b)). original_body(63, pos, cell(1,1,b)). original_body(63, pos, xplayer, mark(2,1)). 
original_head(64, cell(1,1,b)). original_body(64, pos, cell(1,1,b)). original_body(64, pos, oplayer, mark(2,1)). 
original_head(65, cell(1,1,b)). original_body(65, pos, cell(1,1,b)). original_body(65, pos, xplayer, mark(2,2)). 
original_head(66, cell(1,1,b)). original_body(66, pos, cell(1,1,b)). original_body(66, pos, oplayer, mark(2,2)). 
original_head(67, cell(1,1,b)). original_body(67, pos, cell(1,1,b)). original_body(67, pos, xplayer, mark(2,3)). 
original_head(68, cell(1,1,b)). original_body(68, pos, cell(1,1,b)). original_body(68, pos, oplayer, mark(2,3)). 
original_head(69, cell(1,1,b)). original_body(69, pos, cell(1,1,b)). original_body(69, pos, xplayer, mark(3,1)). 
original_head(70, cell(1,1,b)). original_body(70, pos, cell(1,1,b)). original_body(70, pos, oplayer, mark(3,1)). 
original_head(71, cell(1,1,b)). original_body(71, pos, cell(1,1,b)). original_body(71, pos, xplayer, mark(3,2)). 
original_head(72, cell(1,1,b)). original_body(72, pos, cell(1,1,b)). original_body(72, pos, oplayer, mark(3,2)). 
original_head(73, cell(1,1,b)). original_body(73, pos, cell(1,1,b)). original_body(73, pos, xplayer, mark(3,3)). 
original_head(74, cell(1,1,b)). original_body(74, pos, cell(1,1,b)). original_body(74, pos, oplayer, mark(3,3)). 
original_head(75, cell(1,2,b)). original_body(75, pos, cell(1,2,b)). original_body(75, pos, xplayer, mark(1,1)). 
original_head(76, cell(1,2,b)). original_body(76, pos, cell(1,2,b)). original_body(76, pos, oplayer, mark(1,1)). 
original_head(77, cell(1,2,b)). original_body(77, pos, cell(1,2,b)). original_body(77, pos, xplayer, mark(1,3)). 
original_head(78, cell(1,2,b)). original_body(78, pos, cell(1,2,b)). original_body(78, pos, oplayer, mark(1,3)). 
original_head(79, cell(1,2,b)). original_body(79, pos, cell(1,2,b)). original_body(79, pos, xplayer, mark(2,1)). 
original_head(80, cell(1,2,b)). original_body(80, pos, cell(1,2,b)). original_body(80, pos, oplayer, mark(2,1)). 
original_head(81, cell(1,2,b)). original_body(81, pos, cell(1,2,b)). original_body(81, pos, xplayer, mark(2,2)). 
original_head(82, cell(1,2,b)). original_body(82, pos, cell(1,2,b)). original_body(82, pos, oplayer, mark(2,2)). 
original_head(83, cell(1,2,b)). original_body(83, pos, cell(1,2,b)). original_body(83, pos, xplayer, mark(2,3)). 
original_head(84, cell(1,2,b)). original_body(84, pos, cell(1,2,b)). original_body(84, pos, oplayer, mark(2,3)). 
original_head(85, cell(1,2,b)). original_body(85, pos, cell(1,2,b)). original_body(85, pos, xplayer, mark(3,1)). 
original_head(86, cell(1,2,b)). original_body(86, pos, cell(1,2,b)). original_body(86, pos, oplayer, mark(3,1)). 
original_head(87, cell(1,2,b)). original_body(87, pos, cell(1,2,b)). original_body(87, pos, xplayer, mark(3,2)). 
original_head(88, cell(1,2,b)). original_body(88, pos, cell(1,2,b)). original_body(88, pos, oplayer, mark(3,2)). 
original_head(89, cell(1,2,b)). original_body(89, pos, cell(1,2,b)). original_body(89, pos, xplayer, mark(3,3)). 
original_head(90, cell(1,2,b)). original_body(90, pos, cell(1,2,b)). original_body(90, pos, oplayer, mark(3,3)). 
original_head(91, cell(1,3,b)). original_body(91, pos, cell(1,3,b)). original_body(91, pos, xplayer, mark(1,1)). 
original_head(92, cell(1,3,b)). original_body(92, pos, cell(1,3,b)). original_body(92, pos, oplayer, mark(1,1)). 
original_head(93, cell(1,3,b)). original_body(93, pos, cell(1,3,b)). original_body(93, pos, xplayer, mark(1,2)). 
original_head(94, cell(1,3,b)). original_body(94, pos, cell(1,3,b)). original_body(94, pos, oplayer, mark(1,2)). 
original_head(95, cell(1,3,b)). original_body(95, pos, cell(1,3,b)). original_body(95, pos, xplayer, mark(2,1)). 
original_head(96, cell(1,3,b)). original_body(96, pos, cell(1,3,b)). original_body(96, pos, oplayer, mark(2,1)). 
original_head(97, cell(1,3,b)). original_body(97, pos, cell(1,3,b)). original_body(97, pos, xplayer, mark(2,2)). 
original_head(98, cell(1,3,b)). original_body(98, pos, cell(1,3,b)). original_body(98, pos, oplayer, mark(2,2)). 
original_head(99, cell(1,3,b)). original_body(99, pos, cell(1,3,b)). original_body(99, pos, xplayer, mark(2,3)). 
original_head(100, cell(1,3,b)). original_body(100, pos, cell(1,3,b)). original_body(100, pos, oplayer, mark(2,3)). 
original_head(101, cell(1,3,b)). original_body(101, pos, cell(1,3,b)). original_body(101, pos, xplayer, mark(3,1)). 
original_head(102, cell(1,3,b)). original_body(102, pos, cell(1,3,b)). original_body(102, pos, oplayer, mark(3,1)). 
original_head(103, cell(1,3,b)). original_body(103, pos, cell(1,3,b)). original_body(103, pos, xplayer, mark(3,2)). 
original_head(104, cell(1,3,b)). original_body(104, pos, cell(1,3,b)). original_body(104, pos, oplayer, mark(3,2)). 
original_head(105, cell(1,3,b)). original_body(105, pos, cell(1,3,b)). original_body(105, pos, xplayer, mark(3,3)). 
original_head(106, cell(1,3,b)). original_body(106, pos, cell(1,3,b)). original_body(106, pos, oplayer, mark(3,3)). 
original_head(107, cell(2,1,b)). original_body(107, pos, cell(2,1,b)). original_body(107, pos, xplayer, mark(1,1)). 
original_head(108, cell(2,1,b)). original_body(108, pos, cell(2,1,b)). original_body(108, pos, oplayer, mark(1,1)). 
original_head(109, cell(2,1,b)). original_body(109, pos, cell(2,1,b)). original_body(109, pos, xplayer, mark(1,2)). 
original_head(110, cell(2,1,b)). original_body(110, pos, cell(2,1,b)). original_body(110, pos, oplayer, mark(1,2)). 
original_head(111, cell(2,1,b)). original_body(111, pos, cell(2,1,b)). original_body(111, pos, xplayer, mark(1,3)). 
original_head(112, cell(2,1,b)). original_body(112, pos, cell(2,1,b)). original_body(112, pos, oplayer, mark(1,3)). 
original_head(113, cell(2,1,b)). original_body(113, pos, cell(2,1,b)). original_body(113, pos, xplayer, mark(2,2)). 
original_head(114, cell(2,1,b)). original_body(114, pos, cell(2,1,b)). original_body(114, pos, oplayer, mark(2,2)). 
original_head(115, cell(2,1,b)). original_body(115, pos, cell(2,1,b)). original_body(115, pos, xplayer, mark(2,3)). 
original_head(116, cell(2,1,b)). original_body(116, pos, cell(2,1,b)). original_body(116, pos, oplayer, mark(2,3)). 
original_head(117, cell(2,1,b)). original_body(117, pos, cell(2,1,b)). original_body(117, pos, xplayer, mark(3,1)). 
original_head(118, cell(2,1,b)). original_body(118, pos, cell(2,1,b)). original_body(118, pos, oplayer, mark(3,1)). 
original_head(119, cell(2,1,b)). original_body(119, pos, cell(2,1,b)). original_body(119, pos, xplayer, mark(3,2)). 
original_head(120, cell(2,1,b)). original_body(120, pos, cell(2,1,b)). original_body(120, pos, oplayer, mark(3,2)). 
original_head(121, cell(2,1,b)). original_body(121, pos, cell(2,1,b)). original_body(121, pos, xplayer, mark(3,3)). 
original_head(122, cell(2,1,b)). original_body(122, pos, cell(2,1,b)). original_body(122, pos, oplayer, mark(3,3)). 
original_head(123, cell(2,2,b)). original_body(123, pos, cell(2,2,b)). original_body(123, pos, xplayer, mark(1,1)). 
original_head(124, cell(2,2,b)). original_body(124, pos, cell(2,2,b)). original_body(124, pos, oplayer, mark(1,1)). 
original_head(125, cell(2,2,b)). original_body(125, pos, cell(2,2,b)). original_body(125, pos, xplayer, mark(1,2)). 
original_head(126, cell(2,2,b)). original_body(126, pos, cell(2,2,b)). original_body(126, pos, oplayer, mark(1,2)). 
original_head(127, cell(2,2,b)). original_body(127, pos, cell(2,2,b)). original_body(127, pos, xplayer, mark(1,3)). 
original_head(128, cell(2,2,b)). original_body(128, pos, cell(2,2,b)). original_body(128, pos, oplayer, mark(1,3)). 
original_head(129, cell(2,2,b)). original_body(129, pos, cell(2,2,b)). original_body(129, pos, xplayer, mark(2,1)). 
original_head(130, cell(2,2,b)). original_body(130, pos, cell(2,2,b)). original_body(130, pos, oplayer, mark(2,1)). 
original_head(131, cell(2,2,b)). original_body(131, pos, cell(2,2,b)). original_body(131, pos, xplayer, mark(2,3)). 
original_head(132, cell(2,2,b)). original_body(132, pos, cell(2,2,b)). original_body(132, pos, oplayer, mark(2,3)). 
original_head(133, cell(2,2,b)). original_body(133, pos, cell(2,2,b)). original_body(133, pos, xplayer, mark(3,1)). 
original_head(134, cell(2,2,b)). original_body(134, pos, cell(2,2,b)). original_body(134, pos, oplayer, mark(3,1)). 
original_head(135, cell(2,2,b)). original_body(135, pos, cell(2,2,b)). original_body(135, pos, xplayer, mark(3,2)). 
original_head(136, cell(2,2,b)). original_body(136, pos, cell(2,2,b)). original_body(136, pos, oplayer, mark(3,2)). 
original_head(137, cell(2,2,b)). original_body(137, pos, cell(2,2,b)). original_body(137, pos, xplayer, mark(3,3)). 
original_head(138, cell(2,2,b)). original_body(138, pos, cell(2,2,b)). original_body(138, pos, oplayer, mark(3,3)). 
original_head(139, cell(2,3,b)). original_body(139, pos, cell(2,3,b)). original_body(139, pos, xplayer, mark(1,1)). 
original_head(140, cell(2,3,b)). original_body(140, pos, cell(2,3,b)). original_body(140, pos, oplayer, mark(1,1)). 
original_head(141, cell(2,3,b)). original_body(141, pos, cell(2,3,b)). original_body(141, pos, xplayer, mark(1,2)). 
original_head(142, cell(2,3,b)). original_body(142, pos, cell(2,3,b)). original_body(142, pos, oplayer, mark(1,2)). 
original_head(143, cell(2,3,b)). original_body(143, pos, cell(2,3,b)). original_body(143, pos, xplayer, mark(1,3)). 
original_head(144, cell(2,3,b)). original_body(144, pos, cell(2,3,b)). original_body(144, pos, oplayer, mark(1,3)). 
original_head(145, cell(2,3,b)). original_body(145, pos, cell(2,3,b)). original_body(145, pos, xplayer, mark(2,1)). 
original_head(146, cell(2,3,b)). original_body(146, pos, cell(2,3,b)). original_body(146, pos, oplayer, mark(2,1)). 
original_head(147, cell(2,3,b)). original_body(147, pos, cell(2,3,b)). original_body(147, pos, xplayer, mark(2,2)). 
original_head(148, cell(2,3,b)). original_body(148, pos, cell(2,3,b)). original_body(148, pos, oplayer, mark(2,2)). 
original_head(149, cell(2,3,b)). original_body(149, pos, cell(2,3,b)). original_body(149, pos, xplayer, mark(3,1)). 
original_head(150, cell(2,3,b)). original_body(150, pos, cell(2,3,b)). original_body(150, pos, oplayer, mark(3,1)). 
original_head(151, cell(2,3,b)). original_body(151, pos, cell(2,3,b)). original_body(151, pos, xplayer, mark(3,2)). 
original_head(152, cell(2,3,b)). original_body(152, pos, cell(2,3,b)). original_body(152, pos, oplayer, mark(3,2)). 
original_head(153, cell(2,3,b)). original_body(153, pos, cell(2,3,b)). original_body(153, pos, xplayer, mark(3,3)). 
original_head(154, cell(2,3,b)). original_body(154, pos, cell(2,3,b)). original_body(154, pos, oplayer, mark(3,3)). 
original_head(155, cell(3,1,b)). original_body(155, pos, cell(3,1,b)). original_body(155, pos, xplayer, mark(1,1)). 
original_head(156, cell(3,1,b)). original_body(156, pos, cell(3,1,b)). original_body(156, pos, oplayer, mark(1,1)). 
original_head(157, cell(3,1,b)). original_body(157, pos, cell(3,1,b)). original_body(157, pos, xplayer, mark(1,2)). 
original_head(158, cell(3,1,b)). original_body(158, pos, cell(3,1,b)). original_body(158, pos, oplayer, mark(1,2)). 
original_head(159, cell(3,1,b)). original_body(159, pos, cell(3,1,b)). original_body(159, pos, xplayer, mark(1,3)). 
original_head(160, cell(3,1,b)). original_body(160, pos, cell(3,1,b)). original_body(160, pos, oplayer, mark(1,3)). 
original_head(161, cell(3,1,b)). original_body(161, pos, cell(3,1,b)). original_body(161, pos, xplayer, mark(2,1)). 
original_head(162, cell(3,1,b)). original_body(162, pos, cell(3,1,b)). original_body(162, pos, oplayer, mark(2,1)). 
original_head(163, cell(3,1,b)). original_body(163, pos, cell(3,1,b)). original_body(163, pos, xplayer, mark(2,2)). 
original_head(164, cell(3,1,b)). original_body(164, pos, cell(3,1,b)). original_body(164, pos, oplayer, mark(2,2)). 
original_head(165, cell(3,1,b)). original_body(165, pos, cell(3,1,b)). original_body(165, pos, xplayer, mark(2,3)). 
original_head(166, cell(3,1,b)). original_body(166, pos, cell(3,1,b)). original_body(166, pos, oplayer, mark(2,3)). 
original_head(167, cell(3,1,b)). original_body(167, pos, cell(3,1,b)). original_body(167, pos, xplayer, mark(3,2)). 
original_head(168, cell(3,1,b)). original_body(168, pos, cell(3,1,b)). original_body(168, pos, oplayer, mark(3,2)). 
original_head(169, cell(3,1,b)). original_body(169, pos, cell(3,1,b)). original_body(169, pos, xplayer, mark(3,3)). 
original_head(170, cell(3,1,b)). original_body(170, pos, cell(3,1,b)). original_body(170, pos, oplayer, mark(3,3)). 
original_head(171, cell(3,2,b)). original_body(171, pos, cell(3,2,b)). original_body(171, pos, xplayer, mark(1,1)). 
original_head(172, cell(3,2,b)). original_body(172, pos, cell(3,2,b)). original_body(172, pos, oplayer, mark(1,1)). 
original_head(173, cell(3,2,b)). original_body(173, pos, cell(3,2,b)). original_body(173, pos, xplayer, mark(1,2)). 
original_head(174, cell(3,2,b)). original_body(174, pos, cell(3,2,b)). original_body(174, pos, oplayer, mark(1,2)). 
original_head(175, cell(3,2,b)). original_body(175, pos, cell(3,2,b)). original_body(175, pos, xplayer, mark(1,3)). 
original_head(176, cell(3,2,b)). original_body(176, pos, cell(3,2,b)). original_body(176, pos, oplayer, mark(1,3)). 
original_head(177, cell(3,2,b)). original_body(177, pos, cell(3,2,b)). original_body(177, pos, xplayer, mark(2,1)). 
original_head(178, cell(3,2,b)). original_body(178, pos, cell(3,2,b)). original_body(178, pos, oplayer, mark(2,1)). 
original_head(179, cell(3,2,b)). original_body(179, pos, cell(3,2,b)). original_body(179, pos, xplayer, mark(2,2)). 
original_head(180, cell(3,2,b)). original_body(180, pos, cell(3,2,b)). original_body(180, pos, oplayer, mark(2,2)). 
original_head(181, cell(3,2,b)). original_body(181, pos, cell(3,2,b)). original_body(181, pos, xplayer, mark(2,3)). 
original_head(182, cell(3,2,b)). original_body(182, pos, cell(3,2,b)). original_body(182, pos, oplayer, mark(2,3)). 
original_head(183, cell(3,2,b)). original_body(183, pos, cell(3,2,b)). original_body(183, pos, xplayer, mark(3,1)). 
original_head(184, cell(3,2,b)). original_body(184, pos, cell(3,2,b)). original_body(184, pos, oplayer, mark(3,1)). 
original_head(185, cell(3,2,b)). original_body(185, pos, cell(3,2,b)). original_body(185, pos, xplayer, mark(3,3)). 
original_head(186, cell(3,2,b)). original_body(186, pos, cell(3,2,b)). original_body(186, pos, oplayer, mark(3,3)). 
original_head(187, cell(3,3,b)). original_body(187, pos, cell(3,3,b)). original_body(187, pos, xplayer, mark(1,1)). 
original_head(188, cell(3,3,b)). original_body(188, pos, cell(3,3,b)). original_body(188, pos, oplayer, mark(1,1)). 
original_head(189, cell(3,3,b)). original_body(189, pos, cell(3,3,b)). original_body(189, pos, xplayer, mark(1,2)). 
original_head(190, cell(3,3,b)). original_body(190, pos, cell(3,3,b)). original_body(190, pos, oplayer, mark(1,2)). 
original_head(191, cell(3,3,b)). original_body(191, pos, cell(3,3,b)). original_body(191, pos, xplayer, mark(1,3)). 
original_head(192, cell(3,3,b)). original_body(192, pos, cell(3,3,b)). original_body(192, pos, oplayer, mark(1,3)). 
original_head(193, cell(3,3,b)). original_body(193, pos, cell(3,3,b)). original_body(193, pos, xplayer, mark(2,1)). 
original_head(194, cell(3,3,b)). original_body(194, pos, cell(3,3,b)). original_body(194, pos, oplayer, mark(2,1)). 
original_head(195, cell(3,3,b)). original_body(195, pos, cell(3,3,b)). original_body(195, pos, xplayer, mark(2,2)). 
original_head(196, cell(3,3,b)). original_body(196, pos, cell(3,3,b)). original_body(196, pos, oplayer, mark(2,2)). 
original_head(197, cell(3,3,b)). original_body(197, pos, cell(3,3,b)). original_body(197, pos, xplayer, mark(2,3)). 
original_head(198, cell(3,3,b)). original_body(198, pos, cell(3,3,b)). original_body(198, pos, oplayer, mark(2,3)). 
original_head(199, cell(3,3,b)). original_body(199, pos, cell(3,3,b)). original_body(199, pos, xplayer, mark(3,1)). 
original_head(200, cell(3,3,b)). original_body(200, pos, cell(3,3,b)). original_body(200, pos, oplayer, mark(3,1)). 
original_head(201, cell(3,3,b)). original_body(201, pos, cell(3,3,b)). original_body(201, pos, xplayer, mark(3,2)). 
original_head(202, cell(3,3,b)). original_body(202, pos, cell(3,3,b)). original_body(202, pos, oplayer, mark(3,2)). 
legal_rule(1..20).
old_rule(1..202).
rule(1..202).
terminal(J,T) :- not true(cell(1,1,b),J,T),not true(cell(1,2,b),J,T),not true(cell(1,3,b),J,T), not true(cell(2,1,b),J,T),not true(cell(2,2,b),J,T),not true(cell(2,3,b),J,T), not true(cell(3,1,b),J,T),not true(cell(3,2,b),J,T),not true(cell(3,3,b),J,T), program(J), tdom(T).
goal(xplayer, 50, J, T) :- not true(cell(1,1,b),J,T),not true(cell(1,2,b),J,T),not true(cell(1,3,b),J,T), not true(cell(2,1,b),J,T),not true(cell(2,2,b),J,T),not true(cell(2,3,b),J,T), not true(cell(3,1,b),J,T),not true(cell(3,2,b),J,T),not true(cell(3,3,b),J,T), program(J), tdom(T).
goal(oplayer, 50, J, T) :- not true(cell(1,1,b),J,T),not true(cell(1,2,b),J,T),not true(cell(1,3,b),J,T), not true(cell(2,1,b),J,T),not true(cell(2,2,b),J,T),not true(cell(2,3,b),J,T), not true(cell(3,1,b),J,T),not true(cell(3,2,b),J,T),not true(cell(3,3,b),J,T), program(J), tdom(T).
goal(xplayer, 0, J, T) :- not goal(xplayer, 50, J, T), not goal(xplayer, 100, J, T), program(J), tdom(T).
goal(oplayer, 0, J, T) :- not goal(oplayer, 50, J, T), not goal(oplayer, 100, J, T), program(J), tdom(T).
goal(xplayer, 100, J, T) :- true(cell(1,1,x),J,T),true(cell(2,1,x),J,T),true(cell(3,1,x),J,T), program(J), tdom(T).
goal(oplayer, 100, J, T) :- true(cell(1,1,o),J,T),true(cell(2,1,o),J,T),true(cell(3,1,o),J,T), program(J), tdom(T).
terminal(J, T) :- true(cell(1,1,x),J,T),true(cell(2,1,x),J,T),true(cell(3,1,x),J,T), program(J), tdom(T).
terminal(J, T) :- true(cell(1,1,o),J,T),true(cell(2,1,o),J,T),true(cell(3,1,o),J,T), program(J), tdom(T).
goal(xplayer, 100, J, T) :- true(cell(1,1,x),J,T),true(cell(1,2,x),J,T),true(cell(1,3,x),J,T), program(J), tdom(T).
goal(oplayer, 100, J, T) :- true(cell(1,1,o),J,T),true(cell(1,2,o),J,T),true(cell(1,3,o),J,T), program(J), tdom(T).
terminal(J, T) :- true(cell(1,1,x),J,T),true(cell(1,2,x),J,T),true(cell(1,3,x),J,T), program(J), tdom(T).
terminal(J, T) :- true(cell(1,1,o),J,T),true(cell(1,2,o),J,T),true(cell(1,3,o),J,T), program(J), tdom(T).
goal(xplayer, 100, J, T) :- true(cell(1,2,x),J,T),true(cell(2,2,x),J,T),true(cell(3,2,x),J,T), program(J), tdom(T).
goal(oplayer, 100, J, T) :- true(cell(1,2,o),J,T),true(cell(2,2,o),J,T),true(cell(3,2,o),J,T), program(J), tdom(T).
terminal(J, T) :- true(cell(1,2,x),J,T),true(cell(2,2,x),J,T),true(cell(3,2,x),J,T), program(J), tdom(T).
terminal(J, T) :- true(cell(1,2,o),J,T),true(cell(2,2,o),J,T),true(cell(3,2,o),J,T), program(J), tdom(T).
goal(xplayer, 100, J, T) :- true(cell(2,1,x),J,T),true(cell(2,2,x),J,T),true(cell(2,3,x),J,T), program(J), tdom(T).
goal(oplayer, 100, J, T) :- true(cell(2,1,o),J,T),true(cell(2,2,o),J,T),true(cell(2,3,o),J,T), program(J), tdom(T).
terminal(J, T) :- true(cell(2,1,x),J,T),true(cell(2,2,x),J,T),true(cell(2,3,x),J,T), program(J), tdom(T).
terminal(J, T) :- true(cell(2,1,o),J,T),true(cell(2,2,o),J,T),true(cell(2,3,o),J,T), program(J), tdom(T).
goal(xplayer, 100, J, T) :- true(cell(1,3,x),J,T),true(cell(2,3,x),J,T),true(cell(3,3,x),J,T), program(J), tdom(T).
goal(oplayer, 100, J, T) :- true(cell(1,3,o),J,T),true(cell(2,3,o),J,T),true(cell(3,3,o),J,T), program(J), tdom(T).
terminal(J, T) :- true(cell(1,3,x),J,T),true(cell(2,3,x),J,T),true(cell(3,3,x),J,T), program(J), tdom(T).
terminal(J, T) :- true(cell(1,3,o),J,T),true(cell(2,3,o),J,T),true(cell(3,3,o),J,T), program(J), tdom(T).
goal(xplayer, 100, J, T) :- true(cell(3,1,x),J,T),true(cell(3,2,x),J,T),true(cell(3,3,x),J,T), program(J), tdom(T).
goal(oplayer, 100, J, T) :- true(cell(3,1,o),J,T),true(cell(3,2,o),J,T),true(cell(3,3,o),J,T), program(J), tdom(T).
terminal(J, T) :- true(cell(3,1,x),J,T),true(cell(3,2,x),J,T),true(cell(3,3,x),J,T), program(J), tdom(T).
terminal(J, T) :- true(cell(3,1,o),J,T),true(cell(3,2,o),J,T),true(cell(3,3,o),J,T), program(J), tdom(T).
goal(xplayer, 100, J, T) :- true(cell(1,1,x),J,T),true(cell(2,2,x),J,T),true(cell(3,3,x),J,T), program(J), tdom(T).
goal(oplayer, 100, J, T) :- true(cell(1,1,o),J,T),true(cell(2,2,o),J,T),true(cell(3,3,o),J,T), program(J), tdom(T).
terminal(J, T) :- true(cell(1,1,x),J,T),true(cell(2,2,x),J,T),true(cell(3,3,x),J,T), program(J), tdom(T).
terminal(J, T) :- true(cell(1,1,o),J,T),true(cell(2,2,o),J,T),true(cell(3,3,o),J,T), program(J), tdom(T).
goal(xplayer, 100, J, T) :- true(cell(1,3,x),J,T),true(cell(2,2,x),J,T),true(cell(3,1,x),J,T), program(J), tdom(T).
goal(oplayer, 100, J, T) :- true(cell(1,3,o),J,T),true(cell(2,2,o),J,T),true(cell(3,1,o),J,T), program(J), tdom(T).
terminal(J, T) :- true(cell(1,3,x),J,T),true(cell(2,2,x),J,T),true(cell(3,1,x),J,T), program(J), tdom(T).
terminal(J, T) :- true(cell(1,3,o),J,T),true(cell(2,2,o),J,T),true(cell(3,1,o),J,T), program(J), tdom(T).
