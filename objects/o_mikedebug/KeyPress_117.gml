///@desc force enable movement
AssureGameFlag(eFlag.playerCanMove | eFlag.playerCanInteract | eFlag.playerCanTransition);
UnfreezeAllInput();
AllowAllInput();
FadeOut();
MANAGER.fadeSpeed = 0.04;
show_message("enabled normal movement and input");