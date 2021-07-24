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
			}
	}