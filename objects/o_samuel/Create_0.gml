image_speed = 0
played = false
lazyfix = false // make it so samuel always sets mannys walk flag to 1
timer = 0

if global.script_variables[? "samuel-beat"+string(song)] = 1
	{
		instance_destroy(id)
	}
