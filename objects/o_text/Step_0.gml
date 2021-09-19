//show_debug_message(array_length(parse))
cooldown--
function findText()
	{
		var fin = ""
		
		//if a = 0 then a++
		
		if a  >= array_length(parse) then a = 0
		
		while(!found)
			{
				//show_message("'" + parse[a] + "'" + " | " + "'" +find+"'")
				if parse[a] = find
					{
						found = 1
						break
						//a = 0
					} else {
						a++
					}
			}
			
		if a  < array_length(parse) then a++
		
		while(!(string_copy(fin,1,1) = "@"))
			{
				if found
					{
						//show_debug_message("hi")
							fin = string_copy(parse[a],1,3)
					
							switch fin
								{
									case "NME":
										{
											/*if tr != 2then*/ name = string_copy(parse[a],5,string_length(parse[a]))
											break;
										}
									case "PAL":
										{
											p_alt = string_copy(parse[a],5,1)
											break;
										}
									case "EVT":
										{
											
											global.evts = ds_list_create()
											global.evtst = 1
											for(var i = 0; i < string_length(parse[a]); i++)
												{
													var cum = string_char_at(parse[a],i)
													
													if cum = " "
														{
															ds_list_add(global.evts,string_copy(parse[a],global.evtst,i-global.evtst))
															global.evtst = i+1
														}
													if i = string_length(parse[a])-1 then ds_list_add(global.evts,string_copy(parse[a],global.evtst,i-global.evtst+2))
												}
											ds_list_delete(global.evts,0)
											//show_message(ds_list_find_value(global.evts,1))
											
											if ds_list_find_value(global.evts,0) != "wait"
												{
													var obj = instance_create_depth(0,0,-999999,o_event)
													switch ds_list_find_value(global.evts,0)
														{
															case "sound":
																{
																	with(obj)
																		{
																			event = "sound"
																			data[0] = asset_get_index("sx_"+ds_list_find_value(global.evts,1))
																		}
																}
														}
												}
											
											break;
										}
									case "EXT":
										{
											show_debug_message("exiting textbox")
											//name = ""
											tr = 2
											a = a
											break;
										}
								}
							//show_debug_message(string_copy(find,1,1))
		
							if string_copy(fin,1,1) = "@" //&& tr = 1
								{
									text = string_copy(parse[a],3,string_length(parse[a]))
									text = string_hash_to_newline(text)
									//show_message(text+" |END")
								} else {
									if a  < array_length(parse) && tr != 2  then a++
								}
		
		
							// anti hang kinda
							if a > 1000
								{
									show_debug_message("Array position over 1000 or file too big! break")
									a = 0;
									instance_destroy(self)
									break;
								}
					
							if tr = 2 then break;
					
						}
				}
			}

// Transition Mode Handling
switch tr
	{
		case 0: // Raise
			{
				// Start Text
				if text = "" then findText()
				if _y > 0 then _y -= 1.5
				if _y = 0 then tr = 1
				break;
			}
		case 1: // Dialogue
			{
				count = clamp(count,0,string_length(text))
				count+=0.5
				
				if count < string_length(text)
					{
						if !audio_is_playing(sx_text_sound)
							{
								Sound("sx_text_sound",0)
								
								// Different Text Pitches
								switch string_lower(name)
									{
										case "manny":
											{
												audio_sound_pitch(sx_text_sound,random_range(1,1.3))
												break;
											}
										case "bully":
											{
												audio_sound_pitch(sx_text_sound,random_range(0.6,0.8))
												break;
											}
										case "dex":
											{
												audio_sound_pitch(sx_text_sound,random_range(0.5,0.6))
												break;
											}
										default:
											{
												audio_sound_pitch(sx_text_sound,random_range(0.7,1))
												break;
											}
									}
							}
						
					}
				
				if keyboard_check_pressed(ord("Z")) && count >= string_length(text)
					{
						findText()
						count = 0
					}
				if keyboard_check_pressed(ord("Z")) && count < string_length(text) && count > 1
					{
						if cooldown <= 0 then count = string_length(text)-1
						cooldown = 10
						
					}
				break;
			}
		case 2: // Lower
			{
				if _y < 80 then _y += 1.5
				if _y = 80 then instance_destroy(self)
				break;
			}
	}