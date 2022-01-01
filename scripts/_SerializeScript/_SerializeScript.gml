/*var boolsizetest = buffer_create(1,buffer_grow,1);
buffer_write(boolsizetest,buffer_bool,true);
buffer_write(boolsizetest,buffer_bool,true);
buffer_write(boolsizetest,buffer_bool,true);
buffer_write(boolsizetest,buffer_bool,false);
buffer_write(boolsizetest,buffer_bool,true);
buffer_write(boolsizetest,buffer_bool,false);
buffer_write(boolsizetest,buffer_bool,true);
buffer_write(boolsizetest,buffer_bool,false);
buffer_write(boolsizetest,buffer_bool,false);
buffer_write(boolsizetest,buffer_bool,false);
var file = get_save_filename_ext("doodoo|*.*", "", working_directory, "yeah");
if(file != "") {
	buffer_save(boolsizetest,file);
}
buffer_delete(boolsizetest);*/

function SerializeScript(){
	var file = get_save_filename_ext("script buffer|*.bos", "", working_directory, "Save script buffer");
	if(file == "") {
		exit;
	}
	var buffer = buffer_create(1,buffer_grow,1);
	
	var nextKey = 0;
	var i;
	var j;
	
	//Sections
	buffer_write(buffer,buffer_u16,ds_map_size(global.script_sections)); //write num of sections
	for(nextKey = ds_map_find_first(global.script_sections); nextKey != undefined; nextKey = ds_map_find_next(global.script_sections, nextKey)) {
		buffer_write(buffer,buffer_string,nextKey); //write section name
		var sectionCommands = global.script_sections[?nextKey];
		var sectionLen = ds_list_size(sectionCommands);
		buffer_write(buffer,buffer_u32,sectionLen); //write num of commands
		for(i = 0; i < sectionLen; i++) {
			var commandArgs = sectionCommands[|i];
			var commandArgsLen = ds_list_size(commandArgs);
			buffer_write(buffer,buffer_u8,commandArgsLen); //write num of args
			for(j = 0; j < commandArgsLen; j++) {
				var arg = commandArgs[|j];
				var isString = is_string(arg);
				buffer_write(buffer,buffer_bool,isString); //write if arg is string
				buffer_write(buffer,isString ? buffer_string : buffer_f64,arg); //write arg
			}
		}
	}
	
	//Labels
	buffer_write(buffer,buffer_u16,ds_map_size(global.script_labels)); //write num of labels
	for(nextKey = ds_map_find_first(global.script_labels); nextKey != undefined; nextKey = ds_map_find_next(global.script_labels, nextKey)) {
		var labelInfo = global.script_labels[?nextKey];
		buffer_write(buffer,buffer_string,nextKey); //write label name
		buffer_write(buffer,buffer_string,labelInfo[|0]); //write section name label resides in
		buffer_write(buffer,buffer_u32,labelInfo[|1]); //write cmd index label points at
	}
	
	//Values
	buffer_write(buffer,buffer_u16,ds_map_size(global.script_variables)); //write num of default values
	for(nextKey = ds_map_find_first(global.script_variables); nextKey != undefined; nextKey = ds_map_find_next(global.script_variables, nextKey)) {
		var value = global.script_variables[?nextKey];
		var valueIsString = is_string(value);
		buffer_write(buffer,buffer_string,nextKey); //write value name
		buffer_write(buffer,buffer_bool,valueIsString); //write if value is string
		buffer_write(buffer,valueIsString ? buffer_string : buffer_f64,value); //write value
	}
	
	
	var compressed = buffer_compress(buffer,0,buffer_tell(buffer));
	buffer_save(compressed,file);
	buffer_delete(compressed);
	buffer_delete(buffer);
}