depth = -y

if place_meeting(x,y,o_player) && keyboard_check_pressed(ord("Z")) && !instance_exists(o_tip) && !instance_exists(o_pause) && !instance_exists(o_text)
	{
		speak = true
		instance_create_depth(0,0,0,o_tip)
	}

if speak
	{
		image_speed = 0.6
		screamt = 0
	} else {
		image_speed = 0
		
		if screamt = 800
			{
				Sound(sx_tip_scream,0)
				image_index = 1
				
				
			} 
	}
	
if !instance_exists(o_tip)
	{
		speak = false
		if distance_to_object(o_player) < 20 then screamt++ else screamt = 0
		if !audio_is_playing(sx_tip_scream) then image_index = 0
	}

