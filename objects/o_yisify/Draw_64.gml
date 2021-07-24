if timer = 100 then Sound("sx_yisify",0)

if timer >= 100 && timer < 200
	{
		draw_sprite(s_yisify,0,160,120)
	}
if timer >= 250
	{
		roomTrans(r_title,0,1)
		global.vars.ignoreplayer = 1
	}
