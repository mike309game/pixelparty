bop = lerp(bop,1,.1)
bgX -= 0.3
bgY -= 0.3
timer++

fade = clamp(fade,0,1)
scale = clamp(scale,0,1)

#region intro
if timer > 100 then fade -= 0.01

if timer = 200 
	{
		Sound(sx_title_grow)	
	}
if timer >= 200 
	{
		scale = lerp(scale,1,.1)
	}
if timer = 250
	{
		Music(mx_title,false)
	}
if timer = 300 then Sound(sx_pixelparty)
//show_debug_message("mode: "+string(mode))
//show_debug_message("tstimer: "+string(tstimer))
#endregion

switch mode
	{
		case 0:
			{
				bgmode = 0
				if timer > 250 then scale = lerp(scale,1,.1)
				if keyboard_check_pressed(vk_enter) && timer > 350
					{
						mode = 1
						alarm_set(2,10)
						Sound(sx_title_select)
					}
				
				//start_scale = 1
				if tstimer = -1 then flash -= 0.1
				break;
			}
		case 1:
			{
				if tstimer > -1 then tstimer++
				if tstimer > 50 then if flash < 1 then flash += 0.1
				if tstimer = -1 then if flash < 1 then flash += 0.1
				
				if tstimer > 160
					{
						var hor = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left)
						
						if keyboard_check_pressed(ord("X")) && !sel_freeze
							{
								tstimer = -1
								alarm_set(4,100)
							}
						
						if !sel_freeze
							{
								selection += hor
								if hor <> 0 then Sound(sx_title_move)
						
								if keyboard_check_pressed(ord("Z"))
									{
										sel_freeze = 1
										//Sound(sx_title_menu_select)
										switch selection
											{
												case 0:
													{
														save_init()
														Sound(sx_newgame)
														alarm_set(0,1)
														break;
													}
												case 1:
													{
														if !file_exists(working_directory + "pxpa_save.ini")
															{
																filefound = 0
																Sound(sx_error)
																alarm_set(3,100)
															} else {
																Sound(sx_title_menu_select)
															}
														break;
													}
												case 2:
													{
														Sound(sx_title_menu_select)
														mode = 2
														selection = 0
														break;
													}
											}
									}
							}
					} //ts timer end
					
				break;
			} // case end
		case 2:
			{
				var ver = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up)
				selection += ver
				if ver <> 0 then Sound(sx_title_move)
			}
	}
