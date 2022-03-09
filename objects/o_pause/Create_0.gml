with(obj_player) {
	movementer.StopMoving();
}
menu = new Menu();
menuMode = 0;
surfaceShow = 0;
closing = false;
waitingForFade = false;
blackout = false;
fileSelectMenu = new FileselectInterface(true);

Sound(sx_pause_open);

audio_sound_gain(global.music,1/4,170);