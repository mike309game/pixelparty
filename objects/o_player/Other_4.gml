for(var i = 0; i < instance_number(o_roompoint); i++)
	{
		if instance_find(o_roompoint,i).pt = global.vars.roompt
			{
				x = instance_find(o_roompoint,i).x-24
				y = instance_find(o_roompoint,i).y-48
			}
	}