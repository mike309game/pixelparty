function partyAdd(_char,_fanfare = 0)
	{
		var obj = instance_create_depth(obj_player.x,obj_player.y,0,o_follower)
		global.script_variables[? "party-"+string(_char)] = 1
		with(obj)
			{
				character = _char
			}
			
		if _fanfare
			{
				var mus = instance_create_depth(0,0,0,o_party_join)
				with(mus)
					{
						character = _char
					}
			}
	}