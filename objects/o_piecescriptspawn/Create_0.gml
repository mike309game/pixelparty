NegateGameFlag(eFlag.cameraFocusOnPlayer);

oldCameraX = global.camX;
oldCameraY = global.camY;
easingFocus = 0; //0: ease is @ start (player cam pos), 1: ease is where i am
easeHere = true; //true: set easingfocus to come here, false does opposite
alarm[0] = 60*4; //5 seconds til focus back on player & resume interpreter
myPiece = instance_create_depth(x,y,0,o_piece);
myPiece.image_alpha = 0;
Sound(sx_puzzle_appear);