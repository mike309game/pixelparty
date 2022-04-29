if(obj_player.movementer.moving) {
	delayXArray[(delayArrayIndex) % MAXINPUTDELAYFRAMES] = obj_player.x;
	delayYArray[(delayArrayIndex++) % MAXINPUTDELAYFRAMES] = obj_player.y;
	//input = delayArray[nmod((delayArrayIndex-1) - delayFrames, MAXINPUTDELAYFRAMES)];
	var delayCurrent = nmod((delayArrayIndex-1) - delayFrames, MAXINPUTDELAYFRAMES);
	x = delayXArray[delayCurrent];
	y = delayYArray[delayCurrent];
	image_speed = 0.225;
} else {
	image_speed = 0;
	image_index = 0;
}

if(floor(image_index) == 1) {
	if(playFootstep) {
		Sound(sx_walk_tb, 1, 0.3);
		playFootstep = false;
	}
} else {
	playFootstep = true;
}

SetDepth();





/*var inputX = !!(input & eInput.right) - !!(input & eInput.left);
var inputY = !!(input & eInput.down) - !!(input & eInput.up);

movementer.Move(inputX, inputY);
movementer.Collide(true);*/


/*var input = GetDelayedInput(30);

*/
