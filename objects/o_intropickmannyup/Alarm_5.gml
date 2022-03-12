///@desc checking if already went down
fadeOut = true;
if(yProgress == 0) { //if it is down
	interpreter.halted = false;
	obj_player.dir = eDir.up; //face honstay
	AssureGameFlag(eFlag.playerCanSetDepth);
	instance_destroy();
}
alarm[5] = 1; //redo alarm, checking yprogress again