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
				//show_message("input being FROZEN is " + string(other.dir) + " and einput.down is " + string(eInput.down));
				ForbidAllInputExcept(other.dir);
				AssureGameFlag(eFlag.playerCanMove);
				invalid = false;
			}
		}
	}
	if(invalid) { //failsafe
		if(instance_exists(obj_player)) {
			AssureGameFlag(eFlag.playerCanCollide | eFlag.playerCanTransition | eFlag.playerCanMove);
		}
		AllowAllInput();
		UnfreezeAllInput();
		instance_destroy();
	}
}