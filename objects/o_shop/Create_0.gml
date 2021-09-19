#region animation
flipping = false
fliptimer = 0

dexoffset = 0
movedir = 0

alarm_set(0,30)

fade = 1
#endregion

menuMode = 0
selection = [0,0,0]

depth = 999

if global.setting.music > 0
	{
		audio_play_sound(mx_shop,0,1)
		audio_sound_gain(mx_shop,.10,0)
	}