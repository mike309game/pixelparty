var dexRealY = dexY - dexBobY;

//draw shop bg
draw_sprite(s_shop_bg,0,0,0);

//draw dex body
draw_sprite(s_shop_dex, 0, 0, dexRealY);

//draw dex coin toss region
draw_sprite(s_shop_dex_flip, instance_exists(o_shopcoin), 0, dexRealY);

//draw desk
draw_sprite(s_shop_desk, 0, 0, 0);

//draw dex arm
draw_sprite(s_shop_dex, 1, 0, dexY); //the arm does not bob

//draw dex ear
draw_sprite(s_shop_dex, 2, 0, dexRealY);

//draw choices

draw_set_font(f_jaxfont);

for(var i = 0; i < 3; i++) {
	var text;
	switch(i) {
		case 0:
			text = "Buy";
			break;
		case 1:
			text = "Talk";
			break;
		case 2:
			text = "Exit";
			break;
	}
	DrawTextSimpleShadow(choiceX[i], 100 + 16 * i, text);
	if(choiceSelected == i &&  choiceEaseProgress == 60) { //if anim is done, draw lil hand
		draw_sprite_ext(s_lilhand, 0, 2, 100 + 5 + 16 * i, 1, 1, 0, c_white, 1);
	}
}

//draw purchasable items

draw_set_font(f_shop);
var itemsLen = array_length(shopItems);
for(var i = 0; i < itemsLen; i++) {
	var item = shopItems[i];
	var xx = (1 + (107 * (shopAnim / __SHOPANIMMAX)) * i) + (shopAnim - __SHOPANIMMAX) * 6; //messy constant math to position this
	draw_sprite(s_shop_item, 0, xx, 240 - 47); //image index 0 is the base graphic
	if(shopSelectedItem == i) { //if we're drawing the selected item
		if(state == 99) { //if in not enougn money timeout
			draw_sprite(s_shop_item, 2 + ((global.time / 20) % 2), xx, 240 - 47); //flash not enough money graphic (index 2 is nothing, index 3 is the graphic)
			continue; //cancel processing this item, go to the next one already
		}
		draw_sprite(s_shop_item, 4, xx + ((104 / 2) - 11), 160); //draw the selection hand (image index 4)
	}
	if(global.script_variables[? item[3]]) { //if this has been bought already
		DrawTextSimpleShadow(xx + 8, 240 - 31, "SOLD OUT !!!");
		continue; //no need to process the rest
	}
	draw_sprite(s_shop_item, 1, xx, 240 - 47); //draw the portrait background and coin graphic
	draw_sprite(item[1], 0, xx+4, (240-47) + 4); //draw the item's portrait (index 1 is a sprite index)
	DrawTextSimpleShadow(xx + 41, 240 - 42, item[0]); //draw the item's name (index 0 is a string containing the name)
	DrawTextSimpleShadow(xx + 65, 240 - 22, string(item[2])); //draw item's price (index 2)
}

//draw money board
var moneyBoardY = EaseOutCubic(-64, 0, moneyBoardAnim / 30);

draw_sprite(s_shop_moneyboard, 0, 2, moneyBoardY);
DrawTextSimpleShadow(26, moneyBoardY + 42, string(global.script_variables[? "gold"]));

//draw purchase confirmation graphic

if(state == 3) {
	draw_sprite(s_shop_purchaseconfirmation, 0, 0, 0); //graphic
	draw_sprite(s_shop_purchaseconfirmation, 1, purchaseConfirmationChoice ? 234 : 183, 85); //arrow graphic is image index 1 of this sprite
}


DrawTextSimpleShadow(0,0,string(choiceEaseProgress));

//draw black fade when talking to dex

draw_set_alpha(darkAlpha);
draw_rectangle_colour(0,0,320,240,0,0,0,0,false);
draw_set_alpha(1);