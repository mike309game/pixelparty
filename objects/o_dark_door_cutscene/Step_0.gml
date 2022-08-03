timer++

if timer = 75
	{
		Music(mx_horrorenter,0)
		
	}
	
if timer > 75 
	{
		
	}
if timer > 75 && timer < 430
	{
		sizeAlp += 0.01
		clmp = 2
		alph = lerp(alph,1,.01)
	}
	
if timer > 430
	{
		sizeAlp += 0.04
		clmp = 6
		alph = lerp(alph,0,.05)
		
		frame += 0.05
	}
	
if timer = 900
	{
		//instance_destroy(id)
		Transition(r_drk_horror,1,0,1,0)
	}