/*if(keyboard_check_pressed(vk_space)) {
	src++;
	if(src == 12) {
		src = 1;
		dest++;
	}
	if(dest == 12) {
		instance_destroy();
		exit;
	}
}*/
//window_set_caption("src = " + stringfromconst(src) + " | dest = " + stringfromconst(dest));
//gpu_set_blendmode_ext(src, dest);
if(counter % 2 == 1) {
	exit;
}
value++;
src = (value % 11) + 1;
dest = (floor(value / 11) % 11) + 1;
alphasrc = (floor(value / (11*11)) % 11) + 1;
alphadest = (floor(value / (11*11*11)) % 11) + 1;

if(value > 11*11*11*11) { //THIS IS FUCKING 14641 COMBINATIONS LOL
	gpu_set_blendmode_ext_sepalpha(bm_src_alpha, bm_inv_src_alpha, bm_src_alpha, bm_inv_src_alpha);
	instance_destroy();
	exit;
}

window_set_caption("src = " + stringfromconst(src) + " | dest = " + stringfromconst(dest) + " | srcalpha = " + stringfromconst(alphasrc) + " | destalpha = " + stringfromconst(alphadest));