///@desc speed decrease timer
movementer.speedMax -= 1;
if(movementer.speedMax == 16) {
	movementer.accelStop = 16-14;
} else {
	alarm[3] = 4;
	if(movementer.moving && (movementer.speedMax & 1)) { //if we're moving and speed is an odd number
		if(movementer.speedMax >= 26) {
			with(instance_create_depth(x+8,y+8,depth,o_cloud_puff)) {
				image_index = 1;
				image_angle = random_range(0,360);
			}
		} else {
			walkAnimSpeed = 0.2;
		}
	}
}
audio_sound_pitch(footstepSound, min(movementer.speedMax / 16, 1.2));