timer++

if timer > 100
	{
		game_end()
	}
	
if alphix >= .50 && GetInputPressed(eInput.interact)
	{
		Sound(sx_shop_broke)
		Transition(r_titlecards)
	}
