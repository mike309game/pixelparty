if(room == destination) {
	NegateGameFlag(eFlag.doFadeIn);
	var invalid = true;
	with(o_marker) {
		if(image_index == other.marker) {
			with(obj_player) {
				movementer.realx = other.x * COLLPRECISION;
				movementer.realy = other.y * COLLPRECISION;
				UnfreezeAllInput();
				FreezeInput(other.dir); //marker's dir is of eInput enum
				ForbidAllInputExcept(other.dir);
				invalid = false;
			}
		}
	}
	if(invalid) { //failsafe
		AllowAllInput();
		UnfreezeAllInput();
		instance_destroy();
	}
}