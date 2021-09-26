///Compiler for verbose scripts.

enum ScriptVariableType {
	string,
	number,
	global
}
enum ScriptFunctionType {
	setValue,
	addValue,
	subtractValue,
	andValue,
	orValue,
	xorValue,
	makeRgb,
	waitForFrames,
	wait,
	restartProcessing,
	jumpToLabel,
	jumpToSection,
	showMessage,
	endProcessing,
	text,
	textimmediate,
	returnToLastFunction,
	showdlg,
	hidedlg,
}

#macro scriptslocation "newscripts"

//create maps
global.script_sections = ds_map_create();
global.script_variables = ds_map_create();
global.script_labels = ds_map_create();

function ScriptSysMessage(arg) {
	gml_pragma("forceinline");
	show_debug_message("Script System: " + arg);
}


ScriptSysMessage("Compiling scripts");
#region String -> Enum lookup tables
var tsctypemap = ds_map_create();
tsctypemap[? "@"] = ScriptVariableType.string;
tsctypemap[? "#"] = ScriptVariableType.number;
tsctypemap[? "$"] = ScriptVariableType.global;

var tscfuncmaps = ds_map_create();
tscfuncmaps[? "set value"] = ScriptFunctionType.setValue;
tscfuncmaps[? "add value"] = ScriptFunctionType.addValue;
tscfuncmaps[? "subtract value"] = ScriptFunctionType.subtractValue;
tscfuncmaps[? "and value"] = ScriptFunctionType.andValue;
tscfuncmaps[? "or value"] = ScriptFunctionType.orValue;
tscfuncmaps[? "xor value"] = ScriptFunctionType.xorValue;
tscfuncmaps[? "wait for frames"] = ScriptFunctionType.waitForFrames;
tscfuncmaps[? "wait"] = ScriptFunctionType.wait;
tscfuncmaps[? "restart processing"] = ScriptFunctionType.restartProcessing;
tscfuncmaps[? "jump to label"] = ScriptFunctionType.jumpToLabel;
tscfuncmaps[? "jump function"] = ScriptFunctionType.jumpToSection;
tscfuncmaps[? "show message"] = ScriptFunctionType.showMessage;
tscfuncmaps[? "end processing"] = ScriptFunctionType.endProcessing;
tscfuncmaps[? "store rgb in value"] = ScriptFunctionType.makeRgb;
tscfuncmaps[? "text"] = ScriptFunctionType.text;
tscfuncmaps[? "text immediate"] = ScriptFunctionType.textimmediate;
tscfuncmaps[? "show dlgbox"] = ScriptFunctionType.showdlg;
tscfuncmaps[? "hide dlgbox"] = ScriptFunctionType.hidedlg;
#endregion
var fname = file_find_first(working_directory + "/" + scriptslocation + "/*.txt",fa_directory);
while(fname != "") { //compile all scripts in script directory
	ScriptSysMessage("Processing " + fname);
	//load file into buffer
	var fbuffer = buffer_load(working_directory + "/" + scriptslocation + "/" + fname);
	var fstring = buffer_read(fbuffer,buffer_text);
	buffer_delete(fbuffer); //free buffer
	var fpos = 0; //pointer in file TODO: does this respect utf8 )yes it seems to
	while(fpos <= string_length(fstring)) { //file reading loop
		var char = string_char_at(fstring,++fpos);
		//begin everything
		if(char == "$") { //found a global variable
			var globalname = "";
			while(string_ord_at(fstring,++fpos) != 61) { //stop when we're at a =
				globalname += string_char_at(fstring,fpos);
			}
			globalname = string_lower(globalname); //no case sensitvity to make things easier, or not idk
			var thevalue = "";
			var kind = tsctypemap[? string_char_at(fstring,++fpos)]; //get what kind of value we're setting to the global value
			if(kind == undefined) { //dumb fuck
				show_error("Script " + fname + " has defined global " + globalname + " but has not given it the type identifier.",1);
			}
			while(1) {
				char = string_char_at(fstring,++fpos);
				if(((kind != ScriptVariableType.string) && char == "\n") || ((kind == ScriptVariableType.string) && char == "@")) { //we want strings to have a newline but not numbers of course
					//fpos++;
					break;
				}
				thevalue += char;
			}
			switch(kind) { //decide what to store in the values map
				case ScriptVariableType.string:
					global.script_variables[? globalname] = thevalue;
					break;
				case ScriptVariableType.number:
					global.script_variables[? globalname] = real(thevalue);
					break;
				case ScriptVariableType.global:
					global.script_variables[? globalname] = global.script_variables[? thevalue] == undefined ? 0 : global.script_variables[? thevalue]; //if you're dumb make it 0
					//NOTE actually why the fuck would i handle this, the file order would have to be mega specific
					break;
			}
			char = string_char_at(fstring,fpos);
		}
		if(char == "|") { //begin processing a section
			var sectionname = "";
			while(string_ord_at(fstring,++fpos) != 10) {//not a newline
				sectionname += string_char_at(fstring,fpos);
			} //hopefully got the section name.
			if(sectionname == "EOF") { //end of file
				fname = file_find_next();
				break;
			}
			var section = ds_list_create(); //create list of commands to be filled
			var currentcommand = -1;
			while(1) {
				var islabelfunc = 0;
				var uhoh = 0;
				if(string_ord_at(fstring,++fpos) == $3C) { //begin function processing
					var currentarg = 0;
					var commandargs; //argument 0 will always be the function id
					var functionname = "";
					while(string_ord_at(fstring,++fpos) != $3E) { //if it's not a >
						functionname += string_char_at(fstring,fpos);
					}
					islabelfunc = functionname == "label";
					uhoh = !ds_map_exists(tscfuncmaps,functionname) && !islabelfunc;
					if(uhoh) {
						ScriptSysMessage(sectionname + " has unknown command " + functionname + ", skipping it");
					} else if(!islabelfunc){
						commandargs = ds_list_create();
						commandargs[|0] = tscfuncmaps[? functionname];
						currentcommand++;
					}
					char = string_ord_at(fstring,++fpos);
					if(char != $0A && !uhoh) {//if we've got arguments
						while(char != $0A) {//loop to store arguments
							var kind = tsctypemap[? string_char_at(fstring,fpos)]; //get what kind of value the argument is
							if(kind == undefined) { //dumb fuck
								show_error("Script " + fname + " in section " + sectionname + " has provided an argument with no type identifier to a command.",1);
							}
							var argumentvalue = "";
							while(string_ord_at(fstring,++fpos) != $3B) { //not an ;
								argumentvalue += string_char_at(fstring,fpos);
							}
							if(!islabelfunc) { //argument processing for normal commands
								switch(kind) {
									case ScriptVariableType.string:
										commandargs[|++currentarg] = argumentvalue;
										break;
									case ScriptVariableType.number:
										commandargs[|++currentarg] = real(argumentvalue);
										break;
									case ScriptVariableType.global:
										commandargs[|++currentarg] = "$" + argumentvalue;
										break;
								}
							} else if (++currentarg < 2){ //process label
								global.script_labels[? argumentvalue] = ds_list_create();
								global.script_labels[? argumentvalue][|0] = sectionname;
								global.script_labels[? argumentvalue][|1] = currentcommand;
							} else { //you gave the label too many arguments
								show_error("Script " + fname + " in section " + sectionname + " defined a label but it gave too many arguments.",1);
							}
							char = string_ord_at(fstring,++fpos); //get out of ;
						}
					}
					if(!islabelfunc && !uhoh) {
						section[|currentcommand] = commandargs;
					}
				}
				if(string_ord_at(fstring,fpos + 2) == $7C) { //if 1 characters from now is a |
					break;
				}
			}
			global.script_sections[? sectionname] = section;
		}
	}
}
ds_map_destroy(tsctypemap);
ds_map_destroy(tscfuncmaps);
//show_message("i'm outta here");