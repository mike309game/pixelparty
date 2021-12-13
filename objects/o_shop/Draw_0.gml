draw_set_halign(fa_left)
draw_set_valign(fa_top)



draw_sprite(s_shop_bg,0,0,0)

if !flipping then draw_sprite(s_shop_dex,0,0,dexoffset+dexintro) else draw_sprite(s_shop_dex_flip,0,0,dexoffset+dexintro)

draw_sprite(s_shop_desk,0,0,0)

draw_sprite(s_shop_dex_arm,0,0,0+dexintro) // dex arm

draw_sprite(s_shop_dex_ear,0,0,dexoffset+dexintro) // dex ear

if fliptimer > 5
	{
		flipping = 1
	}
	
if flipping
	{
		draw_sprite_ext(s_shop_dex_coin,0,64,coinY,1,1,coinR,c_white,1)
		if !coinM then coinY = lerp(coinY,16,.1) else coinY = lerp(coinY,85,.05)
		if !coinM && coinY < 17 then coinM = 1
		if coinM && coinY > 66
			{
				flipping = 0
				fliptimer = 0
				coinM = 0
				coinR = 0
				coinY = 64
			}
		coinR += 8
	}
draw_sprite_part(s_shop_ui,0,0,64,112,48,1,240-48) // left item box
draw_sprite_part(s_shop_ui,0,0,64,112,48,1+107,240-48) // middle item box
draw_sprite_part(s_shop_ui,0,0,64,112,48,1+107+107,240-48) // right item box

draw_set_color(c_black)
draw_set_font(f_shop)

switch string_copy(room_get_name(room),3,2)
	{
		case "l1":
			{
				
				for(var i = 0; i < 3; i++)
					{
						draw_text(44+((i+1)*107-107),200,string_upper(ds_map_find_value(global.shop_item_name,global.shop_start_tables.l1[i])) ) //item names
						draw_sprite(asset_get_index("s_shop_item_"+global.shop_start_tables.l1[i]),0,5+((i+1)*107-107),197) // item sprites
						
						
						if ds_map_find_value(global.shop_item_price,global.shop_start_tables.l1[i]) > 0 // Draw Price if greater than 0
							{
								draw_text(65+((i+1)*107-107),218,string_upper(ds_map_find_value(global.shop_item_price,global.shop_start_tables.l1[i]) ) ) // item price
							}
						if ds_map_find_value(global.shop_item_price,global.shop_start_tables.l1[i]) = 0 // Draw FREE if price is 0
							{
								draw_text(65+((i+1)*107-107),218,"FREE!") // item price
							}
					}
				
				break;
			}
		case "l2":
			{
				
				for(var i = 0; i < 3; i++)
					{
						draw_text(44+((i+1)*107-107),200,string_upper(ds_map_find_value(global.shop_item_name,global.shop_start_tables.l2[i])) ) //item names
						draw_sprite(asset_get_index("s_shop_item_"+global.shop_start_tables.l2[i]),0,5+((i+1)*107-107),197) // item sprites
						
						
						if ds_map_find_value(global.shop_item_price,global.shop_start_tables.l2[i]) > 0 // Draw Price if greater than 0
							{
								draw_text(65+((i+1)*107-107),218,string_upper(ds_map_find_value(global.shop_item_price,global.shop_start_tables.l2[i]) ) ) // item price
							}
						if ds_map_find_value(global.shop_item_price,global.shop_start_tables.l2[i]) = 0 // Draw FREE if price is 0
							{
								draw_text(65+((i+1)*107-107),218,"FREE!") // item price
							}
					}
				
				break;
			}
	}




draw_set_color(c_white)
draw_set_font(f_main)

draw_sprite_part(s_shop_ui,0,16,0,64,64,8,0) // gold counter
draw_text(34,41,global.player.money)

draw_text(16,100,"Buy")
draw_text(16,100+16,"Talk")
draw_text(16,100+32,"Exit")

switch menuMode
	{
		case 0:
			{
				draw_sprite_part(s_shop_ui,0,0,32,16,16,0,100+((selection[0]+1)*16-16)) 
				break;
			}
		case 2:
			{
				draw_sprite_part(s_shop_ui,0,112,0,96,64,180,8)
				draw_sprite_part(s_shop_ui,0,112,64,32,16,180,80)
				draw_sprite_part(s_shop_ui,0,144,64,48,16,240,80)
				
				switch selection[2]
					{
						case 0: //ye
							{
								draw_sprite_part(s_shop_ui,0,80,32,32,32,240-85,70)
								break;
							}
						case 1: //no
							{
								draw_sprite_part(s_shop_ui,0,80,32,32,32,240-22,70)
								break;
							}
					}
				
				break;
			}
	}


draw_sprite_part(s_shop_ui,0,80,0,32,32,32+((selection[1]+1)*107-107),160) // hand

draw_sprite_ext(s_fade_black,0,0,0,1,1,0,c_white,fade)

draw_set_font(f_shop)
draw_sprite_part(s_psxbuttons,0,0,0,16,16,0,65)
draw_sprite_part(s_psxbuttons,0,16,0,16,16,0,65+16)
draw_text(16,65,"- Select")
draw_text(16,65+16,"- Back")

/* debug
draw_set_color(c_white)
draw_text(0,0,dexoffset)
draw_text(0,16,movedir)
draw_text(0,32,selection[0])
draw_text(0,48,selection[1])

