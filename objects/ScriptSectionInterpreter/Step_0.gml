function ReadArgument() { //read an argument.
	gml_pragma("forceinline"); //yyc optimization
	var isstring = is_string(section[|funcpos][|currentarg]);
	if(isstring) {
		var len = string_length(section[|funcpos][|currentarg]);
		if(len > 1) {
			if(string_ord_at(section[|funcpos][|currentarg],1) == $24) { //is $
				var theval = string_lower(string_copy(section[|funcpos][|currentarg++],2,len-1));
				ValueExistenceFailsafe(0,theval,"using non existent value as an argument" + "POSITION" + string(funcpos)); //warning will output broken but you get the point
				return global.script_variables[? theval];
			}
		}
	}
	return section[|funcpos][|currentarg++];
}

function ValueExistenceFailsafe(value,valuename,operation) {
	gml_pragma("forceinline"); //yyc optimization
	var valisstring = is_string(value); //value provided is a string
	if(!ds_map_exists(global.script_variables,valuename)) {
		show_debug_message("tsc: " + sectionName + " tried " + operation + (valisstring ? " (string)" : " (number)") + string(value) + " with non-existent value " + valuename);
		global.script_variables[? valuename] = valisstring ? "" : int64(0);
	}
}

if(!halted) {
	while(funcpos < ds_list_size(section)) {
		if(!halted) {
			currentarg = 1;
			switch(section[|funcpos][|0]) {
				#region value handling
				case ScriptFunctionType.setValue: //set a global value
					var valuename = ReadArgument(); //name of the global
					global.script_variables[? valuename] = ReadArgument();
					break;
				case ScriptFunctionType.addValue: //adds to a global value
					var valuename = ReadArgument();
					var value = ReadArgument();
					ValueExistenceFailsafe(value,valuename,"adding");
					global.script_variables[? valuename] += value;
					break;
				case ScriptFunctionType.subtractValue: //subtracts from a global value
					var valuename = ReadArgument();
					var value = ReadArgument();
					ValueExistenceFailsafe(value,valuename,"subtracting");
					var valisstring = is_string(value); //value provided is a string
					var gbalisstring = is_string(global.script_variables[? valuename]); //global value refered is a string
					if((valisstring && !gbalisstring) || (!valisstring && gbalisstring)) {
						show_debug_message("tsc: " + sectionName + " tried subtracting " + (gbalisstring ? "string" : "number") + " value " + valuename + " by " + string(value));
						break;
					}
					global.script_variables[? valuename] -= value;
					break;
				case ScriptFunctionType.andValue: //bitwise AND (&)
					var valuename = ReadArgument();
					var value = ReadArgument();
					ValueExistenceFailsafe(value,valuename,"ANDing");
					if(is_string(value)) { //if you try ANDing a value by a string you deserve to have a crash
						show_debug_message("tsc: " + sectionName + " tried ANDing string value " + valuename + " by " + string(value));
						break;
					}
					global.script_variables[? valuename] &= value;
					break;
				case ScriptFunctionType.orValue: //bitwise OR (|)
					var valuename = ReadArgument();
					var value = ReadArgument();
					ValueExistenceFailsafe(value,valuename,"ORing");
					if(is_string(value)) { //if you try ORing a value by a string you deserve to have a crash
						show_debug_message("tsc: " + sectionName + " tried ORing string value " + valuename + " by " + string(value));
						break;
					}
					global.script_variables[? valuename] |= value;
					break;
				case ScriptFunctionType.xorValue: //bitwise XOR (^)
					var valuename = ReadArgument();
					var value = ReadArgument();
					ValueExistenceFailsafe(value,valuename,"XORing");
					if(is_string(value)) { //if you try XORing a value by a string you deserve to have a crash
						show_debug_message("tsc: " + sectionName + " tried XORing string value " + valuename + " by " + string(value));
						break;
					}
					global.script_variables[? valuename] ^= value;
					break;
				#endregion
				case ScriptFunctionType.waitForFrames: //wait for x frames
					var waitFrames = ReadArgument();
					with(myHandler) {
						handlerWaitFrames = waitFrames;
						event_user(0); //tell handler to process the wait command
					}
					break;
				case ScriptFunctionType.wait: //"wait for frames" but just for 1 frame
					alarm[0] = 1;
					halted = 1; //pause processing
					break;
				case ScriptFunctionType.restartProcessing:
					funcpos = -1;
					break;
				case ScriptFunctionType.jumpToLabel:
					var labelname = ReadArgument();
					section = global.script_sections[? global.script_labels[?labelname][|0]];
					funcpos = global.script_labels[?labelname][|1];
					break;
				case ScriptFunctionType.jumpToSection:
					var sectionname = ReadArgument();
					ds_stack_push(funcstack,sectionName,funcpos);
					sectionName = sectionname;
					section = global.script_sections[? sectionname];
					funcpos = -1;
					break;
				case ScriptFunctionType.showMessage: //show a generic gamemaker message, for testing purposes.
					show_message/*_async*/(ReadArgument());
					break;
				case ScriptFunctionType.endProcessing:
					show_debug_message("ended processing of tsc " + sectionName + ".");
					instance_destroy(id,1);
					break;
				case ScriptFunctionType.makeRgb:
					//if you put a string fuck you you're getting a crash dumbass
					var r = ReadArgument();
					var g = ReadArgument();
					var b = ReadArgument();
					
					var valuename = string_lower(ReadArgument());
					global.script_variables[? valuename] = ((b&$0ff)<<16)|((g&$0ff)<<8)|(r&$0ff);
					break;
				case ScriptFunctionType.text:
					/*var mytext = string(ReadArgument()); //i'll be kind and forgive you if you somehow put a number in there
					for(var i = 1; i <= string_length(mytext); i++) {
						ds_queue_enqueue(letterqueue,string_char_at(mytext,i));
					}
					event_perform(ev_alarm,1);
					alarm[1] = global.script_variables[? "textdelay"];
					halted = 1;*/
					var text = ReadArgument();
					with(myHandler) {
						handlerText = text;
						event_user(1);
						//show_debug_message(handlerText);
					}
					break;
				case ScriptFunctionType.returnToLastFunction:
					funcpos = ds_stack_pop(funcstack);
					sectionName = ds_stack_pop(funcstack);
					section = global.script_sections[? sectionName];
					break;
				case ScriptFunctionType.startTextProcessing:
					with(myHandler) {
						event_user(2);
					}
					break;
				case ScriptFunctionType.endTextProcessing:
					with(myHandler) {
						event_user(3);
					}
					break;
				default:
					break;
			}
			funcpos++;
			if(halted) {
				break;
			}
		}
	}
}