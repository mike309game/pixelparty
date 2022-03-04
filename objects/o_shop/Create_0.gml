#region animation
flipping = false
fliptimer = 0

dexoffset = 0
dexintro = 16
movedir = 0

alarm_set(0,30)

fade = 1
#endregion

menuMode = 0
selection = [0,0,0]

coinY = 64
coinR = 0
coinM = 0
coinSurf = surface_create(320,240)

depth = -999

/*if global.setting.music > 0
	{
		Music(mx_shop)
		//audio_play_sound(mx_shop,0,1)
		audio_sound_gain(mx_shop,.10,0)
	}*/
Music(mx_shop)