draw_sprite_tiled(asset_get_index("s_title_bg_"+string(bgmode)),0,bgX,bgY)
if tstimer < 140 && tstimer > -1 then draw_sprite_ext(s_title_logo,0,160,120,scale,scale,0,c_white,1)
draw_sprite_ext(s_fade_black,0,0,0,1,1,0,c_white,fade)

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_color(c_black)
draw_set_font(f_shop)
switch(rand)
	{
		case 7:
			{
				var copyright = "(C)2002 YIFFI-FY LTD"
				break;
			}
		default:
			{
				switch global.debug.build_type
					{
						case "ps":
							var copyright = "(C)2002 YISI-FY LTD"
							break
						case "pc":
							switch os_type
								{
									case os_windows:
										var copyright = "(C)2002 YISI-FY LTD - Windows"
										break;
									case os_macosx:
										var copyright = "(C)2002 YISI-FY LTD - Mac OSX"
										break;
									case os_linux:
										var copyright = "(C)2002 YISI-FY LTD - Nerd OS"
										break;
									case os_unknown:
										var copyright = "(C)2002 YISI-FY LTD - what fucking os are you using"
										break;
								}
							break;
						case "web":
							var copyright = "(C)2002 YISI-FY LTD - Newgrounds Version"
							break;
						default:
							var copyright = "HOW DID YOU GET THIS ON A MOBILE OR CONSOLE????"
							break;
					}
				
			}
	}



draw_text(160,230,copyright)

//draw_sprite(s_title_files,0,0,0)


//draw_text(159,230,copyright)
//draw_text(161,230,copyright)

// menu options

if timer >= 340
{
	

switch mode
	{
		case 0: // title
			{
				
				if tstimer < 140 && tstimer > -1 then draw_sprite_ext(s_title_start,0,160,160,bop,bop,0,c_white,1)
				//draw_sprite(s_title_files,0,0,0)
				break;
			}
		case 1: // files
			{
				for(var i = 1; i < 4; i++) // file draw
					{
						if tstimer > 140
							{
								draw_sprite_part(s_title_files,0,i*96-96,0,96,96,14+(i*96-96),sel_lerp[i-1])
							}
						if selection = i-1
							{
								sel_lerp[selection] = lerp(sel_lerp[selection],8,.2)
							} else {
								sel_lerp[i-1] = lerp(sel_lerp[i-1],24,.2)
							}
					}
				
				
				if tstimer > 150 then if flash > 0 then flash -= 0.1;
				if start_flash = 0 && tstimer < 140 then draw_sprite_ext(s_title_start,0,160,160,start_scale,start_scale,0,c_white,1);
				
				if tstimer > 140
					{
						bgmode = 1
						var drawt = ""
						if filefound
							{
								switch selection
									{
										case 0:
											{
												drawt = "new game"
												break;
											}
										case 1:
											{
												drawt = "continue"
												break;
											}
										case 2:
											{
												drawt = "game settings"
												break;
											}
									}
							} else {
								if !filefound
									{
										drawt = "file not found!"
									}
							}
						
						draw_set_alpha(0.4)
						draw_rectangle_color(0,153,320,165,c_black,c_black,c_black,c_black,0)
						draw_set_alpha(1)
						if filefound then draw_set_color(c_white) else draw_set_color(c_red)
						
						
						draw_text(160,160,string_upper(drawt))
						draw_set_color(c_black)
					}
				break;
			}
		case 2: // options
			{
				switch global.debug.build_type
					{
						case "ps":
							var toDraw = ["Music Volume: "+string(global.setting.music),"Sound Volume: "+string(global.setting.sound),"Delete Save Data","Back To Menu"]
							break;
						case "pc":
							var toDraw = ["Music Volume: "+string(global.setting.music),"Sound Volume: "+string(global.setting.sound),"Screen Size: "+string(global.setting.scale)+"x","Vsync: "+string(global.setting.vsync),"Fullscreen: "+string(global.setting.full),"Delete Save Data","Back To Menu"]
							break;
						case "web":
							var toDraw = ["Music Volume: "+string(global.setting.music),"Sound Volume: "+string(global.setting.sound),"Login to Newgrounds","Delete Save Data","Back To Menu"]
							break;
					}
				
				draw_set_alpha(0.4)
				draw_rectangle_color(0,104+(selection*10),320,113+(selection*10),c_black,c_black,c_black,c_black,0)
				draw_set_alpha(1)
				draw_set_color(c_white)
				draw_text(160,80,"game settings")
				for(var i = 0; i < array_length(toDraw); i++)
					{
						draw_text(160,100+((i+1)*10),toDraw[i])
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
														mode = 3
														selection = 0
														break;
													}
												case 3:
													{
														mode = 1
														save_setting()
														sel_freeze = 0
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
														mode = 3
														selection = 0
														break;
													}
												case 6:
													{
														mode = 1
														save_setting()
														sel_freeze = 0
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
														alarm_set(5,2)
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
														global.setting.full += hor
														window_set_fullscreen(global.setting.full)
														break;
													}
											}
									}
								break;
							}
					}
				break;
			}
		case 3: // delete file
			{
				draw_set_alpha(0.4)
				draw_rectangle_color(0,135+(selection*12),320,142+(selection*12),c_black,c_black,c_black,c_black,0)
				draw_set_alpha(1)
				
				draw_set_color(c_white)
				draw_text(160,100,"Are you sure you want to delete your save data?\n(This action cannot be reversed!)")
				draw_text(160,140,"Yes")
				draw_text(160,152,"No")
				
				var ver = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up)
				
				if ver <> 0 then Sound("sx_title_move",0)
				
				selection += ver
				
				if keyboard_check_pressed(ord("Z"))
					{
						
						switch selection
							{
								case 0:
									{
										save_delete()
										Sound("sx_error",0)
										mode = 2
										break;
									}
								case 1:
									{
										mode = 2
										Sound("sx_title_menu_select",0)
										break;
									}
								
							}
					}
			}
		
	}


/* end sequence
Sound("sx_title_select",0)
							alarm_set(0,100)
							selected[1] = 0
							selected[2] = 0
							made = 1
*/



draw_sprite_ext(s_fade_white,0,0,0,1,1,0,c_white,flash)
if timer > 350 then flash = lerp(flash,0,.02)
}