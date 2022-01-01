///////////////////////////////////////////////////////////Bad Opcode Scripting\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

enum ScriptVariableType {
	string,
	number,
	global
}
enum eScriptFunction {
	setValue,
	addValue,
	subtractValue,
	multiplyValue,
	divideValue,
	moduloValue,
	powValue,
	
	branchTrue,
	branchFalse,
	branchEqual,
	branchNotEqual,
	
	notValue,
	andValue,
	orValue,
	xorValue,
	shiftValueRight,
	shiftValueLeft,
	
	makeRgb,
	number2string,
	string2num,
	num2string,
	string2asset,
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
	toggleNpcAnimate,
	setFacepic1,
	setFacepic2,
	setNamelabel1,
	setNamelabel2,
	toggleFacepic1,
	toggleFacepic2
}

enum eValueExpect {
	number,
	string
}

enum eErrorCode {
	success,
	valueNotFound,
	terminatorNotFound,
}

/*var test = "this is a test to see how string length works";
for(var i = 1; i <= string_length(test); i++) {
	show_debug_message(string_char_at(test, i));
}
game_end();*/

/*var test = "";
var test2 = "";

test = test2 = "EURHWEURHUWH";
show_message(test);
show_message(test2);*/

function ScriptSysMessage(arg) {
	gml_pragma("forceinline");
	show_debug_message("[Script System] " + arg);
}

function ScriptSysWarning(arg) {
	gml_pragma("forceinline");
	ScriptSysMessage("[WARNING] " + arg);
}

#macro scriptslocation "newscripts"

//error checking
global.errorCode = eErrorCode.success;

//create maps
global.script_sections = ds_map_create();
global.script_variables = ds_map_create();
global.script_labels = ds_map_create();
global.script_compiled = ds_map_create();

///Compiler for verbose scripts.

#region String -> Enum lookup tables

global.__scriptCommandMap = ds_map_create();
//Regular math
global.__scriptCommandMap[? "set"] = eScriptFunction.setValue;
global.__scriptCommandMap[? "add"] = eScriptFunction.addValue;
global.__scriptCommandMap[? "subtract"] = eScriptFunction.subtractValue;
global.__scriptCommandMap[? "multiply"] = eScriptFunction.multiplyValue;
global.__scriptCommandMap[? "divide"] = eScriptFunction.divideValue;
global.__scriptCommandMap[? "modulo"] = eScriptFunction.moduloValue;
global.__scriptCommandMap[? "pow"] = eScriptFunction.powValue;

//Branching
global.__scriptCommandMap[? "if"] = eScriptFunction.branchTrue;
global.__scriptCommandMap[? "ifn"] = eScriptFunction.branchFalse;
global.__scriptCommandMap[? "ifeq"] = eScriptFunction.branchEqual;
global.__scriptCommandMap[? "ifneq"] = eScriptFunction.branchNotEqual;

//Bit math
global.__scriptCommandMap[? "not"] = eScriptFunction.notValue;
global.__scriptCommandMap[? "and"] = eScriptFunction.andValue;
global.__scriptCommandMap[? "or"] = eScriptFunction.orValue;
global.__scriptCommandMap[? "xor"] = eScriptFunction.xorValue;
global.__scriptCommandMap[? "shiftR"] = eScriptFunction.shiftValueRight;
global.__scriptCommandMap[? "shiftL"] = eScriptFunction.shiftValueLeft;


