if place_meeting(x,y,obj_player) && GetInputPressed(eInput.interact) && !doAni
	{
		doAni = true
		Sound(sx_obj_pickup)
		invAdd(item)
	}
	
if doAni
	{
		x = lerp(x,obj_player.x,.1)
		y = lerp(y,obj_player.y,.1)
		scale = lerp(scale,0,.1)
		image_xscale = scale
		image_yscale = scale
		image_alpha = scale
		
		
		if scale <= 0.1
			{
				global.script_variables[? varSet] = 1
				//invAdd(item)
				instance_destroy(id)
			}
	}
