///@desc waiting to set player dir to right
if(yProgress == 120) { //if finished
	AssureGameFlag(eFlag.playerCanSetSprite); //the player can set its sprite
	alarm[2] = 1; //execute alarm 2, sets dir to right
} else {
	alarm[1] = 1; //execute here again, checking yprogress again
}