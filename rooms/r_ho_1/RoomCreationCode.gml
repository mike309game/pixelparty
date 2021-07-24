Music("mx_honest1",1)
if !global.event.hon1
	{
		var obj = instance_create_depth(0,0,0,o_texteffect)
		with(obj)
			{
				show = "h1"
			}
		global.event.hon1 = 1
	}