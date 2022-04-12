

draw_sprite_tiled(s_race_bg,0,0+cam_pos,0)

draw_sprite(s_race_boat_enemy,0,48,96 + sin(global.time / 20) * 1)

if object_exists(o_level2_race_obst)
	{
		for(var i = 0; i < instance_number(o_level2_race_obst); i++)
			{
				var obst = instance_find(o_level2_race_obst,i)
				draw_sprite(obst.sprite_index,0,obst.x,obst.y)
			}
	}


draw_sprite(s_race_boat_player,0,48+progress,(150+boat_vert) + sin(global.time / 20) * 1)


