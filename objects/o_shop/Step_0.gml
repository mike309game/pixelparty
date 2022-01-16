switch menuMode
	{
		case 0: // option select
			{
					if !instance_exists(o_text)
						{
							if fade <= 0.5
								{
									dexintro = lerp(dexintro,0,.1)
								}
							if fade <= 0.1
								{
									
									if ds_map_find_value(global.gameevent,"shopfirst") = 0
										{
											textbox("ran0","dex_shop_talk")
											//global.gameevent[? "shopfirst"] = 1

											
										}
									var key = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up)
									if key <> 0 then Sound(sx_shop_move)
									selection[0] += key
								}
						
							fade = lerp(fade,0,.1)
						
							switch selection[0]
								{
									case 0:
										{
											if keyboard_check_pressed(ord("Z"))
												{
													menuMode = 1
													break;
												}
										}
									case 1:
										{
											if keyboard_check_pressed(ord("Z"))
												{
													Sound(sx_shop_select)
													var ran = irandom_range(1,3)
													textbox("ran"+string(ran),"dex_shop_talk")
												}
												break;
										}
									case 2:
										{
											if keyboard_check_pressed(ord("Z"))
												{
													switch string_copy(room_get_name(room),3,2)
														{
															case "l1":
																{
																	global.vars.ignoreplayer = 1
																	roomTrans(r_l1_r5,2,0)
																	break;
																}
															case "l2":
																{
																	global.vars.ignoreplayer = 1
																	roomTrans(r_l2_r4,1,0)
																	break;
																}
														}
												}
											break;
										}
								}
						
						} else {
							fade = lerp(fade,0.5,.1)
						}
				break;
			}
		case 1: // item select
			{
				var key = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left)
				if key <> 0 then Sound(sx_shop_move)
				selection[1] += key
				
				// exit
						if keyboard_check_pressed(ord("X"))
							{
								menuMode = 0
							}
				
				if keyboard_check_pressed(ord("Z")) && !instance_exists(o_text)
					{
						
						
						
						
						if global.player.money >= ds_map_find_value(global.shop_item_price,global.shop_start_tables.l1[selection[1]]) && ds_map_find_value(global.shop_item_price,global.shop_start_tables.l1[selection[1]]) > -1
							{
								
								menuMode = 2
								//show_debug_message("it worx")
							} else {
								if ds_map_find_value(global.shop_item_price,global.shop_start_tables.l1[selection[1]]) > -1 //prevent purchase if -1
									{
										textbox("broke","dex_shop_talk")
									}
							}
					}
				
				break;
			}
		case 2:
			{
				var key = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left)
				if key <> 0 then Sound(sx_shop_move)
				selection[2] += key
				
				if keyboard_check_pressed(ord("Z"))
					{
						switch selection[2]
							{
								case 0:
									{
										var inadd = invAdd(string(global.shop_start_tables.l1[selection[1]]))
										//show_debug_message(inadd)
										switch inadd
											{
												case 0:
													{
														textbox("full","dex_shop_talk")
														break;
													}
												case 1:
													{
														menuMode = 0
														Sound(sx_shop_purchase)
														break;
													}
											}
										global.shop_start_tables.l1[selection[1]] = "nothing"
										break;
									}
								case 1:
									{
										menuMode = 1
									}
							}
					}
					break;
			}
	}