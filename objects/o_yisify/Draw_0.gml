draw_gui_set;
if timer = 350 then Sound(sx_yisify,0)
draw_sprite_ext(s_lnx,0,160,120,1,1,0,c_white,lnxfade)
if timer > 50 && timer < 150 then lnxfade += 0.01
if timer > 200 && timer < 300 then lnxfade -= 0.01

if timer >= 350 && timer < 600
	{
		draw_sprite(s_yisify,0,160,120)
	}
if timer >= 750
	{
		roomTrans(r_title,0,1)
		global.vars.ignoreplayer = 1
	}
draw_gui_exit;