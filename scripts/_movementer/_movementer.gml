//8 dirs
enum eDir {
	//→
	right = 0,
	//↗
	upRight = 1,
	//↑
	up = 2,
	//↖
	upLeft = 3,
	//←
	left = 4,
	//↙
	downLeft = 5,
	//↓
	down = 6,
	//↘
	downRight = 7
}

function Movementer(_obj) constructor {
	obj = _obj;
	enum eMovementFlag {
		canMove = 1 << 0,
		canFace = 1 << 1,
		canAnimate = 1 << 2,
		moving = 1 << 3
		
	}
	#macro COLLPRECISION (16)
	#macro COLLPRECISIONSHIFTABLE (4)
	realx = obj.x * COLLPRECISION;
	realy = obj.y * COLLPRECISION;
	
	oldrealx = realx; //collision calculation i guess
	oldrealy = realy;
	
	moving = 0; //character is moving?
	
	/*input_x = 0; //for checking if character has to go horizontally
	input_y = 0; //for checking if character has to go vertically*/
	
	//if no smoothing is needed just make the accel values equal
	//these default values move 1 pixel each step and have no smoothing
	accel_start = COLLPRECISION; //acceleration when holding keys
	accel_stop = COLLPRECISION-14; //acceleration when letting off keys
	spdx = 0; //the current horizontal speed
	spdy = 0; //the current vertical speed
	spdmax = COLLPRECISION*1; //max speed
	
	static CollideCheck = function(x,y,_obj) {
		gml_pragma("forceinline");
		return collision_rectangle(x,y,(obj.bbox_right - obj.bbox_left) + x,(obj.bbox_bottom - obj.bbox_top) + y,_obj,true,false); //this is terrible i am aware
	}
	
	static Move = function(inputX, inputY) {
		gml_pragma("forceinline");
		moving = inputX != 0 || inputY != 0;
		
		//TODO: gotta rewrite all this shit when i put in collision lol
		if(moving) {
		    spdx = clamp(spdx + inputX * accel_start, -spdmax, spdmax);
		    spdy = clamp(spdy + inputY * accel_start, -spdmax, spdmax);
			obj.dir = point_direction(0,0,inputX,inputY) / 45; //45 because each possible direction is a multiple of 45
		}
		
		//for stopping
		var realaccelstop = accel_stop;
		if(moving)
		    realaccelstop = accel_start;
		
		//stop horizontally
		if(sign(spdx) == -1 && inputX == 0) {
		    spdx = min(spdx + realaccelstop, 0);
		} else if(sign(spdx) == 1 && inputX == 0) {
		    spdx = max(spdx - realaccelstop, 0);
		}
		//stop vertically
		if(sign(spdy) == -1 && inputY == 0) {
		    spdy = min(spdy + realaccelstop, 0);
		} else if(sign(spdy) == 1 && inputY == 0) {
		    spdy = max(spdy - realaccelstop, 0);
		}
		
		oldrealx = realx; //collision calculation i guess
		oldrealy = realy;
		
		/*
		if(sign(horspd) == -1 && hor == 0) {
		horspd = min(horspd + mul,0);
		} else if(sign(horspd) == 1 && hor == 0){
		horspd = max(horspd - mul,0);
		}
		
		if(sign(verspd) == -1 && ver == 0) {
		verspd = min(verspd + mul,0);
		} else if(sign(verspd) == 1 && ver == 0){
		verspd = max(verspd - mul,0);
		}
		*/
	}
	
	static Collide = function() {
		gml_pragma("forceinline");
		///collision ig
				
		//notes: ~~ will floor the value because gamemaker would floor it if it were a double
		//^^^this is not faster LMFAO
		
		//shifts are faster, that's why collision precision has to be a pow of two
		
		var failsafe = int64(0);
		
		//HORIZONTAL
		if(spdx != 0) begin
		while(
		CollideCheck(
		    (realx + spdx) >> COLLPRECISIONSHIFTABLE,
		    realy >> COLLPRECISIONSHIFTABLE,
		    o_hitbox)
		)
		{
		    failsafe++;
			if(failsafe&256) then break;
		    spdx -= sign(spdx);
		}
		realx += spdx;end
		//VERTICAL
		if(spdy != 0) begin
		while(
		CollideCheck(
		    realx >> COLLPRECISIONSHIFTABLE,
		    (realy + spdy) >> COLLPRECISIONSHIFTABLE,
		    o_hitbox)
		)
		{
		    //show_debug_message("BAPBAPY");
			failsafe++;
			if(failsafe&256) then break;
		    spdy -= sign(spdy);
		}
		realy += spdy;end
		
		/*if(global.time%60 == 0) {
			show_debug_message(failsafe);
		}*/
		
		obj.x = realx >> COLLPRECISIONSHIFTABLE;
		obj.y = realy >> COLLPRECISIONSHIFTABLE;
	}
}