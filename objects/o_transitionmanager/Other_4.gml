if(room == destination) {
	NegateGameFlag(eFlag.doFadeIn);
	var invalid = true;
	with(o_marker) {
		if(image_index == other.marker) {
			with(obj_player) {
				movementer.realX = other.x << COLLPRECISIONSHIFTABLE;
				movementer.realY = other.y << COLLPRECISIONSHIFTABLE;
				UnfreezeAllInput();
				FreezeInput(other.dir); //marker's dir is of eInput enum
				ForbidAllInputExcept(other.dir);
				invalid = false;
			}
		}
	}
	if(invalid) { //failsafe
		AssureGameFlag(eFlag.playerCanCollide | eFlag.playerCanTransition);
		AllowAllInput();
		UnfreezeAllInput();
		instance_destroy();
	}
}