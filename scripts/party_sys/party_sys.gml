function partyAdd(_char)
	{
		var obj = instance_create_depth(obj_player.x,obj_player.y,0,o_follower)
		var mus = instance_create_depth(0,0,0,o_party_join)
		with(obj)
			{
				character = _char
			}
		with(mus)
			{
				character = _char
			}
	}