timer++

if timer > 100
	{
		alphix = lerp(alphix,1,.02)
	}
	
if alphix >= .50 && GetInputPressed(eInput.interact)
	{
		Sound(sx_shop_broke)
		Transition(r_titlecards)
	}
