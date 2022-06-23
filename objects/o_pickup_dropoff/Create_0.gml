drawMe = false

if global.script_variables[? varSet]
	{
		drawMe = true
		if spawnObj != BlankObject
					{
						instance_create_depth(x,y,0,spawnObj)
					}
		alarm_set(0,5)
	}
