/*

NOTE TO SELF:
ADD 3+ ITEM SCROLLING
NOTE TO SELF:
ADD 3+ ITEM SCROLLING
NOTE TO SELF:
ADD 3+ ITEM SCROLLING
NOTE TO SELF:
ADD 3+ ITEM SCROLLING
NOTE TO SELF:
ADD 3+ ITEM SCROLLING
NOTE TO SELF:
ADD 3+ ITEM SCROLLING
NOTE TO SELF:
ADD 3+ ITEM SCROLLING
NOTE TO SELF:
ADD 3+ ITEM SCROLLING
NOTE TO SELF:
ADD 3+ ITEM SCROLLING
NOTE TO SELF:
ADD 3+ ITEM SCROLLING
NOTE TO SELF:
ADD 3+ ITEM SCROLLING
NOTE TO SELF:
ADD 3+ ITEM SCROLLING
NOTE TO SELF:
ADD 3+ ITEM SCROLLING

*/

NegateGameFlag(eFlag.playerCanMove); //disable pause menu

interpreter = QuickInterpreter(startSectionName);

darkAlpha = 0.5;

dexY = 16; //goes up shortly after object creation
dexBobY = 0; //the waving up n down
dexBobAmt = 0.03;

alarm[1] = 25; //dex bob dir change alarm

/*
state 0: waiting for intro script to end (aka nothing)
state 1: allow option choosing
state 2: choosing what 2 buy
*/
state = 0;

//choiceEaseFunc = EaseOutBack;

//show_message("no fucking way");

choiceSelected = 0;
choiceX = array_create(3, -100);

choiceEaseProgress = 0; //0-60
choiceEaseIn = false;

#macro __SHOPANIMMAX (20)
shopAnim = -10; //-10 - 40
shopSelectedItem = 0;
moneyBoardAnim = 0; //0 - 30

purchaseConfirmationChoice = 0;

/*

SHOPITEMS ARRAY FORMAT

name, sprite, price, flagcheck

*/

shopItems = [
	["Wheat", s_shop_item_wheat, 0, "WHEATTEST"],
	["Item name here", s_shop_item_temp, 69, "Flag name here"],
	["Item name here", s_shop_item_temp, 69, "Flag name here"],
]

noDex = false

alarm[3] = 300;

if room = r_l2_shop && !global.script_variables[? "level2-dexMission"]
	{
		noDex = true
	}
