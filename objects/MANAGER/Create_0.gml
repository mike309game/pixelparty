//exception_unhandled_handler(function(ex){show_message("oh no");return 1;});
audio_group_load(agrp_sounds);

touchInputInfo = [
	[48-16,160-16, vk_up, false], //up
	[48-16,224-16, vk_down, false], //down
	[16-16,192-16, vk_left, false], //left
	[80-16,192-16, vk_right, false], //right
	
	[129-16,217-16, vk_shift, false], //select
	[193-16,216-16, vk_return, false], //start
	
	[272-16,224-16, eChar.z, false], //x
	[304-16,192-16, eChar.x, false], //o
	[240-16,192-16, eChar.x, false], //sqr
	[272-16,160-16, eChar.x, false], //tri
];

//save_setting_load()

window_set_size(global.gameScale*320,global.gameScale*240);
alarm_set(0,1);

depth = -15999;

fadeValue = 0; //value of fader
fadeSpeed = 0.04;

titles[0] = "";
titlesCount = 0;

#region funny title

var fp = file_text_open_read("text/gametitles.txt");
while(!file_text_eof(fp)) {
	titles[titlesCount++] = file_text_read_string(fp);file_text_readln(fp);
}
file_text_close(fp);

// this is mikes code dont blame me - jay
//penis -mike


/*
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
	ds_list_add(anim_title_table,"Ｌ　　　　　　　　Ｐ");
	ds_list_add(anim_title_table,"ＥＬ　　　　　　ＰＡ");
	ds_list_add(anim_title_table,"ＸＥＬ　　　　ＰＡＲ");
	ds_list_add(anim_title_table,"ＩＸＥＬ　　ＰＡＲＴ");
	ds_list_add(anim_title_table,"ＰＩＸＥＬＰＡＲＴＹ");
	ds_list_add(anim_title_table,"ＰＩＸＥＬＰＡＲＴＹ");
	ds_list_add(anim_title_table,"ＰＩＸＥＬＰＡＲＴＹ");
	ds_list_add(anim_title_table,"ＰＩＸＥＬＰＡＲＴＹ");
	ds_list_add(anim_title_table,"ＰＩＸＥＬＰＡＲＴＹ");
	ds_list_add(anim_title_table,"ＰＩＸＥＬＰＡＲＴＹ");
	ds_list_add(anim_title_table,"ＰＩＸＥＬＰＡＲＴＹ");
	ds_list_add(anim_title_table,"ＩＸＥＬ　　ＰＡＲＴ");
	ds_list_add(anim_title_table,"ＸＥＬ　　　　ＰＡＲ");
	ds_list_add(anim_title_table,"ＥＬ　　　　　　ＰＡ");
	ds_list_add(anim_title_table,"Ｌ　　　　　　　　Ｐ");
	ds_list_add(anim_title_table,"　　　　　　　　　　");
	ds_list_add(anim_title_table,"　　　　　　　　　　");
	ds_list_add(anim_title_table,"　　　　　　　　　　");
	ds_list_add(anim_title_table,"　　　　　　　　　　");
	ds_list_add(anim_title_table,"　　　　　　　　　　");
	ds_list_add(anim_title_table,"　　　　　　　　　　");
}

*/


if(irandom_range(0,255) == 63) {
	
	window_set_caption(titles[irandom_range(0,titlesCount-1)]);
} else {
	alarm_set(1,20);
}

#endregion

animatedTitle = false;
animatedTitleCounter = 0;

if(DEBUGMODE) { //if debug mode make my debug object
	instance_create_depth(0,0,0,o_mikedebug);
}

fader_uni = shader_get_uniform(sh_fader, "fadeammt");
animate = 0

level_sign_y = 240
level_sign_timer = 0
sign_do = true

audiogroupsLoaded = false;

//if ds_map_find_value(global.gameevent,string_copy(room_get_name(room),3,2)+"_e0") then sign_do = 0 //why is this in the create event