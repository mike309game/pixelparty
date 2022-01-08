if(!touched) {
	touched = true;
	with(other) { //don't be diagonal
		switch(dir) {
			case eDir.up:
				FreezeInput(eInput.up);
				ForbidAllInputExcept(eInput.up);
				break;
			case eDir.down:
				FreezeInput(eInput.down);
				ForbidAllInputExcept(eInput.down);
				break;
			case eDir.right:
			case eDir.downRight:
			case eDir.upRight:
				dir = eDir.right;
				FreezeInput(eInput.right);
				ForbidAllInputExcept(eInput.right);
				break;
			case eDir.left:
			case eDir.downLeft:
			case eDir.upLeft:
				dir = eDir.left;
				FreezeInput(eInput.left);
				ForbidAllInputExcept(eInput.left);
				break;
		}
	}
}