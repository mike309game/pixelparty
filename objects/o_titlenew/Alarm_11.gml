///@desc letter cooldownler
//pxpaLetterResizeCooldown[pxpaLetterResizerCurrent++] = 120;

for(var i = 0; i <= pxpaLetterResizerCurrent; i++) { //reset cooldown of each letter, when resizer is done they all resize back down @ the same time
	pxpaLetterResizeCooldown[i] = 120;
	//if i == pxpaLetterResizerCurrent then show_message("b");
}

if(++pxpaLetterResizerCurrent != 10) {
	alarm[11] = 10;
} else {
	NegateGameFlag(eFlag.fadeBlack);
	MANAGER.fadeValue = 1;
	MANAGER.fadeSpeed = 0.02;
	FadeOut();
	state++; //show start prompt
}