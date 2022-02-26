///@desc letter cooldownler
//pxpaLetterResizeCooldown[pxpaLetterResizerCurrent++] = 120;

for(var i = 0; i <= pxpaLetterResizerCurrent; i++) { //reset cooldown of each letter, when resizer is done they all resize back down @ the same time
	pxpaLetterResizeCooldown[i] = 120;
}

if(++pxpaLetterResizerCurrent != 10) then alarm[11] = 10;