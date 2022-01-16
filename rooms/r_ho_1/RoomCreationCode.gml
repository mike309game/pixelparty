Music(mx_honest1)
if !ds_map_find_value(global.gameevent,"h1_e1")
	{
		var obj = instance_create_depth(0,0,0,o_texteffect)
		with(obj)
			{
				show = "h1"
			}
		global.gameevent[? "h1_e1"] = 1
	}