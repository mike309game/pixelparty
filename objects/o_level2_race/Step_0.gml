if start_timer >= 40
	{
		Music(mx_race,1)
		cam_pos -= scroll_rate
		
		scroll_rate = lerp(scroll_rate,2,.05)
		if GetInput(eInput.up,1) then ver -= 1
		if GetInput(eInput.down,1) then ver += 1
	}

if start_timer = 40
	{
		obst_spawner = 1
		alarm_set(1,85)
	}
	
if obst_hits > 15 && !bullied
	{
		//obst_spawner = 0
		//progress++
		
		QuickInterpreter("global-fuckyou-race");
		bullied = true
	}

if keyboard_check_pressed(vk_space) then obst_hits = 15

boat_vert = lerp(boat_vert,ver,.2)
boat_hori = lerp(boat_hori,progress,.2)

number_scale = lerp(number_scale,1,.2)

// shittiest code ever sob

