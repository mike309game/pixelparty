depth = -y
switch catmode
	{
		case 0:
			{
				if place_meeting(x,y,o_player) && keyboard_check_pressed(ord("Z")) && !instance_exists(o_text)
					{
						if global.catparts.part[0] = 1 && global.catparts.part[1] = 1 && global.catparts.part[2] = 1
							{
								if !ds_map_find_value(global.gameevent,"l1_e3") then textbox("cat2","level1") else textbox("cat3","level1")
							} else {
								textbox("cat1","level1")
							}
					}
				
				
				break;
			}
		case 1:
			{
				if timer = 1 then global.player.move = 0
				timer++
				animode = 1
				frame = 1
				if timer >= 250
					{
						catmode = 0
						global.player.move = 1
						global.gameevent[? "l1_e3"] = 1
					}
				if timer = 110
					{
						puzzleAdd(2,x+48,y+16)
						global.vars.puz_odd = 1
					}
				
			}
	}