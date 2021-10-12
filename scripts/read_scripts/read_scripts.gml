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
	returnToLastFunction,
	startTextProcessing,
	endTextProcessing,
}

#macro scriptslocation "newscripts"

//create maps
global.script_sections = ds_map_create();
global.script_variables = ds_map_create();
global.script_labels = ds_map_create();
global.script_compiled = ds_map_create();

#region String -> Enum lookup tables
global.__scriptTypeMap = ds_map_create();
global.__scriptTypeMap[? "@"] = ScriptVariableType.string;
global.__scriptTypeMap[? "#"] = ScriptVariableType.number;
global.__scriptTypeMap[? "$"] = ScriptVariableType.global;

global.__scriptCommandMap = ds_map_create();
global.__scriptCommandMap[? "set value"] = ScriptFunctionType.setValue;
global.__scriptCommandMap[? "add value"] = ScriptFunctionType.addValue;
global.__scriptCommandMap[? "subtract value"] = ScriptFunctionType.subtractValue;
global.__scriptCommandMap[? "and value"] = ScriptFunctionType.andValue;
global.__scriptCommandMap[? "or value"] = ScriptFunctionType.orValue;
global.__scriptCommandMap[? "xor value"] = ScriptFunctionType.xorValue;
global.__scriptCommandMap[? "wait for frames"] = ScriptFunctionType.waitForFrames;
global.__scriptCommandMap[? "wait"] = ScriptFunctionType.wait;
global.__scriptCommandMap[? "restart processing"] = ScriptFunctionType.restartProcessing;
global.__scriptCommandMap[? "jump to label"] = ScriptFunctionType.jumpToLabel;
global.__scriptCommandMap[? "jump function"] = ScriptFunctionType.jumpToSection;
global.__scriptCommandMap[? "show message"] = ScriptFunctionType.showMessage;
global.__scriptCommandMap[? "end processing"] = ScriptFunctionType.endProcessing;
global.__scriptCommandMap[? "store rgb in value"] = ScriptFunctionType.makeRgb;
global.__scriptCommandMap[? "text"] = ScriptFunctionType.text;
global.__scriptCommandMap[? "start text processing"] = ScriptFunctionType.startTextProcessing;
global.__scriptCommandMap[? "end text processing"] = ScriptFunctionType.endTextProcessing;
#endregion

function ScriptSysMessage(arg) {
	gml_pragma("forceinline");
	show_debug_message("Script System: " + arg);
}

function ScriptSysWarning(arg) {
	gml_pragma("forceinline");
	ScriptSysMessage("Warning: " + arg);
}

ScriptSysMessage("Compiling scripts");

function CompileScriptReadable(fname) {
	//gml_pragma("forceinline"); //bad idea? VERY BAD IDEA LOL it'd infinitely recurse because of the needed check shit
	ScriptSysMessage("Processing " + fname);
	if(global.script_compiled[?fname] != undefined) {
		ScriptSysMessage(fname + " has already been processed.");
		exit;
	}
	var char; //this'll be both strings and ints
	var fbuffer = buffer_load(working_directory + "/" + scriptslocation + "/" + fname);
	var fstring = buffer_read(fbuffer,buffer_text);
	buffer_delete(fbuffer); //free buffer
	var fpos = 0; //pointer in file TODO: does this respect utf8 )yes it seems to
	if(/*string_lower*/(string_copy(fstring, 1, 6)) == "NEEDED") { //check if needed files exist then if they are compiled
		fpos = 7; //should be on the space between NEEDED and the first dependency
		var neededFname = "";
		//while(string_ord_at(fstring, ++fpos) != $0a) { //while character isn't a newline
		while(1) {
			char = string_char_at(fstring, ++fpos);
			if(char == " " || char == "\n") { //if space is found it means we got the needed fname
				if(global.script_compiled[?neededFname] == undefined /*&& neededFname != "\n" && neededFname != " "*/) {
					ScriptSysMessage(fname + " requires file " + neededFname + " which hasn't been processed yet, processing.");
					CompileScriptReadable(neededFname);
				}
				if(char == "\n") then break;
				neededFname = "";
			} else {
				neededFname += char;
			}
		}
	}
	while(fpos <= string_length(fstring)) { //file reading loop
		char = string_char_at(fstring,++fpos);
		//begin everything
		if(char == "$") { //found a global variable (outside section)
			var globalname = "";
			while(string_ord_at(fstring,++fpos) != 61) { //stop when we're at a =
				globalname += string_char_at(fstring,fpos);
			}
			globalname = string_lower(globalname); //no case sensitvity to make things easier, or not idk
			var thevalue = "";
			var kind = global.__scriptTypeMap[? string_char_at(fstring,++fpos)]; //get what kind of value we're setting to the global value
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
				//fname = file_find_next();
				//break; //break out of file processing, should go to the last line of this func
				
				//i'm actually not sure wether exit or break would be better but i got a feeling exit is better because
				//it'd immediately quit this function's scopes and not pop all context stacks n shit
				
				global.script_compiled[?fname] = 1; //the value doesn't matter, my code checks wether the key just exists
				ScriptSysMessage("Done processing " + fname);
				exit; //exit out of script compile function
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
					uhoh = !ds_map_exists(global.__scriptCommandMap,functionname) && !islabelfunc;
					if(uhoh) {
						ScriptSysMessage(sectionname + " has unknown command " + functionname + ", skipping it");
					} else if(!islabelfunc){
						commandargs = ds_list_create();
						commandargs[|0] = global.__scriptCommandMap[? functionname];
						currentcommand++;
					}
					char = string_ord_at(fstring,++fpos);
					if(char != $0A && !uhoh) {//if we've got arguments
						while(char != $0A) {//loop to store arguments
							var kind = global.__scriptTypeMap[? string_char_at(fstring,fpos)]; //get what kind of value the argument is
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

var char;
var fname = file_find_first(working_directory + "/" + scriptslocation + "/*.txt",fa_directory);
while(fname != "") { //compile all scripts in script directory
	CompileScriptReadable(fname);
	fname = file_find_next();
}
//show_message("i'm outta here");