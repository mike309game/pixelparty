surf = surface_create(320,240)
surfapp = surface_create(320,240)
draw_set_font(f_main)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_color(c_black)

function drawMuns()
	{
						draw_set_halign(fa_left)
						draw_set_valign(fa_top)
						draw_set_color(c_white)
						
						draw_text(58,170,global.player.money)
						
						draw_set_color(c_black)
						draw_set_halign(fa_center)
						draw_set_valign(fa_middle)
	}


if surface_exists(surf) // surface shit
	{
		
		
		surface_set_target(surf) // background and other shit
			draw_sprite_tiled(s_pause_bg,0,bgX,bgY)
		surface_reset_target()
		
		gpu_set_blendenable(0);
		surface_set_target(surfapp)
			draw_surface(application_surface,0,0)
		surface_reset_target()
		gpu_set_blendenable(1);

		if (timer > 11 && tr != 2) then draw_surface_ext(surf,0,0,1,1,0,c_white,1) else if (timer >= 0 && tr = 2) then draw_surface_ext(surf,0,0,1,1,0,c_white,1)
		if tr = 2 then draw_sprite_ext(s_pause_pause,0,pauseX,32,1,1,6,c_white,1)
		
		// Buttons
				for(var i = 0; i < array_length(menu); i++)
					{
						if (timer > 11 && tr != 2)
							{
								draw_sprite_part(s_shop_ui,0,16,0,64,64,32,128) // gold counter
						
								drawMuns()
							}
						if (timer >= 0 && tr = 2)
								{
									draw_sprite_part(s_shop_ui,0,16,0,64,64,32,128) // gold counter
							
									drawMuns()
								}
					}
		
		// x4 y32 scale0.5 rot10
		
	}
	
switch mode
	{
		case 0: // pause menu
			{
				// Buttons
				for(var i = 0; i < array_length(menu); i++)
					{
						if (timer > 11 && tr != 2)
							{
								if selection = i then draw_sprite(s_pause_button,0,160+16,180+(i*17-17)) else draw_sprite(s_pause_button,0,160,180+(i*17-17))
								if selection = i then draw_text(160+16,181+(i*17-17),menu[i]) else draw_text(160,181+(i*17-17),menu[i])

							}
						if (timer >= 0 && tr = 2)
								{
									if selection = i then draw_sprite(s_pause_button,0,160+16,180+(i*17-17)) else draw_sprite(s_pause_button,0,160,180+(i*17-17))
									if selection = i then draw_text(160+16,181+(i*17-17),menu[i]) else draw_text(160,181+(i*17-17),menu[i])

								}
					}
				break;
			}
		case 1: // options
			{
				switch global.debug.build_type
					{
						case "ps":
							var toDraw = ["Music Volume: "+string(global.setting.music),"Sound Volume: "+string(global.setting.sound),"Back To Menu"]
							break;
						case "pc":
							var toDraw = ["Music Volume: "+string(global.setting.music),"Sound Volume: "+string(global.setting.sound),"Screen Size: "+string(global.setting.scale)+"x","Vsync: "+string(global.setting.vsync),"Fullscreen: "+string(global.setting.full),"Back To Menu"]
							break;
						case "web":
							var toDraw = ["Music Volume: "+string(global.setting.music),"Sound Volume: "+string(global.setting.sound),"Back To Menu"]
							break;
					}
				draw_set_alpha(0.4)
				draw_rectangle_color(0,164+(selection*10),320,173+(selection*10),c_black,c_black,c_black,c_black,0)
				draw_set_alpha(1)
				draw_set_color(c_black)
				draw_set_font(f_shop)
				draw_text(160,145,"game settings")
				draw_set_color(c_white)
				for(var i = 0; i < array_length(toDraw); i++)
					{
						draw_set_font(f_shop)
						draw_text(160,160+((i+1)*10),toDraw[i])
						draw_set_font(f_main)
					}
				draw_set_color(c_black)
				
				var hor = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left)
				switch global.debug.build_type
					{
						case "ps":
							{
								if keyboard_check_pressed(ord("Z"))
									{
										Sound("sx_title_menu_select",0)
										switch selection
											{

												case 2:
													{
														mode = 0
														selection = 0
														save_setting()
														//sel_freeze = 0
														break;
													}
											}
				
									}
								
								if hor <> 0 
									{
										switch selection
											{
												case 0:
													{
														global.setting.music += 5*hor
														audio_sound_gain(global.vars.playing,global.setting.music/100,0)
														break;
													}
												case 1:
													{
														global.setting.sound += 5*hor
														break;
													}
											}
									}
					
									break;
							}
						case "pc":
							{
								if keyboard_check_pressed(ord("Z"))
									{
										Sound("sx_title_menu_select",0)
										switch selection
											{
												case 5:
													{
														mode = 0
														save_setting()
														selection = 0
														break;
													}
											}
									}
				
				
								if hor <> 0 
									{
										switch selection
											{
												case 0:
													{
														global.setting.music += 5*hor
														audio_sound_gain(global.vars.playing,global.setting.music/100,0)
														break;
													}
												case 1:
													{
														global.setting.sound += 5*hor
														break;
													}
												case 2:
													{
														global.setting.scale += hor
														alarm_set(0,2)
														break;
													}
												case 3:
													{
														global.setting.vsync += hor
														display_reset(0,global.setting.vsync)
														break;
													}
												case 4:
													{
														Sound("sx_error",0)
														//global.setting.full += hor
														//window_set_fullscreen(global.setting.full)
														break;
													}
											}
									}
								break;
							}
						case "web":
							{
								if keyboard_check_pressed(ord("Z"))
									{
										Sound("sx_title_menu_select",0)
										switch selection
											{

												case 2:
													{
														mode = 0
														selection = 0
														save_setting()
														//sel_freeze = 0
														break;
													}
											}
				
									}
								
								if hor <> 0 
									{
										switch selection
											{
												case 0:
													{
														global.setting.music += 5*hor
														audio_sound_gain(global.vars.playing,global.setting.music/100,0)
														break;
													}
												case 1:
													{
														global.setting.sound += 5*hor
														break;
													}
											}
									}
					
									break;
							}
	
			}
	}	
	}
	
if surface_exists(surfapp)
	{
		gpu_set_blendenable(0);
		if surS < 1 then draw_surface_ext(surfapp,surX - 4,surY-2,surS+0.02,surS+0.02,surR,c_black,1)
		if surS < 1 then draw_surface_ext(surfapp,surX,surY,surS,surS,surR,c_white,1)
		gpu_set_blendenable(1);
		if tr <= 1 then draw_sprite_ext(s_pause_pause,0,pauseX,32,1,1,6,c_white,1)
	}

surface_free(surf)
surface_free(surfapp)

draw_sprite_ext(s_fade_white,0,0,0,1,1,0,c_white,fade)

