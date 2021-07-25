show_debug_message(array_length(parse))
function findText()
	{
		var find = ""
		if a  < array_length(parse) then a++
		
		if a  >= array_length(parse) then a = 0
		
		while(!(string_copy(find,1,1) = "@"))
			{
					find = string_copy(parse[a],1,3)
					
					switch find
						{
							case "NME":
								{
									/*if tr != 2then*/ name = string_copy(parse[a],5,string_length(parse[a]))
									break;
								}
							case "EXT":
								{
									//name = ""
									tr = 2
									a = a
									break;
								}
						}
					//show_debug_message(string_copy(find,1,1))
		
					if string_copy(find,1,1) = "@" //&& tr = 1
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
							instance_destroy(id)
							break;
						}
					if tr = 2 then break;
				}
			}

switch tr
	{
		case 0:
			{
				if text = "" then findText()
				if _y > 0 then _y -= 1
				if _y = 0 then tr = 1
				break;
			}
		case 1:
			{
				count = clamp(count,0,string_length(text))
				count+=0.5
				
				if count < string_length(text)
					{
						if !audio_is_playing(sx_text_sound)
							{
								Sound("sx_text_sound",0)
								audio_sound_pitch(sx_text_sound,random_range(0.7,1))
							}
						
					}
				
				if keyboard_check_pressed(ord("Z")) && count >= string_length(text)
					{
						findText()
						count = 0
					}
				break;
			}
		case 2:
			{
				if _y < 80 then _y += 1
				if _y = 80 then instance_destroy(id)
				break;
			}
	}