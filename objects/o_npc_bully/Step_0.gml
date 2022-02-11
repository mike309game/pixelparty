// Inherit the parent event
event_inherited();

if(crying) {
	x = lerp(x, xstart - 64, 0.2);
}

with(o_fnafdoor) { //lv1 dex door
	enabled = other.crying;
}

if(keyboard_check_pressed(vk_f1)) {
	global.script_variables[? "level1-lexsieQuest-gotBread"] = 1;
	show_message("got bread is true");
}