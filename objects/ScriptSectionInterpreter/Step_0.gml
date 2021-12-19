function ReadArgument(expect) { //read an argument.
	gml_pragma("forceinline"); //yyc optimization
	/*var isstring = is_string(section[|funcpos][|currentarg]);
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
	return section[|funcpos][|currentarg++];*/
	var arg = section[|funcpos][|currentarg++];
	if(is_string(arg))
		return CheckForRef(arg,expect);
	else
		return arg;
}

/*function ValueExistenceFailsafe(value,valuename,operation) {
	gml_pragma("forceinline"); //yyc optimization
	var valisstring = is_string(value); //value provided is a string
	if(!ds_map_exists(global.script_variables,valuename)) {
		show_debug_message("tsc: " + sectionName + " tried " + operation + (valisstring ? " (string)" : " (number)") + string(value) + " with non-existent value " + valuename);
		global.script_variables[? valuename] = valisstring ? "" : int64(0);
	}
}*/



myHandler.Update();
if(!halted) {
	while(funcpos < ds_list_size(section)) {
		if(!halted) {
			currentarg = 1;
			switch(section[|funcpos][|0]) {
				#region Math
				case ScriptFunctionType.setValue: //set a global value
					var valuename = ReadArgument(eValueExpect.string); //name of the global NOTE: could be a number if whoever coded this is a retard
					global.script_variables[? valuename] = ReadArgument(eValueExpect.number); //more likely than not a number
					break;
				case ScriptFunctionType.addValue: //adds to a global value
					var valuename = ReadArgument(eValueExpect.string);
					var value = ReadArgument(eValueExpect.number); //most likely number
					global.script_variables[? valuename] += value;
					break;
				case ScriptFunctionType.subtractValue: //subtracts from a global value
					var valuename = ReadArgument(eValueExpect.string);
					var value = ReadArgument(eValueExpect.number); //has to be number
					//TODO: add type discrepancy checker i'm too lazy to test these changes
					/*var valisstring = is_string(value); //value provided is a string
					var gbalisstring = is_string(global.script_variables[? valuename]); //global value refered is a string
					if((valisstring && !gbalisstring) || (!valisstring && gbalisstring)) {
						show_debug_message("tsc: " + sectionName + " tried subtracting " + (gbalisstring ? "string" : "number") + " value " + valuename + " by " + string(value));
						break;
					}*/
					global.script_variables[? valuename] -= value;
					break;
				case ScriptFunctionType.multiplyValue: //multiply value
					var valuename = ReadArgument(eValueExpect.string);
					var value = ReadArgument(eValueExpect.number); //has to be number
					global.script_variables[? valuename] *= value;
					break;
				case ScriptFunctionType.divideValue: //divide value
					var valuename = ReadArgument(eValueExpect.string);
					var value = ReadArgument(eValueExpect.number); //has to be number
					global.script_variables[? valuename] /= value;
					break;
				case ScriptFunctionType.moduloValue: //modulate value
					var valuename = ReadArgument(eValueExpect.string);
					var value = ReadArgument(eValueExpect.number); //has to be number
					global.script_variables[? valuename] %= value;
					break;
				case ScriptFunctionType.powValue: //raise value
					var valuename = ReadArgument(eValueExpect.string);
					var value = ReadArgument(eValueExpect.number); //has to be number
					global.script_variables[? valuename] = power(global.script_variables[? valuename],value);
					break;
				case ScriptFunctionType.notValue: //flip bits
					var valuename = ReadArgument(eValueExpect.string);
					global.script_variables[? valuename] = ~global.script_variables[? valuename];
					break;
				case ScriptFunctionType.andValue: //bitwise AND (&)
					var valuename = ReadArgument(eValueExpect.string);
					var value = ReadArgument(eValueExpect.number); //has to be number
					/*if(is_string(value)) { //if you try ANDing a value by a string you deserve to have a crash
						show_debug_message("tsc: " + sectionName + " tried ANDing string value " + valuename + " by " + string(value));
						break;
					}*/
					global.script_variables[? valuename] &= value;
					break;
				case ScriptFunctionType.orValue: //bitwise OR (|)
					var valuename = ReadArgument(eValueExpect.string);
					var value = ReadArgument(eValueExpect.number);
					/*if(is_string(value)) { //if you try ORing a value by a string you deserve to have a crash
						show_debug_message("tsc: " + sectionName + " tried ORing string value " + valuename + " by " + string(value));
						break;
					}*/
					global.script_variables[? valuename] |= value;
					break;
				case ScriptFunctionType.xorValue: //bitwise XOR (^)
					var valuename = ReadArgument(eValueExpect.string);
					var value = ReadArgument(eValueExpect.number);
					global.script_variables[? valuename] ^= value;
					break;
				case ScriptFunctionType.shiftValueRight: //>>
					var valuename = ReadArgument(eValueExpect.string);
					var bits = ReadArgument(eValueExpect.number); //has to be number
					global.script_variables[? valuename] = global.script_variables[? valuename] >> bits;
					break;
				case ScriptFunctionType.shiftValueLeft: //<<
					var valuename = ReadArgument(eValueExpect.string);
					var bits = ReadArgument(eValueExpect.number); //has to be number
					global.script_variables[? valuename] = global.script_variables[? valuename] << bits;
					break;
				#endregion
				case ScriptFunctionType.waitForFrames: //wait for x frames
					/*with(myHandler) {
						handlerWaitFrames = waitFrames;
						event_user(0); //tell handler to process the wait command
					}*/
					myHandler.HandleWaitCommand(ReadArgument(eValueExpect.number));
					break;
				case ScriptFunctionType.restartProcessing:
					funcpos = -1;
					break;
				case ScriptFunctionType.jumpToLabel:
					var labelname = ReadArgument(eValueExpect.string);
					section = global.script_sections[? global.script_labels[?labelname][|0]];
					funcpos = global.script_labels[?labelname][|1];
					break;
				case ScriptFunctionType.jumpToSection:
					var sectionname = ReadArgument(eValueExpect.string);
					ds_stack_push(funcstack,sectionName,funcpos);
					sectionName = sectionname;
					section = global.script_sections[? sectionname];
					funcpos = -1;
					break;
				case ScriptFunctionType.showMessage: //show a generic gamemaker message, for testing purposes.
					show_message/*_async*/(ReadArgument(eValueExpect.string));
					break;
				case ScriptFunctionType.endProcessing:
					ScriptSysMessage("Ended processing of" + sectionName);
					with(myCaller) {
						alarm[0] = 1; //reenable caller interaction in 1 frame
					}
					instance_destroy(id,1);
					break;
				case ScriptFunctionType.makeRgb:
					//if you put a string fuck you you're getting a crash dumbass
					var r = ReadArgument(eValueExpect.number);
					var g = ReadArgument(eValueExpect.number);
					var b = ReadArgument(eValueExpect.number);
					
					var valuename = string_lower(ReadArgument(eValueExpect.string));
					global.script_variables[? valuename] = ((b&$0ff)<<16)|((g&$0ff)<<8)|(r&$0ff);
					break;
				case ScriptFunctionType.text:
					myHandler.HandleTextCall(ReadArgument(eValueExpect.string));
					/*with(myHandler) {
						handlerText = text;
						event_user(1);
						//show_debug_message(handlerText);
					}*/
					break;
				case ScriptFunctionType.returnToLastFunction:
					funcpos = ds_stack_pop(funcstack);
					sectionName = ds_stack_pop(funcstack);
					section = global.script_sections[? sectionName];
					break;
				case ScriptFunctionType.startTextProcessing:
					myHandler.HandleTextProcessingToggle(true);
					break;
				case ScriptFunctionType.endTextProcessing:
					myHandler.HandleTextProcessingToggle(false);
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