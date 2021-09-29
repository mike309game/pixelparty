depth = -y
switch global.debug.noclip
	{
		case 0:
			{
				#region Dash shit
				dash_spd = lerp(dash_spd,1,.03)
				dash_cooldown-=0.5
				dash_cooldown = clamp(dash_cooldown,0,999)
				
				
				if dash_cooldown > 0
					{
						timer_cooldown = 50
						if timer_y > 240 then timer_y--
					} else {
						timer_cooldown--
						if timer_y < 240+32 && timer_cooldown < 0
							{
								timer_y++
							}
					}
				#endregion
				
				if global.player.move
					{
						hor = keyboard_check(vk_right) - keyboard_check(vk_left)
						ver = keyboard_check(vk_down) - keyboard_check(vk_up)
						
						if hor = 0 && ver = 0
							{
								idle_timer++
							}
						if idle_timer > 400
							{
								text_x = lerp(text_x,4+36,.05)
							} else {
								text_x = lerp(text_x,-192,.05)
							}
						
						#region dash stuff 2
						// Dashing
						if keyboard_check_pressed(ord("X")) && dash_cooldown <= 0 && (hor <> 0 || ver <> 0)
							{
								dash_spd = 4
								dash_cooldown = 100
								temphor = hor
								tempver = ver
							}
						
						// stop dashing if change direction
						if dash_spd > 1.2
							{
								// cloud stuff --
								cloud_timer++
								
								if cloud_timer = 1
									{
										if ver <> -1 then instance_create_depth(x+24,y+40,depth,o_cloud_puff) else instance_create_depth(x+24,y+40,depth-1,o_cloud_puff)
									}
								if cloud_timer > 10
									{
										cloud_timer = 0
									}
								// cloud stuff --	
								
								if audio_is_playing(sx_walk_cute) then audio_sound_pitch(sx_walk_cute,1.2)
								if hor <> temphor || ver <> tempver
									{
										dash_spd = 1
										cloud_timer = 0
									}
							} else { 
								if audio_is_playing(sx_walk_cute) 
									{
										cloud_timer = 0
										audio_sound_pitch(sx_walk_cute,1)
									}
							}
						#endregion
						
					} else {
						text_x = lerp(text_x,-192,.05)
						if instance_exists(o_pause) || global.vars.got_puzzle
							{
								hor = 0
								ver = 0
							}
						
					}
					
				// nasty check
				
				
				if stuck_timer = 500 then room_restart()
				
				//var collides = tag_get_asset_ids("hitbox",asset_object)
				
				
						if !place_meeting(x+(spd*dash_spd*hor),y,o_hitbox) then x += spd*dash_spd*hor
						if !place_meeting(x,y+(spd*dash_spd*ver),o_hitbox) then y += spd*dash_spd*ver
				
				#region Animation
				

				
					if hor <> 0 || ver <> 0
						{
							idle_timer = 0
							ani += (dash_spd)*0.1
							if !audio_is_playing(sx_walk_cute) then Sound(sx_walk_cute,0)
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
		if keyboard_check_pressed(vk_tab)
			{
				pos ^= 1
			}
	}
	
if instance_exists(o_text)
	{
		hor = 0
		ver = 0
	}
