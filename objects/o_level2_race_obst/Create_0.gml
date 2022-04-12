obst_ran = irandom_range(1,3)
image_alpha = 0

sprite_index = asset_get_index("s_race_obs"+string(obst_ran))

if x < 32 then instance_destroy(id)
