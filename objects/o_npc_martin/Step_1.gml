if place_meeting(x,y,o_player) && instance_exists(o_text)
	{
		if o_text.tr = 2
			{
				dodown = true
			}
	}
if dodown then al -= 0.05
if al <= 0
	{
		instance_destroy(id)
		global.gameevent[? "mev_"+string(mev)] = 1
	}
image_alpha = al