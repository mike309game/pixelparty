if(distance_to_object(obj_player) > 64) {
	alarm[10] = 30;
	exit;
}
sprite_index = s_bully_cry;
Sound(sx_bully_cry);
alarm[11] = 60;