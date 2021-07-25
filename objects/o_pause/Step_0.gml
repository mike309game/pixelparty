bgX += 0.5
bgY += 0.5
timer++

switch tr
	{
		case 0:
			{
				if timer > 10
					{
						surX = lerp(surX,4,.1)
						surY = lerp(surY,32,.1)
						surS = lerp(surS,0.5,.1)
						surR = lerp(surR,10,.1)
					}
				if surY >= 31.8 then tr = 1
				break
			}
		case 2:
			{
				if timer > 10
					{
						surX = lerp(surX,0,.1)
						surY = lerp(surY,0,.1)
						surS = lerp(surS,1,.1)
						surR = lerp(surR,0,.1)
					}
				if surY < 0.01 then instance_destroy(id)
				break
			}
			
	}
	
if keyboard_check_pressed(vk_enter) && tr = 1
	{
		tr = 2
		timer = 0
	}