if(!touched && GetGameFlag(eFlag.playerCanTransition)) {
	touched = true;
	depth = -y - 17; //now above player
	with(obj_player) {
		movementer.realX = other.x << COLLPRECISIONSHIFTABLE;
		movementer.realY = other.y << COLLPRECISIONSHIFTABLE;
		movementer.speedX = 0;
		movementer.speedY = 0;
		dir = eDir.down;
	}
	ForbidAllInputExcept(0);
	alarm[0] = 10;
}