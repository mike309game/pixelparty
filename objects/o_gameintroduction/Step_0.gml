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
		total_animation_timer = 80 
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
if total_animation_timer >= 230
	{
		global.vars.ignoreplayer = 1
		global.vars.fakeload = r_ho_1
		roomTrans(r_load,0,1)
	}