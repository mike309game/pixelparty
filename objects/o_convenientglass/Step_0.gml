event_inherited();

if(!instance_exists(obj_player)) then instance_destroy();

if(distance_to_object(obj_player) < 8) {
	image_alpha = min(image_alpha + 0.2, 1);
} else {
	image_alpha = max(image_alpha - 0.2, 0);
}
depth = -y;