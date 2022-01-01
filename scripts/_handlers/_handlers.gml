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
	handlerFlags = int64(0);				//handler special flags
	
	//special cases
	handlerFacepic1 = s_nothing;
	handlerFacepic2 = s_nothing;
	handlerNamelabel1 = "";
	handlerNamelabel2 = "";
	
	enum eHandlerFlags {
		npcAnimate = 1 << 0,				//let npc know to do lil chatter animating
		showTextbox = 1 << 1,				//bring up textobx?
		showFacepic1 = 1 << 2,				//show facepic 1?
		showFacepic2 = 1 << 3				//show facepic 2?
	}
	
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
		if(_value == false) then handlerFlags &= ~(eHandlerFlags.showFacepic1 | eHandlerFlags.showFacepic2);
	}
}
/**********************************************************
COMMON HANDLER used by npcs and triggers
***********************************************************/
function HandlerCommon(intID) : HandlerBase(intID) constructor {
	typewriter = new Typewritter(true);
	
	//textbox
	facepic1XCounter = 240;
	facepic2XCounter = 240;
	
	//facepic1Y = 0;
	//facepic2Y = 0;
	
	//uiY = 0;
	
	uiYCounter = 320; //start at very bottom ofc
	
	static UpdateBase = Update;
	static Update = function() {
		UpdateBase();
		if(handlerProcessText) {
			handlerWaitForInput = typewriter.Step();
			if(handlerWaitForInput) {
				uiYCounter = 0;
				/*facepic1XCounter = handlerFlags & eHandlerFlags.showFacepic1 ? 0 : 240;
				facepic2XCounter = handlerFlags & eHandlerFlags.showFacepic2 ? 0 : 240;*/
			} else {
				uiYCounter = max(uiYCounter-16,0);
			}
		} else {
			uiYCounter = min(uiYCounter+16,320);
		}
		
		if(handlerFlags & eHandlerFlags.showFacepic1) {
			facepic1XCounter = max(facepic1XCounter-16,0);
		} else {
			facepic1XCounter = min(facepic1XCounter+16,240);
		}
		
		if(handlerFlags & eHandlerFlags.showFacepic2) {
			facepic2XCounter = max(facepic2XCounter-16,0);
		} else {
			facepic2XCounter = min(facepic2XCounter+16,240);
		}
	}
	
	static DrawBase = Draw;
	static Draw = function() {
		DrawBase();
		//if(handlerProcessText) {
			draw_gui_set;
			draw_sprite(handlerFacepic1,0,EaseInCubic(0,-320,facepic1XCounter/240),0);
			draw_sprite_ext(handlerFacepic2,0,EaseInCubic(320,640,facepic2XCounter/240),0,-1,1,0,c_white,1);
			
			var tboxY = floor(EaseInCubic(0,80,uiYCounter/320));
			
			draw_set_font(f_main);
			draw_sprite(s_textbox_bright, 0, 0, tboxY); //draw textbox sprite
			
			//top leftmost pixel = 18, 198
			
			fmtstring_draw(18, 196+tboxY, typewriter.letterList, 0);
			
			if(handlerWaitForInput) {
				draw_sprite(s_psxbuttons_frames, 0, 288, 225);
			}
			
			draw_gui_exit;
		//}
	}
		
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
}