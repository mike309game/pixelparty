if place_meeting(x,y+48,o_player) && !instance_exists(o_text)
	{
		if ! ds_map_find_value(global.gameevent,"l2_e1") then textbox("fish1","level2")
		talk = 1
	}
if !instance_exists(o_text)
	{
		talk = 0
		frame = 0
	} else {
		if string_lower(o_text.name) = "ricky"
			{
				talk = 1
			} else {
				talk = 0
				frame = 0
			}
	}
if talk = 1
	{
		frame += 0.05
		if frame > 1 then frame = 0
	}
image_index = round(frame)

if ds_map_find_value(global.gameevent,"l2_e1")
	{
		boxDestroy(1)
	}