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

/*
 * \\\\\\\\\\\\\\\\\\\\\\\\\\\\NOTE:////////////////////////////
 *
 * THIS CODE IS ABSOLUTELY ATROCIOUS AND WILL BE REWRITTEN AT ONE POINT JUST GIVE ME A BIT
 *
 */

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
	realX = obj.x << COLLPRECISIONSHIFTABLE;
	realY = obj.y << COLLPRECISIONSHIFTABLE;
	
	moving = 0; //character is moving?
	
	/*input_x = 0; //for checking if character has to go horizontally
	input_y = 0; //for checking if character has to go vertically*/
	
	//if no smoothing is needed just make the accel values equal
	//these default values move 1 pixel each step and have no smoothing
	accelStart = COLLPRECISION; //acceleration when holding keys
	accelStop = COLLPRECISION-14; //acceleration when letting off keys
	speedX = 0; //the current horizontal speed
	speedY = 0; //the current vertical speed
	speedMax = COLLPRECISION*1; //max speed
	
	static CollideCheck = function(x,y,_obj) {
		return collision_rectangle(x,y,(obj.bbox_right - obj.bbox_left) + x,(obj.bbox_bottom - obj.bbox_top) + y,_obj,true,false); //this is terrible i am aware
	}
	
	static Move = function(inputX, inputY) {
		moving = inputX != 0 || inputY != 0;
		
		//TODO: gotta rewrite all this shit when i put in collision lol
		if(moving) {
		    speedX = clamp(speedX + inputX * accelStart, -speedMax, speedMax);
		    speedY = clamp(speedY + inputY * accelStart, -speedMax, speedMax);
			obj.dir = point_direction(0,0,inputX,inputY) / 45; //45 because each possible direction is a multiple of 45
		}
		
		//for stopping
		var accelX = inputX ? accelStart : accelStop;
		
		var accelY = inputY ? accelStart : accelStop;
		
		//stop horizontally
		if(sign(speedX) == -1 && inputX == 0) {
		    speedX = min(speedX + accelX, 0);
		} else if(sign(speedX) == 1 && inputX == 0) {
		    speedX = max(speedX - accelX, 0);
		}
		//stop vertically
		if(sign(speedY) == -1 && inputY == 0) {
		    speedY = min(speedY + accelY, 0);
		} else if(sign(speedY) == 1 && inputY == 0) {
		    speedY = max(speedY - accelY, 0);
		}
	}
	
	static Collide = function(collide = true) {
		repeat(abs(speedX)) {
			realX += sign(speedX);
			if(CollideCheck(realX >> COLLPRECISIONSHIFTABLE, realY >> COLLPRECISIONSHIFTABLE, o_hitbox) && collide) {
				realX -= sign(speedX);
				speedX = 0;
				break;
			}
		}
		repeat(abs(speedY)) {
			realY += sign(speedY);
			if(CollideCheck(realX >> COLLPRECISIONSHIFTABLE, realY >> COLLPRECISIONSHIFTABLE, o_hitbox) && collide) {
				realY -= sign(speedY);
				speedY = 0;
				break;
			}
		}
		
		obj.x = realX >> COLLPRECISIONSHIFTABLE;
		obj.y = realY >> COLLPRECISIONSHIFTABLE;
	}
	static StopMoving = function() {
		speedX = 0;
		speedY = 0;
		obj.x = realX >> COLLPRECISIONSHIFTABLE;
		obj.y = realY >> COLLPRECISIONSHIFTABLE;
	}
}