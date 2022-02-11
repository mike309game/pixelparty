// Inherit the parent event
event_inherited();

if(honestaryDoor) {
	Sound(sx_level_enter);
	MANAGER.fadeSpeed = 0.006;
}
Transition(destination, image_index, 0, honestaryDoor);