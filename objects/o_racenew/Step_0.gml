EVTLIVE;
playfieldWidth = mouse_x;
//var hor = GetInput(eInput.right, true) - GetInput(eInput.left, true);
//playerX += hor;
var len = ds_list_size(objects);
for(var i = 0; i < len; i++) {
	var obj = objects[|i];
	obj.Step(obj.isPlayer ? global.input : 0);
	if(i == raceFocus) {
		camFocusRaceProgress = lerp(camFocusRaceProgress, obj.raceProgress, 0.1);
	}
}

if(keyboard_check_pressed(vk_space)) {
	objects[|raceFocus].isPlayer = false;
	raceFocus = (raceFocus + 1) % ds_list_size(objects);
	objects[|raceFocus].isPlayer = true;
}