enum eOptionKind {
	normal
}

/*

option array:



*/

function MenuItem(_label, _isSlider = false, _sliderMin = 0, _sliderMax = 1, _sliderMultiplier = 1, _index = 0) constructor {
	label = _label;
	if(_isSlider) {
		isSlider = true;
		
		
		sliderValue = 0;
		sliderMin = _sliderMin;
		sliderMax = _sliderMax;
	}
	index = _index;
}

function Menu() constructor {
	optionStack = ds_queue_create();
	optionCurrent = 0;
	
	sliderChanging = false;
	
	canMove = true;
	
	static ProcessOptions = function(options) {
		var returnVal = -1;
		if(canMove) {
			var optionCurrentNew = nmod(optionCurrent + (GetInputPressed(eInput.down, true) - GetInputPressed(eInput.up, true)), argument_count);
			if(optionCurrentNew != optionCurrent) {
				Sound(sx_newmove);
				optionCurrent = optionCurrentNew;
			}
			if(GetInputPressed(eInput.interact)) {
				Sound(sx_newpress);
			}
			if(GetInputReleased(eInput.interact)) {
				returnVal = optionCurrent;
			}
		}
		for(var i = 0; i < argument_count; i++) {
			ds_queue_enqueue(optionStack,argument[i]);
			argument[i].index = i;
		}
		return returnVal;
	}
}

function DrawMenuSimple(menu, x, y) {
	with(menu) {
		var spacing = 0;
		draw_set_font(f_jaxfont);
		while(!ds_queue_empty(optionStack)) {
			var item = ds_queue_dequeue(optionStack);
			var btWidth = string_width(item.label);
			var btIndex = 0;
			if(item.index == optionCurrent && canMove) {
				draw_sprite(s_lilhand, 0, (x - 14) + cos(global.time / 5) * 3, spacing + 5);
				if(GetInput(eInput.interact)) {
					btIndex = 1;
				}
			}
			draw_sprite_stretched(s_pause_button, btIndex, x, y + spacing, btWidth + 4, 20);
			draw_set_colour(c_black);
			draw_set_alpha(0.2);
			draw_text(x + 3, y + spacing + 3, item.label);
			draw_set_alpha(1);
			draw_text(x + 2, y + spacing + 2, item.label);
			draw_set_colour(c_white);
			spacing += 21;
		}
	}
}