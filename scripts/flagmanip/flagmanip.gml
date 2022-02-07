

function GetGameFlag(flag, mathable = false) {
	gml_pragma("forceinline");
	if(mathable) {
		return real((global.flag & flag) == flag);
	} else {
		return (global.flag & flag) == flag;
	}
}

function AssureGameFlag(flag) {
	gml_pragma("forceinline");
	global.flag |= flag;
}

function NegateGameFlag(flag) {
	gml_pragma("forceinline");
	global.flag &= ~flag;
}

function SetGameFlag(flag, value) {
	gml_pragma("forceinline");
	if(value) {
		global.flag |= flag;
	} else {
		global.flag &= ~flag;
	}
}

function FadeIn() {
	gml_pragma("forceinline");
	global.flag |= eFlag.doFadeIn;
}

function FadeOut() {
	gml_pragma("forceinline");
	global.flag &= ~(eFlag.doFadeIn);
}