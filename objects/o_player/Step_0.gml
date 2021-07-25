switch global.debug.noclip
	{
		case 0:
			{
				if global.player.move
					{
						hor = keyboard_check(vk_right) - keyboard_check(vk_left)
						ver = keyboard_check(vk_down) - keyboard_check(vk_up)
						
					}
				
				if !place_meeting(x+(spd*hor),y,o_hitbox) then x += spd*hor
				if !place_meeting(x,y+(spd*ver),o_hitbox) then y += spd*ver
				
				#region Animation
				

				
					if hor <> 0 || ver <> 0
						{
							ani += 0.1
							if !audio_is_playing(sx_walk_cute) then Sound("sx_walk_cute",0)
							audio_sound_gain(sx_walk_cute,global.setting.sound/100,30)
						}
					else
						{
							ani = 1
							audio_sound_gain(sx_walk_cute,0,50)
							if audio_sound_get_gain(sx_walk_cute) = 0 then audio_stop_sound(sx_walk_cute)
						}
					if ani  > 4.99 then ani = 1
						
				switch hor
					{
						case -1:
							{
								offset = 3
								break
							}
						case 1:
							{
								offset = 2
								break
							}
					}
					
				switch ver
					{
						case 1:
							{
								offset = 1
								break
							}
						case -1:
							{
								offset = 4
								break
							}
					}
				
				#endregion
				
				
				
				break;
				
			}
		case 1:
			{
				hor = keyboard_check(vk_right) - keyboard_check(vk_left)
				ver = keyboard_check(vk_down) - keyboard_check(vk_up)
				
				 x += 3*hor
				y += 3*ver
				break;
			}
	}
	
if global.debug.debug_enabled
	{
		if keyboard_check_pressed(ord("V"))
			{
				global.debug.noclip ^= 1
				
				if global.debug.noclip = 1 then show_debug_message("Noclip Enabled") else show_debug_message("Noclip Disabled") 
			}
	}
	
if instance_exists(o_text)
	{
		hor = 0
		ver = 0
	}