global.__scriptCommandMap[? "waitFrames"] = eScriptFunction.waitForFrames;
global.__scriptCommandMap[? "waitFrame"] = eScriptFunction.wait;
global.__scriptCommandMap[? "restartProcessing"] = eScriptFunction.restartProcessing;
global.__scriptCommandMap[? "jumpLabel"] = eScriptFunction.jumpToLabel;
global.__scriptCommandMap[? "jumpSection"] = eScriptFunction.jumpToSection;
global.__scriptCommandMap[? "MESSAGE"] = eScriptFunction.showMessage;
global.__scriptCommandMap[? "end"] = eScriptFunction.endProcessing;
global.__scriptCommandMap[? "makeRgb"] = eScriptFunction.makeRgb;
global.__scriptCommandMap[? "string2number"] = eScriptFunction.string2num;
global.__scriptCommandMap[? "number2string"] = eScriptFunction.num2string;
global.__scriptCommandMap[? "string2asset"] = eScriptFunction.string2asset;
global.__scriptCommandMap[? "text"] = eScriptFunction.text;
global.__scriptCommandMap[? "textStart"] = eScriptFunction.startTextProcessing;
global.__scriptCommandMap[? "textEnd"] = eScriptFunction.endTextProcessing;
global.__scriptCommandMap[? "toggleNpcAnimate"] = eScriptFunction.toggleNpcAnimate;
global.__scriptCommandMap[? "setFacepic1"] = eScriptFunction.setFacepic1;
global.__scriptCommandMap[? "setFacepic2"] = eScriptFunction.setFacepic2;
global.__scriptCommandMap[? "setNamelabel1"] = eScriptFunction.setNamelabel1;
global.__scriptCommandMap[? "setNamelabel2"] = eScriptFunction.setNamelabel2;
global.__scriptCommandMap[? "toggleFacepic1"] = eScriptFunction.toggleFacepic1;
global.__scriptCommandMap[? "toggleFacepic2"] = eScriptFunction.toggleFacepic2;
#endregion

ScriptSysMessage("Compiling scripts");

function CheckForRef(sussy, expect) {
	//gml_pragma("forceinline"); lol lol lol lol lol lol lol 
	//var value = global.script_variables[?valueName];
	if(string_ord_at(sussy, 1) == eChar.ampersand) { //is reference?
		//return CheckForRef(string_copy(sussy, 2, string_length(sussy)), expect); //lol why not
		return global.script_variables[? string_copy(sussy, 2, string_length(sussy))];
	}
	/*if(sussy == undefined) { //value requested doesn't exist?
		global.errorCode = eErrorCode.valueNotFound; //set error code
		global.script_variables[?valueName] = eValueExpect.string ? "" : 0; //set default
	}*/
	return sussy;
}

