//cleanup script system
var nextKey = 0;//ds_map_find_first(global.script_sections);
var dslLen = 0;//ds_list_size(global.script_sections[?nextKey]);
var i;
var list;
//clear section map
for(nextKey = ds_map_find_first(global.script_sections); nextKey != undefined; nextKey = ds_map_find_next(global.script_sections, nextKey)) {
	list = global.script_sections[?nextKey]; //this is the ds list of commands which each are a ds list
	dslLen = ds_list_size(list);
	for(i = 0; i < dslLen; i++) {
		ds_list_destroy(list[|i]);
	}
	ds_list_destroy(list);
}
ds_map_destroy(global.script_sections);

//clear labels map
for(nextKey = ds_map_find_first(global.script_labels); nextKey != undefined; nextKey = ds_map_find_next(global.script_labels, nextKey)) {
	ds_list_destroy(global.script_labels[?nextKey]);
}

ds_map_destroy(global.script_labels);

if(buffer_exists(global.inputBuffer)) {
	if(global.inputMode == 1) {
		var compressedBuffer = buffer_compress(global.inputBuffer,0,global.inputBufferSize);
		buffer_save(compressedBuffer, working_directory +
			"Pixel Party Recording " +
			string(current_year) + "-" + string(current_month) + "-" + string(current_day) + " " +
			string(current_hour) + "-" + string(current_minute) + "-" + string(current_second) + ".pxparecV2");
		buffer_delete(compressedBuffer);
	}
	buffer_delete(global.inputBuffer);
}

//clear rest
ds_map_destroy(global.script_compiled);
ds_map_destroy(global.script_variables);
ds_map_destroy(global.__scriptCommandMap);

audio_emitter_free(global.soundEmitter);
audio_emitter_free(global.musicEmitter);

delete global.player
delete global.vars
delete global.shop_start_tables
delete global.catparts
delete global.gates