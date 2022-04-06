

if GetInputPressed(eInput.interact) && GetGameFlag(eFlag.playerCanMove)
	{
		SetGameFlag(eFlag.playerCanMove,0)
		audio_sound_gain(global.music,0,100)
		global.script_variables[? "samuel-beat"+string(song)] = 1;
	}
	

	

