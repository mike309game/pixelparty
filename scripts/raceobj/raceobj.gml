/*

Line collision manager

*/

/*function LineCollisionManager() constructor { //garbage don't bother
	lines = ds_list_create();
	static AddLine = function() {
		
	}
	static Clear = function() {
		var len = ds_list_size(lines);
		for(var i = 0; i < len; i++) {
			delete lines[|i];
		}
	}
	static Cleanup = function() {
		Clear();
		ds_list_destroy(lines);
	}
	static CheckCollide = function(x1,y1,x2,y2) { //idfk how this works
		var len = ds_list_size(lines);
		for(var i = 0; i < len; i++) {
			var line = lines[|i];
			var dx0 = line.x2-line.x1
			var dx1 = x2-x1
			var dy0 = line.y2-line.y1
			var dy1 = y2-y1
			var p0 = dy1*(x2-line.x1) - dx1*(y2-line.y1)
			var p1 = dy1*(x2-line.x2) - dx1*(y2-line.y2)
			var p2 = dy0*(line.x2-x1) - dx0*(line.y2-y1)
			var p3 = dy0*(line.x2-x2) - dx0*(line.y2-y2)
			if((p0*p1<=0) && (p2*p3<=0)){
				return line.owner;
			}
		}
		return noone;
	}
}*/

/*

Race minigame objects

*/


///@desc Race base object
function raceobjBase() constructor {
	type = 0;
	raceProgress = 0;
	isPlayer = false;
	state = 0;
	x = 0;
	y = 0;
	z = 0;
	myLine = new other.Line(0,0,0,0,Stub);
	
	static Step = function(input) {
		
	}
	static Draw = function() {
		
	}
	static Cleanup = function() {
		
	}
	static Stub = function() {
		
	}
}

///@desc Race racer object
function raceobjRacer(sprite) : raceobjBase() constructor {
	type = 1;
	show_debug_message("made racer obj");
	self.sprite = sprite;
	y = 100;
	accel = 0;
	
	static StepOld = Step;
	static Step = function(input) {
		StepOld(input);
		
		var hor = !!(input & eInput.right) - !!(input & eInput.left); //!! is cuz & result is big and that just bool ifies it
		x += hor;
		
		if(input & eInput.square) {
			accel = min(accel + 0.07, 6.3);
		} else {
			accel = max(accel - 0.03, 0.5);
		}
		raceProgress += accel;
		
		myLine.x1 = x - 24;
		myLine.x2 = x + 24;
		
		myLine.y1 = y - raceProgress;
		myLine.y2 = myLine.y1;
	}
	
	static DrawOld = Draw;
	static Draw = function() {
		DrawOld();
		DrawSprite3D(sprite, 0, x, y - (raceProgress), z, 0, 1, 1, c_white, 1, 335);
		//draw_text(0, 60 - raceProgress, mouse_x);
	}
}

///@desc Test line obj
function raceobjTestline() : raceobjBase() constructor {
	type = 999;
	self.sprite = Sprite3D(s_raceRock);
	y = 100;
	accel = 0;
	
	static StepOld = Step;
	static Step = function(input) {
		StepOld(input);
		
		var hor = !!(input & eInput.right) - !!(input & eInput.left); //!! is cuz & result is big and that just bool ifies it
		x += hor;
		
		if(input & eInput.square) {
			accel = min(accel + 0.07, 6.3);
		} else {
			//accel = max(accel - 0.03, 0.5);
			accel = max(accel - 0.03, 0.);
		}
		raceProgress += accel;
		
		var colResult = other.CheckColl(x,y - raceProgress,x,(y - raceProgress) - 32);
		if(colResult) {
			show_debug_message(colResult);
		}
	}
	
	static DrawOld = Draw;
	static Draw = function() {
		DrawOld();
		DrawSprite3D(sprite, 0, x, y - (raceProgress), z, 0, 1, 1, c_white, 1, 335);
		//draw_text(0, 60 - raceProgress, mouse_x);
	}
}