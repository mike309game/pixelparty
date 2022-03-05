//global.script_variables[? "item-Infinite"] = 0;

dexY /= 1.06; //divide til it reaches 0
dexBobY += dexBobAmt;

//choice easing

choiceEaseProgress = clamp(choiceEaseProgress + (choiceEaseIn ? 1 : -1), 0,60);

choiceX[0] = EaseOutBack(-100, 8 + 6, min(choiceEaseProgress + 10, 60) / 60);
choiceX[1] = EaseOutBack(-100, 8 + 6, min(choiceEaseProgress + 5, 60) / 60);
choiceX[2] = EaseOutBack(-100, 8 + 6, choiceEaseProgress / 60);

var interpreterExists = instance_exists(interpreter); //don't check it unecessary amounts of times

darkAlpha = clamp(darkAlpha + (interpreterExists ? 0.06 : -0.06), 0, 0.5);

switch(state) {
	case 0:
		if(!instance_exists(interpreter)) { //wait for dex's shop enter dialogue
			choiceEaseIn = true; //allow progressing the choice animation
			state++;
		}
		break;
	case 1:
		shopAnim = max(shopAnim - 1, -10); //hide shop items
		moneyBoardAnim = max(moneyBoardAnim - 1, 0); //hide money board
		if(choiceEaseProgress == 60) { //if choice animation is done
			var choiceCurrent = nmod(choiceSelected + (GetInputPressed(eInput.down, true) - GetInputPressed(eInput.up, true)), 3);
			if(choiceCurrent != choiceSelected) {
				choiceSelected = choiceCurrent;
				Sound(sx_shop_move);
			}
			if(GetInputPressed(eInput.x)) {
				Sound(sx_shop_select);
				switch(choiceSelected) {
					case 0: //if "buy"
						choiceEaseIn = false; //hide the choices
						state = 2; //go to purchase state
						break;
					case 1: //if "talk"
						interpreter = QuickInterpreter(talkSectionName); //make talk dialogue 
						state = 0; //state 0 hangs until the interpreter dies
						break;
					case 2:
						state = 99;
						Transition(global.script_variables[? "dex-ExitRoom"], global.script_variables[? "dex-ExitMarker"]);
						break;
				}
			}
		}
		break;
	case 2:
		shopAnim = min(shopAnim + 1, __SHOPANIMMAX); //show items
		moneyBoardAnim = min(moneyBoardAnim + 1, 30); //shop money board
		if(shopAnim == __SHOPANIMMAX) { //if shop anim finished
			var selectedItem = nmod(shopSelectedItem + (GetInputPressed(eInput.right, true) - GetInputPressed(eInput.left, true)), array_length(shopItems));
			if(selectedItem != shopSelectedItem) {
				shopSelectedItem = selectedItem;
				Sound(sx_shop_move);
			}
			if(GetInputPressed(eInput.interact)) {
				if(global.script_variables[? shopItems[shopSelectedItem][3]]) { //if item has already been bought
					Sound(sx_error); //screw off
				} else if(shopItems[shopSelectedItem][2] > global.script_variables[? "gold"]) { //trying to buy something too expensive
					Sound(sx_error);
					state = 99; //not enough gold timeout
					alarm[2] = 100; //timeout counter
				} else {
					Sound(sx_shop_select, 1.1);
					state = 3; //got enough money, go to confirmation state
				}
			}
		}
		if(GetInputPressed(eInput.o)) { //getting outta here
			choiceEaseIn = true; //ease in choices back
			state = 1; //goto choosing state
		}
		break;
	case 3:
		//since there is only two choices we can just xor it against wether left or right is pressed, no need for nmod
		purchaseConfirmationChoice ^= GetInputPressed(eInput.left) || GetInputPressed(eInput.right);
		if(GetInputPressed(eInput.interact)) {
			if(!purchaseConfirmationChoice) { //if choice was yes
				global.script_variables[? "gold"] -= shopItems[shopSelectedItem][2]; //deduct price (index 2) from manny's wallet
				global.script_variables[? shopItems[shopSelectedItem][3]] = true; //set purchase flag (index 3) as indicated by item def
				Sound(sx_shop_purchase);
				repeat(90) {
					instance_create_depth(((1 + (107 * (shopAnim / __SHOPANIMMAX)) * shopSelectedItem) + (shopAnim - __SHOPANIMMAX) * 6) + (104 / 2), (240 - (46 / 2)), -10, o_star);
				}
			}
			state = 2;
		}
		break;
	case 99:
		break;
}

//choiceEaseIn ^= keyboard_check_pressed(vk_space);