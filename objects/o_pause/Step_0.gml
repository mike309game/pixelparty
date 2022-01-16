function exitPause()
	{
		tr = 2
		timer = 0
		Sound(sx_pause_close)
	}

bgX += 0.5
bgY += 0.5
timer++

switch tr
	{
		case 0:
			{
				if timer > 10
					{
						surX = lerp(surX,4,.2)
						surY = lerp(surY,32,.2)
						surS = lerp(surS,0.5,.2)
						surR = lerp(surR,10,.2)
						pauseX = lerp(pauseX,96,.2)
					}
				if surY >= 31.8 then tr = 1
				break
			}
		case 2:
			{
				if timer > 4
					{
						surX = lerp(surX,0,.23)
						surY = lerp(surY,0,.23)
						surS = lerp(surS,1,.23)
						surR = lerp(surR,0,.23)
						pauseX = lerp(pauseX,320,.23)
					}
				if surY < 0.01 
					{
						instance_destroy(id)
						global.player.move = 1
						if instance_exists(o_player)
							{
								o_player.hor = 0
								o_player.ver = 0
							}
					}
				break
			}
			
	}
	
if keyboard_check_pressed(vk_enter) && tr = 1 && mode = 0
	{
		exitPause()
	}
	
//selection = max(0,selection)
//selection = min(array_length(menu)-1,selection)
var key = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up)
if tr = 1 then selection += key

if key <> 0 && tr = 1
	{
		Sound(sx_pause_move)
		
	}
if tr = 1
	{
		global.player.move = 0
	}
// selection
if keyboard_check_pressed(ord("Z")) && tr = 1 && mode = 0
	{
		switch selection
			{
				case 0:
					{
						Sound(sx_pause_move)
						exitPause()
						break;
					}
				case 1:
					{
						selection = 0
						Sound(sx_title_menu_select)
						mode = 1
						break;
					}
				case 2:
					{
						Sound(sx_error)
						break;
					}
				case 3:
					{
						tr = 3
						Sound(sx_pause_quit)
						global.vars.fakeload = r_title
						roomTrans(r_load,0,0)
						save_save()
					}
			}
	}
	
if tr = 3 then fade += 0.05

/*if !instance_exists(o_player) then instance_destroy(id)*/