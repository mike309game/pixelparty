movementer = new Movementer(id); //movementer

dir = eDir.down;

//TODO PLEASE INVERT THIS FOR MORE PERFORMANCE

sprites[eDir.right] =		s_manny_right;
sprites[eDir.upRight] =		s_manny_up;
sprites[eDir.up] =			s_manny_up;
sprites[eDir.upLeft] =		s_manny_up;
sprites[eDir.left] =		s_manny_left;
sprites[eDir.downLeft] =	s_manny_down;
sprites[eDir.down] =		s_manny_down;
sprites[eDir.downRight] =	s_manny_down;