if keyboard_check_pressed(vk_alt)
	{
		destroy_timer += 1
		global.move = 1
	}
	
if destroy_timer >=1 then destroy_timer +=1
if destroy_timer >= 5 then instance_destroy(self)

if keyboard_check(vk_backspace)
	{
		//show_debug_message(vk_backspace)
		backspace_timer += 1

		if backspace_timer = 10
			{
				textfield = string_delete(textfield,string_length(textfield),1)
				backspace_timer = 0
			}
	} else {
			backspace_timer = 0
	}
if keyboard_check_pressed(vk_backspace)
	{
				textfield = string_delete(textfield,string_length(textfield),1)
				//backspace_timer = 0
	}
if keyboard_check_pressed(vk_anykey)
{
if keyboard_lastkey != 8 && keyboard_lastkey != vk_shift && keyboard_lastkey != vk_alt && keyboard_lastkey != vk_enter
    {
        textfield += keyboard_lastchar
        keyboard_lastkey = -1
    }
}

ds_list_delete(display_queue,8)

if keyboard_check_pressed(vk_enter)
    {
        cmdargs = ds_list_create()
        argstart = 1
        for(var i = 0; i < string_length(textfield); i++)
            {
                var temp = string_char_at(textfield,i)
                if temp = " "
                    {
                        ds_list_add(cmdargs,string_copy(textfield,argstart,i-argstart))
                        argstart = i+1
                    }
                if i = string_length(textfield)-1 then ds_list_add(cmdargs,string_copy(textfield,argstart,i-argstart+2))
            }
        
        parse = ds_list_find_value(cmdargs,0)
        ds_list_delete(cmdargs,0)
        
        switch parse
            {
                case "spawn":
				{
                    if string_digits(ds_list_find_value(cmdargs,1)) = ""
                        {
							ds_list_insert(display_queue,0,"Not a valid X coordinate!")
                            break
                        }
                    if string_digits(ds_list_find_value(cmdargs,2)) = ""
                        {
                            ds_list_insert(display_queue,0,"Not a valid Y coordinate!")
                            break
                        }
                    if asset_get_type(ds_list_find_value(cmdargs,0)) != asset_object
                        {
                            ds_list_insert(display_queue,0,"Not a valid object!")
                            break
                        }
					if instance_exists(o_player) then createdepth = o_player.depth+1
                    instance_create_depth(int64(ds_list_find_value(cmdargs,1)),int64(ds_list_find_value(cmdargs,2)),createdepth,asset_get_index(ds_list_find_value(cmdargs,0)))
					action_comp = 1
					break
				}
				case "room":
				{
					if asset_get_type("r_"+ds_list_find_value(cmdargs,0)) != asset_room
						{
							ds_list_insert(display_queue,0,"Not a room")
							break
						}
					if ds_list_size(cmdargs) = 2
						{
							if ds_list_find_value(cmdargs,1) = undefined || ds_list_find_value(cmdargs,1) = ""
								{
									ds_list_insert(display_queue,0,"No valid position id")
									break
								}
							global.vars.roompt = string_digits(ds_list_find_value(cmdargs,1))
						}
					global.vars.roomgo = asset_get_index("r_"+ds_list_find_value(cmdargs,0))
					room_goto(asset_get_index("r_"+ds_list_find_value(cmdargs,0)))
					//show_message("'" + string(asset_get_index("r_"+ds_list_find_value(cmdargs,0))) + "'")
					audio_stop_all()
					action_comp = 1
					break
				}
				case "playerpos":
				{
					if instance_exists(o_player)
						{
							ds_list_insert(display_queue,0,"X: "+string(o_player.x)+" Y: "+string(o_player.y))
						} else {
							ds_list_insert(display_queue,0,"o_player does not exist in this room.")
						}
						break
					action_comp = 1
				}
				case "clear":
				{
						ds_list_clear(display_queue)
						break
					}
				case "echo":
				{
					ds_list_insert(display_queue,0,string_copy(textfield,string_length(parse)+2,string_length(textfield)))
					break
				}
				case "refresh":
				{
					room_restart()
					action_comp = 1
					break
				}
				case "restart_game":
				{
					game_restart();
					action_comp = 1
					break;
				}
				default:
					if parse != "echo" then ds_list_insert(display_queue,0,"Not a valid command - use \"help\" for help.")
					break
            }
		textfield = ""
    }
blinktimer++
if action_comp then instance_destroy(id)