if(global.script_variables[? dieCondition]) {
	instance_destroy();
	exit; //gamemaker is funny
}
// Inherit the parent event
event_inherited();