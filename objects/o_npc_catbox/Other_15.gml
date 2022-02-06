sprite_index = s_catboxspit;
shakeAmt = 10;
alarm[1] = 30;
myInterpreter.halted = true;
with(instance_create_depth(x,y-32,depth,o_piece)) {
	hspeed = 4;
	friction = 0.1;
}