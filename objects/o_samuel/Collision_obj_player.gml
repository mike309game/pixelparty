//mx

if GetInputPressed(eInput.interact) && GetGameFlag(eFlag.playerCanMove) && !touched
	{
		SetGameFlag(eFlag.playerCanMove,0)
		audio_sound_gain(global.music,0,500)
		touched = true
		global.script_variables[? "samuel-beat"+string(song)] = 1;
	}
	

	

