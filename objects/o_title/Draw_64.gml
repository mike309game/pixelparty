draw_sprite_tiled(s_title_bg,0,bgX,bgY)
draw_sprite_ext(s_title_logo,0,160,120,scale,scale,0,c_white,1)
draw_sprite_ext(s_fade_black,0,0,0,1,1,0,c_white,fade)

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_color(c_black)
draw_set_font(f_main)
var copyright = "(c)2000 Yisi-fy LTD"
draw_text(160,230,copyright)
draw_text(159,230,copyright)
draw_text(161,230,copyright)

// menu options

if timer >= 340
{
	
if selected[0] = 1 then draw_text(60,120,"Start Game")
if selected[1] = 1 draw_text(250,120,"Option")
if selected[2] = 1 draw_text(160,80,"Continue")

switch selection
	{
		case 1:
			{
				draw_sprite(s_arrow,0,60,110)
				break;
			}
		case 2:
			{
				draw_sprite(s_arrow,0,160,70)
				break;
			}
		case 3:
			{
				draw_sprite(s_arrow,0,250,110)
				break;
			}
	}

if keyboard_check_pressed(ord("Z")) && !made
	{
			switch selection
				{
					case 1:
						{
							Sound("sx_title_select",0)
							alarm_set(0,100)
							selected[1] = 0
							selected[2] = 0
							made = 1
							break;
						}
					case 2:
						{
							break;
						}
					case 3:
						{
							break;
						}
				}

	}

draw_sprite_ext(s_fade_white,0,0,0,1,1,0,c_white,flash)
if timer > 350 then flash = lerp(flash,0,.02)
}