enum eOptionKind {
	normal
}

/*

option array:



*/

function MenuItem(_label, _isSlider = false, _sliderValue = 0, _sliderMin = 0, _sliderMax = 1, _sliderMultiplier = 1, _index = 0) constructor {
	label = _label;
	isSlider = _isSlider
	if(_isSlider) {		
		sliderValue = _sliderValue;
		sliderMin = _sliderMin;
		sliderMax = _sliderMax;
		sliderMultiplier = _sliderMultiplier;
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
			if(sliderChanging) {
				var item = argument[optionCurrent];
				item.sliderValue = clamp(item.sliderValue + (GetInput(eInput.right, true) - GetInput(eInput.left, true)) * item.sliderMultiplier, item.sliderMin, item.sliderMax);
				if(GetInputReleased(eInput.interact)) {
					sliderChanging = false;
				}
			} else {
				var optionCurrentNew = nmod(optionCurrent + (GetInputPressed(eInput.down, true) - GetInputPressed(eInput.up, true)), argument_count);
				if(optionCurrentNew != optionCurrent) {
					Sound(sx_pause_move);
					optionCurrent = optionCurrentNew;
				}
				if(GetInputPressed(eInput.interact)) {
					Sound(sx_newpress);
				}
				if(GetInputReleased(eInput.interact)) {
					if(argument[optionCurrent].isSlider) {
						sliderChanging = true;
					} else {
						returnVal = optionCurrent;
					}
					Sound(sx_title_menu_select);
				}
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
			if(item.index == optionCurrent && canMove && !sliderChanging) {
				draw_sprite(s_lilhand, 0, (x - 14) + cos(global.time / 5) * 3, y + spacing + 5);
				if(GetInput(eInput.interact)) {
					btIndex = 1;
				}
			}
			if(item.isSlider) {
				draw_sprite_stretched(s_menuslider,0,x + 100 + 4, y + spacing + 5, 102, 9);
				var xx = x + 100 + 4 + (100 * (item.sliderValue / item.sliderMax));
				var yy = y + spacing + 5;
				draw_sprite(s_menuslider,1,xx,yy);
				if(sliderChanging && item.index == optionCurrent) {
					gpu_set_fog(true, c_white, 0, 1);
					draw_sprite_ext(s_menuslider,1,xx,yy,1,1,0,c_white,abs(sin(global.time/20)) * 0.5);
					gpu_set_fog(false, c_white, 0, 1);
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

function PushSimpleOptions(menu) {
	var masterVolumeItem = new MenuItem("Master Volume",true,global.masterVolume*100,0,100);
	var musicVolumeItem = new MenuItem("Music Volume",true,global.musicMasterVolume*100,0,100);
	var soundVolumeItem = new MenuItem("Sound Volume",true,global.soundMasterVolume*100,0,100);
	
	var returnVal = menu.ProcessOptions(
		masterVolumeItem,
		musicVolumeItem,
		soundVolumeItem,
		new MenuItem("Return")
	);
	
	global.masterVolume = masterVolumeItem.sliderValue / 100;
	global.musicMasterVolume = musicVolumeItem.sliderValue / 100;
	global.soundMasterVolume = soundVolumeItem.sliderValue / 100;
	if(returnVal == 3) {
		SaveVolumeSettings();
	}
	return returnVal;
}