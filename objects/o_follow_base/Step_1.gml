var playHor = GetInput(eInput.right,true) - GetInput(eInput.left,true)
var playVer = GetInput(eInput.down,true) - GetInput(eInput.up,true)

if instance_exists(obj_player) && (playHor <> 0 || playVer <> 0) && GetGameFlag(eFlag.playerCanMove)
	{
		ds_list_insert(position_list_x,0,obj_player.x)
		ds_list_insert(position_list_y,0,obj_player.y)
	}

ds_list_delete(position_list_x,31)
ds_list_delete(position_list_y,31)



x = round(lerp(x,position_list_x[|25],.2))
y = round(lerp(y,position_list_y[|25],.2))


SetDepth()
