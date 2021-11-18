
rot += 1
timer++

if timer > 150
	{
		alpha = lerp(alpha,0,.05)
		elementalpha = lerp(elementalpha,0,.1)
		if alpha <= 0.01 then instance_destroy(self)
	} else {
		alpha = lerp(alpha,0.5,.05)
		elementalpha = lerp(elementalpha,1,.1)
	}