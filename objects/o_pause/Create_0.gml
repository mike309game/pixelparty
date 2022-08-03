with(obj_player) {
	movementer.StopMoving();
}
menu = new Menu();
menuMode = 0;
surfaceShow = 0;
closing = false;
waitingForFade = false;
blackout = false;
fileSelectMenu = new FileselectInterface(true, noone);
pauseBG = s_pause_bg

if global.script_variables[?"darkness"] then pauseBG = s_pause_bg_dark

if global.script_variables[?"darkness"] then Sound(sx_pause_open,0.5) else Sound(sx_pause_open)

audio_sound_gain(global.music,1/4,170);