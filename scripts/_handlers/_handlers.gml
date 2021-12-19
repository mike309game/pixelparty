/**********************************************************
BASE HANDLER should not be used by itself and should only be inherited
***********************************************************/
function HandlerBase(intID) constructor {
	myInterpreter = intID;					//handler's interpreter
	handlerWaitFrames = -1;					//halt frames as given by interpreter
	handlerText = "";						//text given by interpreter
	handlerProcessText = false;				//process text?
	handlerWaitForInput = false;			//waiting for input?
	handlerWaitFrames = -1;					//frames to wait before reactivating interpreter
	
	static Resume = function() {
		myInterpreter.halted = false;
	}
	static Update = function() {
		if(handlerWaitForInput) {
			if(keycheck_pressed(vk_enter)) {
				handlerWaitForInput = false;
				handlerWaitFrames = 1; //immediately process then
				//exit; why was this here in the first place?
			}
		}
		if(--handlerWaitFrames == 0) {
			Resume();
		}
	}
	static Draw = function() {
		//stub in base
	}
	static Cleanup = function() {
		//stub in base
	}
	static HandleWaitCommand = function(_waitAmt) {
		myInterpreter.halted = true; //halt interpreter
		handlerWaitFrames = _waitAmt; //unhalt interpreter in x frames
		handlerWaitForInput = false; //prevent skipping wait calls
	}
	static HandleTextCall = function(_text) {
		//stub in base
	}
	static HandleTextProcessingToggle = function(_value) {
		handlerProcessText = _value;
	}
}
/**********************************************************
COMMON HANDLER used by npcs and triggers
***********************************************************/
function HandlerCommon(intID) : HandlerBase(intID) constructor {
	typewriter = new Typewritter(true);
	
	//dumb gamemaker basing
	static CleanupBase = Cleanup;
	static Cleanup = function() {
		CleanupBase();
		typewriter.Cleanup();
		delete typewriter;
	}
	static HandleTextCallBase = HandleTextCall;
	static HandleTextCall = function(_text) {
		HandleTextCallBase(_text);
		myInterpreter.halted = true;
		with(typewriter) {
			canAdvance = 1;
			text += _text;
			textLen = string_length(text);
		}
	}
	static ResumeBase = Resume;
	static Resume = function() {
		ResumeBase();
		if(global.script_variables[? "text auto clear"]) {
			with(typewriter) {
				//characterCount = -1;
				ClearLetterList(letterList);
				letterListLen = 0;
				text = "";
				textLen = 0;
				textPointer = 0;
			}
		}
	}
	static UpdateBase = Update;
	static Update = function() {
		UpdateBase();
		if(handlerProcessText) {
			handlerWaitForInput = typewriter.Step();
		}
	}
	static DrawBase = Draw;
	static Draw = function() {
		DrawBase();
		if(handlerProcessText) {
			draw_gui_set;
			draw_sprite(s_textbox_bright, 0, 0, 240-80); //draw textbox sprite
			
			//top leftmost pixel = 18, 198
			
			fmtstring_draw(18, 198, typewriter.letterList, 0);
			
			if(handlerWaitForInput) {
				draw_sprite(s_psxbuttons_frames, 0, 288, 225);
			}
			
			draw_gui_exit;
		}
	}
}