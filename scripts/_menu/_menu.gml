enum eOptionKind {
	normal
}

/*

option array:



*/

function MenuItem(_label, _isSlider = false, _sliderValue = 0, _sliderMin = 0, _sliderMax = 1, _sliderMultiplier = 1, _index = 0) constructor {
	label = _label;
	isSlider = _isSlider
	if(_isSlider) { //don't add unecessary slider values unless it IS a slider
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
		if(canMove) { //if player can move the options
			if(sliderChanging) { //if we're changing a slider
				var item = argument[optionCurrent]; //get the slider's item's struct
				item.sliderValue = clamp(
					item.sliderValue + (
						GetInput(eInput.right, true) - GetInput(eInput.left, true)
					) * item.sliderMultiplier,
					item.sliderMin, item.sliderMax
				); //change slider value
				if(GetInputReleased(eInput.interact)) { //if we release the interact button
					Sound(sx_newpress);
					sliderChanging = false; //stop changing the slider
				}
			} else { //if we're not changing a slider
				var optionCurrentNew = nmod(optionCurrent + (GetInputPressed(eInput.down, true) - GetInputPressed(eInput.up, true)), argument_count); //calculate selected option
				if(optionCurrentNew != optionCurrent) { //if we moved
					Sound(sx_pause_move); //play the move sound
					optionCurrent = optionCurrentNew; //change the value
				}
				if(GetInputPressed(eInput.interact)) { //if we PRESSED
					Sound(sx_newpress); //play a sound
				}
				if(GetInputReleased(eInput.interact)) { //if we RELEASED then actually do things
					if(argument[optionCurrent].isSlider) { //if we pressed a slider
						sliderChanging = true; //tell it to start slider behaviour
					} else { //if we pressed a normal button
						returnVal = optionCurrent; //make return value the option selected
					}
					Sound(sx_title_menu_select); //play a sound
				}
			}
		}
		//add the options to the queue, so they are drawn later
		for(var i = 0; i < argument_count; i++) {
			ds_queue_enqueue(optionStack,argument[i]);
			argument[i].index = i;
		}
		return returnVal;
	}
}

function DrawMenuSimple(menu, x, y) {
	var oldAlpha = draw_get_alpha();
	with(menu) {
		var spacing = 0;
		draw_set_font(f_jaxfont);
		while(!ds_queue_empty(optionStack)) { //while we still have options
			var item = ds_queue_dequeue(optionStack); //dequeue option, get its struct
			var btWidth = string_width(item.label); //store length of button
			var btIndex = 0; //button sprite image index (for showing if it's pressed)
			if(item.index == optionCurrent && canMove && !sliderChanging) { //if the option being drawn is the chosen one, we can move in the menu and we're not changing a slider
				draw_sprite(s_lilhand, 0, (x - 14) + cos(global.time / 5) * 3, y + spacing + 5); //draw hand sprite pointing at button
				if(GetInput(eInput.interact)) { //if we're pressing the interact button,
					btIndex = 1; //change the button's sprite index to the pressed index
				}
			}
			if(item.isSlider) { //if the option is a slider
				draw_sprite_stretched(s_menuslider,0,x + 100 + 4, y + spacing + 5, 102, 9); //draw the slider bg
				var xx = x + 100 + 4 + (100 * (item.sliderValue / item.sliderMax)); //position the slider x
				var yy = y + spacing + 5; //position the slider y
				draw_sprite(s_menuslider,1,xx,yy); //draw the little slider caret thingy
				if(sliderChanging && item.index == optionCurrent) { //if we're changing this slider
					gpu_set_fog(true, c_white, 0, 1); //enable fog to make the sprite white
					draw_sprite_ext(s_menuslider,1,xx,yy,1,1,0,c_white,(abs(sin(global.time/20)) * 0.5) * oldAlpha); //draw the caret but white and transparent
					gpu_set_fog(false, c_white, 0, 1); //disable fog
				}
			}
			draw_sprite_stretched(s_pause_button, btIndex, x, y + spacing, btWidth + 4, 20); //draw the button
			draw_set_colour(c_black);
			draw_set_alpha(0.2 * oldAlpha);
			draw_text(x + 3, y + spacing + 3, item.label);
			draw_set_alpha(1 * oldAlpha);
			draw_text(x + 2, y + spacing + 2, item.label);
			draw_set_colour(c_white);
			spacing += 21;
		}
	}
}

function PushSimpleOptions(menu) {
	//these are assigned to values so to be able to retrieve their values
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
		SaveVolumeSettings(); //secretly save sound settings because yes
	}
	return returnVal;
}