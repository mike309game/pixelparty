
if shopbully && ds_map_find_value(global.gameevent,"l1_e2")
	{
		if !okdone then alarm_set(1,1)
		x = lerp(x,go,.1)
		instance_destroy(100194)
		find = "bully2"
		//draw_sprite_part(s_bully_cry,0,(frame+1)*64-64,moke*80-80,64,80,x,y)
		image_index = frame
		if audio_is_playing(sx_bully_cry)
			{
				moke = 1
			} else {
				moke = 2
				cry--
			}
		if moke = 2
			{
				sprite_index = s_bully_mumble
				if cry <= -1
					{
						cry = irandom_range(30,150)
						if distance_to_object(o_player) < 90 then Sound(sx_bully_cry,0)
					}
			} else {
				sprite_index = s_bully_cry
			}
		
	} else {
		sprite_index = s_bully_block
	}