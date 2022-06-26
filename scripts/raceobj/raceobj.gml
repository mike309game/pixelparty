/*

Race minigame objects

*/


///@desc Race base object
function raceobjBase() constructor {
	raceProgress = 0;
	isPlayer = false;
	state = 0;
	x = 0;
	y = 0;
	z = 0;
	static Step = function(input) {
		
	}
	static Draw = function() {
		
	}
	static Cleanup = function() {
		
	}
}

///@desc Race racer object
function raceobjRacer(sprite) : raceobjBase() constructor {
	show_debug_message("made racer obj");
	self.sprite = sprite;
	
	static DrawOld = Draw;
	static Draw = function() {
		DrawOld();
		DrawSprite3D(sprite, 0, x, y, z, 0, 1, 1);
	}
}