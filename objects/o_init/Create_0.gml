save_setting_load()

window_set_size(global.setting.scale*320,global.setting.scale*240)
alarm_set(0,1)

mus_fade = 1
titles[0] = ""

var fil = file_text_open_read("text/gametitles.txt")
for(var i = 1; i < 65; i++)
	{	
		titles[i] = file_text_read_string(fil)
		file_text_readln(fil)
	}
file_text_close(fil)

#region funny title

// this is mikes code dont blame me - jay
//penis -mike
anim_title_table = ds_list_create()
if(current_minute == 12 && current_hour == 11) { //there is no real significance to the tiem i just chose randomly
	ds_list_add(anim_title_table,"　　　　　ＡＲＴＹ．");
} else {
	ds_list_add(anim_title_table,"　　　　　　　　　　");
	ds_list_add(anim_title_table,"　　　　　　　　　Ｙ");
	ds_list_add(anim_title_table,"　　　　　　　　ＹＩ");
	ds_list_add(anim_title_table,"　　　　　　　ＹＩＳ");
	ds_list_add(anim_title_table,"　　　　　　ＹＩＳＩ");
	ds_list_add(anim_title_table,"　　　　　ＹＩＳＩＦ");
	ds_list_add(anim_title_table,"　　　　ＹＩＳＩＦＹ");
	ds_list_add(anim_title_table,"　　　ＹＩＳＩＦＹ　");
	ds_list_add(anim_title_table,"　　ＹＩＳＩＦＹ　Ｐ");
	ds_list_add(anim_title_table,"　ＹＩＳＩＦＹ　ＰＲ");
	ds_list_add(anim_title_table,"ＹＩＳＩＦＹ　ＰＲＥ");
	ds_list_add(anim_title_table,"ＩＳＩＦＹ　ＰＲＥＳ");
	ds_list_add(anim_title_table,"ＳＩＦＹ　ＰＲＥＳＥ");
	ds_list_add(anim_title_table,"ＩＦＹ　ＰＲＥＳＥＮ");
	ds_list_add(anim_title_table,"ＦＹ　ＰＲＥＳＥＮＴ");
	ds_list_add(anim_title_table,"Ｙ　ＰＲＥＳＥＮＴＳ");
	ds_list_add(anim_title_table,"　ＰＲＥＳＥＮＴＳ　");
	ds_list_add(anim_title_table,"ＰＲＥＳＥＮＴＳ　　");
	ds_list_add(anim_title_table,"ＲＥＳＥＮＴＳ　　　");
	ds_list_add(anim_title_table,"ＥＳＥＮＴＳ　　　　");
	ds_list_add(anim_title_table,"ＳＥＮＴＳ　　　　　");
	ds_list_add(anim_title_table,"ＥＮＴＳ　　　　　　");
	ds_list_add(anim_title_table,"ＮＴＳ　　　　　　　");
	ds_list_add(anim_title_table,"ＴＳ　　　　　　　　");
	ds_list_add(anim_title_table,"Ｓ　　　　　　　　　");
	ds_list_add(anim_title_table,"　　　　　　　　　　");
	ds_list_add(anim_title_table,"　　　　　　　　　　");
	ds_list_add(anim_title_table,"　　　　　　　　　　");
	ds_list_add(anim_title_table,"　　　　　　　　　　");
	ds_list_add(anim_title_table,"ＰＩＸＥＬ　　　　　");
	ds_list_add(anim_title_table,"ＰＩＸＥＬ　　　　　");
	ds_list_add(anim_title_table,"　　　　　ＰＡＲＴＹ");
	ds_list_add(anim_title_table,"　　　　　ＰＡＲＴＹ");
	ds_list_add(anim_title_table,"ＰＩＸＥＬ　　　　　");
	ds_list_add(anim_title_table,"ＰＩＸＥＬ　　　　　");
	ds_list_add(anim_title_table,"　　　　　ＰＡＲＴＹ");
	ds_list_add(anim_title_table,"　　　　　ＰＡＲＴＹ");
	ds_list_add(anim_title_table,"ＰＩＸＥＬ　　　　　");
	ds_list_add(anim_title_table,"ＰＩＸＥＬ　　　　　");
	ds_list_add(anim_title_table,"　　　　　ＰＡＲＴＹ");
	ds_list_add(anim_title_table,"　　　　　ＰＡＲＴＹ");
	ds_list_add(anim_title_table,"　　　　　　　　　　");
	ds_list_add(anim_title_table,"　　　　　　　　　　");
	ds_list_add(anim_title_table,"　　　　　　　　　　");
	ds_list_add(anim_title_table,"　　　　　　　　　　");
	ds_list_add(anim_title_table,"　　　　　　　　　　");
	ds_list_add(anim_title_table,"　　　　　　　　　　");
	ds_list_add(anim_title_table,"　　　　　　　　　　");
	ds_list_add(anim_title_table,"Ｐ　　　　　　　　Ｙ");
	ds_list_add(anim_title_table,"ＰＩ　　　　　　ＴＹ");
	ds_list_add(anim_title_table,"ＰＩＸ　　　　ＲＴＹ");
	ds_list_add(anim_title_table,"ＰＩＸＥ　　ＡＲＴＹ");
	ds_list_add(anim_title_table,"ＰＩＸＥＬＰＡＲＴＹ");
	ds_list_add(anim_title_table,"ＰＩＸＥＬＰＡＲＴＹ");
	ds_list_add(anim_title_table,"ＰＩＸＥＬＰＡＲＴＹ");
	ds_list_add(anim_title_table,"ＰＩＸＥＬＰＡＲＴＹ");
	ds_list_add(anim_title_table,"ＰＩＸＥＬＰＡＲＴＹ");
	ds_list_add(anim_title_table,"ＰＩＸＥＬＰＡＲＴＹ");
	ds_list_add(anim_title_table,"ＰＩＸＥＬＰＡＲＴＹ");
	ds_list_add(anim_title_table,"ＰＩＸＥ　　ＡＲＴＹ");
	ds_list_add(anim_title_table,"ＰＩＸ　　　　ＲＴＹ");
	ds_list_add(anim_title_table,"ＰＩ　　　　　　ＴＹ");
	ds_list_add(anim_title_table,"Ｐ　　　　　　　　Ｙ");
	ds_list_add(anim_title_table,"　　　　　　　　　　");
	ds_list_add(anim_title_table,"　　　　　　　　　　");
	ds_list_add(anim_title_table,"　　　　　　　　　　");
}
#endregion

titleloop = 0
titlecount = 0


// funny title pick
var dopick = irandom_range(1,8)

if dopick = irandom_range(1,8)
	{
		randomize()
		var titleran = irandom_range(1,65)
		window_set_caption(titles[titleran])
	} else { titleloop = 1 }


transalpha = 0
depth = -room_height

if(global.debug.debug_enabled) {
	instance_create_depth(0,0,0,o_mikedebug);
}

animate = 0

level_sign_y = 240
level_sign_timer = 0
sign_do = true

if ds_map_find_value(global.gameevent,string_copy(room_get_name(room),3,2)+"_e0") then sign_do = 0