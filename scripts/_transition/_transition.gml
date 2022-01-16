function Transition(_destination, _marker, _freezeInput = int64(0), _loadingScreen = false, noclip = true){
	AssureGameFlag(eFlag.doFadeIn); //begin fading in
	
	NegateGameFlag(eFlag.playerCanTransition | (eFlag.playerCanCollide * noclip)); //disallow doors and such and let player noclip
	
	ForbidAllInputExcept(_freezeInput);
	FreezeInput(_freezeInput);
	
	with(instance_create_depth(0,0,-16000,o_transitionmanager)) {
		destination = _destination;
		marker = _marker;
		loadingScreen = _loadingScreen;
	}
}