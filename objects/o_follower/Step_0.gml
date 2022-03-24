var playHor = GetInput(eInput.right,true) - GetInput(eInput.left,true)
var playVer = GetInput(eInput.down,true) - GetInput(eInput.up,true)

if obj_player.x > x
	{
		sprite_index = asset_get_index("s_"+string(character)+"_right")
	} else {
		sprite_index = asset_get_index("s_"+string(character)+"_left")
	}
	
if obj_player.y > y
	{
		sprite_index = asset_get_index("s_"+string(character)+"_down")
	} else {
		sprite_index = asset_get_index("s_"+string(character)+"_up")
	}
