//room_speed = 1;
movementer = new Movementer(id); //movementer

dir = eDir.down;

sprites = [
	s_manny_right,
	s_manny_right,
	s_manny_up,
	s_manny_left,
	s_manny_left,
	s_manny_left,	
	s_manny_down,
	s_manny_right,
]

noclip = false;

footstepSound = Sound(sx_walk_cute, 1, 0, true);
walkAnimSpeed = 0.2;