second_background_pos++

if display_text = true
	{
		text_counter += count_rate
		text_alpha = 1
		text_spark_scale -= 0.1
	} else {
		text_alpha -= 0.01
	}
			
if floor(text_counter) >= string_length(dialogue[dialogue_counter])+5
	{
		display_text = false
	}

if keyboard_check_pressed(vk_space)
	{
		manny_scale = 2;
		manny_y = 120;
		total_animation_timer = 210 
		dialogue_counter = 2;
	}

// animation timing

switch total_animation_timer
	{
		case 20:
			{
				nextText();
				break;
			}
		case 45:
			{
				nextText();
				break;
			}
		case 80:
			{
				Music(mx_intro)
				break;
			}
		case 85:
			{
				text_y = 220
				break;
			}
		case 100:
			{
				nextText()
				break;
			}
		case 135:
			{
				count_rate = 0.25
				nextText()
				break;
			}
		case 155:
			{
				nextText()
				break;
			}
		case 180:
			{
				nextText()
				break;
			}
		case 210:
			{
				count_rate = 0.15
				nextText()
				break;
			}
		case 220:
			{
				outro = true
				break;
			}

	}

if(evaporate) { //NOTE will crash if the game stays here for too long or if we're extremely unlucky
	var count = 0;
	while(count < 30) {
		var offset = irandom_range(0, 320*240) * 4;
		if(buffer_peek(vaporBuffer, offset, buffer_u32) == 0) { //not in manny region
			continue;
		}
		count++;
		buffer_poke(vaporBuffer, offset, buffer_u32, 0);
		instance_create_depth((offset/4) % 320, floor((offset/4) / 320), -10, o_introdust);
	}
}

if(whiteMannyAlpha > 1 && !evaporate) {
	evaporate = true;
	buffer_get_surface(vaporBuffer, vaporSurface, 0);
	MANAGER.fadeSpeed = 0.008;
	Transition(r_hon1, 10, 0, true);
}

if false /*total_animation_timer >= 230*/
	{
		/*global.vars.ignoreplayer = 1
		global.vars.fakeload = r_hon1
		roomTrans(r_load,0,1)*/
		
	}