function CompileScriptReadable(fname) {
	//gml_pragma("forceinline"); //bad idea? VERY BAD IDEA LOL it'd infinitely recurse because of the needed check shit
	ScriptSysMessage("Processing " + fname);
	if(global.script_compiled[?fname] != undefined) {
		ScriptSysMessage(fname + " has already been processed");
		exit;
	}
	var char = 0; //this'll be both strings and ints
	var fstring = ReadAssuredLf(working_directory + "/" + scriptslocation + "/" + fname);
	var fpos = 0; //pointer in file TODO: does this respect utf8 )yes it seems to
	var fLen = string_length(fstring);
	if(/*string_lower*/(string_copy(fstring, 1, 6)) == "NEEDED") { //check if needed files exist then if they are compiled
		fpos = 7; //should be on the space between NEEDED and the first dependency
		var neededFname = "";
		while(char != eChar.semicolon) { //while character isn't a semicolon
			fpos = string_read_terminated(fstring, ++fpos, [",",";"], 0);
			neededFname = global.stringReadReturn;
			if(global.script_compiled[?neededFname] == undefined /*&& neededFname != "\n" && neededFname != " "*/) {
				ScriptSysMessage(fname + " requires file " + neededFname + " which hasn't been processed yet, processing");
				CompileScriptReadable(neededFname);
			}
			char = string_ord_at(fstring, fpos);
		}
	}
	while(fpos <= fLen) { //file reading loop
		char = string_ord_at(fstring,++fpos);
		//var charstr = chr(char);
		//begin everything
		while(char == eChar.dollar) { //found definition of a global variable
			fpos = string_read_terminated(fstring, ++fpos, ["="], 0);
			var valueName = string_lower(global.stringReadReturn); //no case sensitvity to make things easier, or not idk
			//get what kind of value we're setting to the global value
			var kind = string_ord_at(fstring,++fpos);
			//get what we're setting the value name to
			fpos = string_read_terminated(fstring, ++fpos, [";"], 0);
			var theValue = global.stringReadReturn;
			switch(kind) { //decide what to store in the values map
				case eChar.hash: //store a number
					global.script_variables[? valueName] = real(theValue);
					break;
				case eChar.at: //store a string
					global.script_variables[? valueName] = theValue;
					break;
				case eChar.dollar: //store another value
					global.script_variables[? valueName] = CheckForRef(theValue, eValueExpect.number); //most likely would be a number
					break;
				case eChar.ampersand: //store reference
					global.script_variables[? valueName] = "&" + theValue;
					break;
				case eChar.exclamation: //store asset id
					global.script_variables[? valueName] = asset_get_index(CheckForRef(theValue, eValueExpect.string));
					break;
				default: //dumbass
					show_error("Script " + fname + " has tried defining value " + valueName + " with invalid type " + chr(kind), 1);
					break;
			}
			char = string_char_at(fstring,fpos);
		}
		while(char == eChar.lt) { //is "<" ? begin processing a section
			fpos = string_read_terminated(fstring, ++fpos, [">"], 1); //read until >
			var sectionname = global.stringReadReturn; //store read section name
			ScriptSysMessage("Processing section " + sectionname); //notify
			var section = ds_list_create(); //create list of commands to be filled
			var currentcommand = -1;
			//char = string_ord_at(fstring, fpos);
			char = 0;
			while(fpos <= fLen && char != eChar.lt) { //command reading loop
				var islabelfunc = false;
				while(string_ord_at(fstring,fpos) == eChar.squareBracketL) { //begin function processing (while loop to allow for functions next to each other)
					var currentarg = 0;
					var commandargs; //argument 0 will always be the function id
					fpos = string_read_terminated(fstring, ++fpos, ["]"], 0);
					var functionname = global.stringReadReturn;
					/*
					the string pointer is at the moment in the ] terminator
					*/
					islabelfunc = functionname == "label";
					if(global.__scriptCommandMap[?functionname] == undefined && !islabelfunc) {
						show_error("Script " + fname + " in section " + sectionname + " has unknown command " + functionname,1);
					} else if(!islabelfunc){
						commandargs = ds_list_create();
						commandargs[|0] = global.__scriptCommandMap[? functionname];
						currentcommand++;
					}
					while(string_ord_at(fstring,++fpos) != eChar.semicolon) {//loop to store arguments
						var kind = string_ord_at(fstring,fpos++); //get what kind of value the argument is
						if(kind == eChar.quote) { //special reading for strings
							fpos = string_read_terminated(fstring, fpos, ["\""], 1);
						} else {
							fpos = string_read_terminated(fstring, fpos, [",",";"], 0);
						}
						var argumentvalue = global.stringReadReturn;
						if(!islabelfunc) { //argument processing for normal commands
							switch(kind) {
								case eChar.quote:
									commandargs[|++currentarg] = argumentvalue;
									break;
								case eChar.hash:
									commandargs[|++currentarg] = real(argumentvalue);
									break;
								case eChar.dollar:
									commandargs[|++currentarg] = CheckForRef(argumentvalue,eValueExpect.number);
									break;
								case eChar.ampersand:
									commandargs[|++currentarg] = "&" + argumentvalue;
									break;
								case eChar.exclamation:
									commandargs[|++currentarg] = asset_get_index(CheckForRef(argumentvalue,eValueExpect.number));
									break;
								default:
									show_error("Script " + fname + " at section " + sectionname + " has command with argument using invalid type " + chr(kind),1);
									break;
							}
						} else if (++currentarg < 2){ //process label
							global.script_labels[? argumentvalue] = ds_list_create();
							global.script_labels[? argumentvalue][|0] = sectionname;
							global.script_labels[? argumentvalue][|1] = currentcommand;
						} else { //you gave the label too many arguments
							show_error("Script " + fname + " in section " + sectionname + " defined a label but it gave too many arguments.",1);
						}
						if(string_ord_at(fstring, fpos) == eChar.semicolon) then break;
					}
					if(!islabelfunc) {
						section[|currentcommand] = commandargs;
					}
				}
				char = string_ord_at(fstring, ++fpos); /***********************THIS IS THE MOST IMPORTANT LINE OF CODE IN HERE, NOTE THE ++FPOS***********************/
			}
			global.script_sections[? sectionname] = section;
		}
	}
	ScriptSysMessage("Finished processing " + fname);
	global.script_compiled[?fname] = 1; //the value doesn't matter, my code checks wether the key just exists
}

var fname = file_find_first(working_directory + "/" + scriptslocation + "/*.txt",fa_directory);
while(fname != "") { //compile all scripts in script directory
	CompileScriptReadable(fname);
	fname = file_find_next();
}
ScriptSysMessage("All done");
//show_message("i'm outta here");
//SerializeScript();