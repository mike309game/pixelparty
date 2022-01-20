// Inherit the parent event
event_inherited();

image_index = choose(0,1);
if(image_index == 0) {
	image_yscale += random_range(0,0.08);
	y -= sprite_height - sprite_get_height(sprite_index);
}