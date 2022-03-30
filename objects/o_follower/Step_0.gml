var playHor = GetInput(eInput.right,true) - GetInput(eInput.left,true)
var playVer = GetInput(eInput.down,true) - GetInput(eInput.up,true)

switch obj_player.sprite_index
	{
		case s_manny_down:
			sprite_index = asset_get_index("s_"+string(character)+"_down")
			break;
		case s_manny_up:
			sprite_index = asset_get_index("s_"+string(character)+"_up")
			break;
		case s_manny_left:
			sprite_index = asset_get_index("s_"+string(character)+"_left")
			break;
		case s_manny_right:
			sprite_index = asset_get_index("s_"+string(character)+"_right")
			break;
	}
	
if playHor = 0 && playVer = 0
	{
		image_speed = 0
		image_index = 0
	} else {
		if GetGameFlag(eFlag.playerCanMove)
			{
				image_speed = 1.2
			}
	}