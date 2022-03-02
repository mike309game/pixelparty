//shader_set(shUnprecise);
draw_set_font(f_main)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_color(c_white)

//draw_sprite_ext(s_fade_white,0,0,0,1,1,0,c_white,background_alpha)
draw_sprite_tiled_ext(s_er_bg,0,0,-second_background_pos,1,1,c_white,background_alpha)
draw_sprite_tiled_ext(s_intro_bg,local_animation_timer,0,0,1,1,c_white,background_alpha-0.1)

draw_set_alpha(text_alpha)
draw_text(160,text_y,string_copy(dialogue[dialogue_counter],1,text_counter)) //thank the memory manager for not making this explode
draw_set_alpha(1)

draw_sprite_ext(s_manny_intro,local_animation_timer,160,manny_y,manny_scale,manny_scale,0,c_white,manny_alpha)

if display_text
	{
		draw_set_alpha(0.3)
		draw_rectangle_color(0,(text_y-2)-text_spark_scale,320,(text_y-4)+text_spark_scale,c_white,c_white,c_white,c_white,0)
		draw_set_alpha(1)
	}

if total_animation_timer >= 85 && !outro
	{
		background_alpha = lerp(background_alpha,0.4,.1)
		local_animation_timer+=0.1
		manny_y = lerp(manny_y,120,.01)
		manny_scale = lerp(manny_scale,2,.003)
		manny_alpha += 0.01
	}
if outro
	{
		manny_alpha -= 0.02
		manny_y = lerp(manny_y,320,.01)
		manny_scale = lerp(manny_scale,3,.01)
		fade_alpha = lerp(fade_alpha,1,.05)
	}
draw_sprite_ext(s_fade_black,0,0,0,1,1,0,c_white,fade_alpha)
//shader_reset();