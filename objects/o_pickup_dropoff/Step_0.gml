if place_meeting(x,y,obj_player) && GetInputPressed(eInput.interact) && !drawMe
	{
		if invCheck(0)
			{
				depth = obj_player.depth+8
				Sound(sx_obj_drop)
				global.script_variables[? varSet] = 1
				drawMe = true
				
				if spawnObj != BlankObject
					{
						instance_create_depth(x,y,0,spawnObj)
					}
			} else {
				if !instance_exists(ScriptSectionInterpreter)
					{
						QuickInterpreter("global-placedHere")
					}
				
			}
	}
