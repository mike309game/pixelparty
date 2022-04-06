image_speed = 0
played = false
timer = 0

if global.script_variables[? "samuel-beat"+string(song)] = 1
	{
		instance_destroy(id)
	}
