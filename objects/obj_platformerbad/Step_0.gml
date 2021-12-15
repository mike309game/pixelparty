var inpHoriz = keyboard_check(vk_right) - keyboard_check(vk_left);
var fired = keyboard_check_pressed(vk_shift);
//var detectorCollided = collision_line(bbox_left,bbox_bottom+1,bbox_right,bbox_bottom+1,o_hitbox,false,true);
var playerCollided = function(){gml_pragma("forceinline");return collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,o_hitbox,false,true);}

if((!fired && grav < 0) || grav < 10) {
	grav += 0.45;
}

if(fired) {
	if(jumpCount == 1 && grav > -2 && grav < 5) {
		grav = -6;
		jumpCount = 0;
	}
	if(collision_line(bbox_left,bbox_bottom+1,bbox_right,bbox_bottom+1,o_hitbox,false,true)) { //jumped from floor?
		grav = -9;
		jumpCount = 1;
	}
}

repeat(floor(abs(grav))) {
	y += sign(grav);
	if(playerCollided()) {
		y -= sign(grav);
		grav = 0;
		break;
	}
}

/* horizontal */

if(inpHoriz != 0) {
	horiz = 3 * inpHoriz;
	image_xscale = inpHoriz;
} else {
	horiz = 0;
}

repeat(floor(abs(horiz))) {
	x += horiz / abs(horiz); //tf
	if(playerCollided()) {
		x -= horiz / abs(horiz);
		break;
	}
}

CamCenterHitbox();