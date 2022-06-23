//i figured, maybe it's not the best idea to do what i do with
//the current menu things where i create several item structs
//every frame on an engine with not the best garbage collection

enum eDebugItemType {
	buttonCallback,
	touchableLabel, //make it fancy at least
	lineBreak,
}

function AABB(cx, cy, x, y, w, h) {
	//if(live_call(cx, cy, x, y, w, h)) then return live_result;
	gml_pragma("forceinline");
	return (
		cx >= x &&
		cx <= x + w &&
		cy >= y &&
		cy <= y + h
	);
}

//it's better to evaluate something twice than to generate arrays

function TapDebugItemGetWidth(item) {
	//if(live_call(item)) then return live_result;
	gml_pragma("forceinline");
	switch(item[1]) {
		case eDebugItemType.buttonCallback:
			return 60;
			break;
		case eDebugItemType.touchableLabel:
			return string_width(item[0]);
			break;
	}
}
function TapDebugItemGetHeight(item) {
	//if(live_call(item)) then return live_result;
	gml_pragma("forceinline");
	switch(item[1]) {
		case eDebugItemType.buttonCallback:
			return 20;
			break;
		case eDebugItemType.touchableLabel:
			return string_height(item[0]);
			break;
	}
}

//label, type, callback, additionalArgs, tapState

/*

tapstate:

0: nothing
1: hovered on
2: pressed

*/

//buttons give the callback the item index
//checkmarks give the callback the current bit
function TapDebug() constructor {
	offsetX = 5;
	offsetY = 5;
	minOffsetX = 5;
	minOffsetY = 5;
	sep = 64;
	spacing = 10;
	
	static ProcessCommands = function(commands) {
		//live_name = "TapDebug:ProcessCommands";
		//if (live_call(commands) && os_type == os_windows) return live_result;
		draw_set_font(f_jaxfont); //for calculating touchable label size
		var len = array_length(commands);
		
		var curOffsetX = offsetX;
		var curOffsetY = offsetY;
		for(var i = 0; i < len; i++) {
			var item = commands[i];
			var itemWidth = TapDebugItemGetWidth(item);
			var itemHeight = TapDebugItemGetHeight(item);
			
			//var worldX = curOffsetX * 
			
			var aabbResult = AABB(
				window_mouse_get_x(), window_mouse_get_y(),
				PosToScreenCoord(curOffsetX, false), PosToScreenCoord(curOffsetY, true),
				itemWidth * global.gameSurfaceScale, itemHeight * global.gameSurfaceScale
			);
			
			commands[@i][@4] = aabbResult; //checking if it's being hovered is 1st priority
			
			var mbHeld = mouse_check_button(mb_left);
			var mbReleased = mouse_check_button_released(mb_left);
			
			if(aabbResult) {
				if(mbHeld) {
					commands[@i][@4] = 2;
				} else if(mbReleased) {
					commands[@i][@4] = 0;
					commands[@i][@2](i);
				}
			}
			
			if((curOffsetY + itemHeight + spacing) > 240) {
				curOffsetY = minOffsetY;
				curOffsetX += sep;
			} else {
				curOffsetY += itemHeight + spacing;
			}
		}
	}
	static DrawCommands = function(commands) {
		//live_name = "TapDebug:DrawCommands";
		//if (live_call(commands) && os_type == os_windows) return live_result;
		draw_set_font(f_jaxfont);
		var len = array_length(commands);
		
		//draw_rectangle(window_mouse_get_x() / 3, window_mouse_get_y() / 3, window_mouse_get_x() / 3 + 10, window_mouse_get_y() / 3 + 10, true);
		
		var curOffsetX = offsetX;
		var curOffsetY = offsetY;
		for(var i = 0; i < len; i++) {
			var item = commands[i];
			var itemWidth = TapDebugItemGetWidth(item);
			var itemHeight = TapDebugItemGetHeight(item);
			/*var realX = PosToScreenCoord(curOffsetX, false);
			var realY = PosToScreenCoord(curOffsetY, true);*/
			
			switch(item[1]) {
				case eDebugItemType.buttonCallback:
					var highlight = item[4] == 1 ? $ffffff : 1;
					var posX = -itemWidth / 2;
					var posY = -itemHeight / 2;
					var scale = item[4] == 2 ? 0.9 : 1;
					mtxpush(matrix_build(curOffsetX + itemWidth / 2, curOffsetY + itemHeight / 2, 0, 0, 0, 0, scale, scale, scale));
					mtxset();
					draw_rectangle_color(posX, posY, posX+itemWidth, posY+itemHeight, $7f7f7f,$7f7f7f,$7f7f7f,$7f7f7f, false);
					draw_rectangle_color(posX, posY, posX+itemWidth, posY+itemHeight, 0,item[4] == 1 ? -1 : 1,0, highlight, true);
					TextAlignCenter();
					draw_text_transformed(0, 0, item[0], 0.5, 0.5, 0);
					TextAlignReset();
					mtxpop();
					mtxset();
					break;
			}
			
			if((curOffsetY + itemHeight + spacing) > 240) {
				curOffsetY = minOffsetY;
				curOffsetX += sep;
			} else {
				curOffsetY += itemHeight + spacing;
			}
		}
	}
}













