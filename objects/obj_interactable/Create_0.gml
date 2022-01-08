/* NOTE */
//SECTION NAME IS UNDER VARIABLE DEFINITIONS

myInterpreter = noone;
player = noone;
hovering = false; //player interact hitbox on ya
mySolid = noone;
if(isSolid) {
	mySolid = instance_create_depth(x,y,0,o_hitbox);
	with(mySolid) {
		sprite_index = other.sprite_index;
		mask_index = other.mask_index;
		persistent = other.persistent;
	}
}