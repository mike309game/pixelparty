if(!touched && GetGameFlag(eFlag.playerCanTransition)) {
	touched = true;
	depth = -y - 17; //now above player
	with(obj_player) {
		movementer.realx = other.x * COLLPRECISION;
		movementer.realy = other.y * COLLPRECISION;
		movementer.spdx = 0;
		movementer.spdy = 0;
		dir = eDir.down;
	}
	ForbidAllInputExcept(0);
	alarm[0] = 10;
}