//from p3d lmfao

function nmod(n, a) {
	gml_pragma("forceinline");
	return (n - (floor((n / a)) * a));
}

function Approach(current,target,amount){
	gml_pragma("forceinline");
	// approach the value but do not go over
	
	if (current < target) {
	    return min(current+amount, target);
	} else {
	    return max(current-amount, target);
	}
}

function EaseInOutQuad(inputvalue,outputmin,outputmax,inputmax) {
	gml_pragma("forceinline");
	inputvalue /= inputmax * 0.5;
	
	if (inputvalue < 1)
	{
	    return outputmax * 0.5 * inputvalue * inputvalue + outputmin;
	}
	
	return outputmax * -0.5 * (--inputvalue * (inputvalue - 2) - 1) + outputmin;
}

function EaseInCubic(start, _end, position) {
	gml_pragma("forceinline");
	return (_end-start) * power(position, 3) + start;
}

function EaseOutCubic(start, _end, position) {
	gml_pragma("forceinline");
	return (_end-start) * (power(position - 1, 3) + 1) + start;
}

function EaseInOutCubic(start, _end, position) {
	gml_pragma("forceinline");
	//var _chng = _end-start;
	//var _mid = (start+_end) / 2;
	
	if (position < .5)
	  return EaseInCubic(start,(start+_end) / 2,position*2)
	else
	  return EaseOutCubic((start+_end) / 2,_end,(position-.5)*2);
}

function EaseInExpo(start, _end, position) {
	gml_pragma("forceinline");
	return (_end - start) * (position == 0 ? 0 : power(2, 10 * position - 10)) + start;
}

//hacky lerps for bouncin because i'm no math professor to know how to properly do this shit

function nEaseOutBounce(x) {
	gml_pragma("forceinline");
	var n1 = 7.5625;
	var d1 = 2.75;
	
	if (x < 1 / d1) {
	    return n1 * x * x;
	} else if (x < 2 / d1) {
		x -= 1.5 / d1;
	    return n1 * x * x + 0.75;
	} else if (x < 2.5 / d1) {
		x -= 2.25 / d1
	    return n1 * x * x + 0.9375;
	} else {
		x -= 2.625 / d1;
	    return n1 * x * x + 0.984375;
	}
}

function EaseOutBounce(start, _end, position) {
	gml_pragma("forceinline");
	return lerp(start, _end, nEaseOutBounce(position));
}

function EaseInBounce(start, _end, position) {
	gml_pragma("forceinline");
	return lerp(start, _end, 1 - nEaseOutBounce(1 - position));
}

function nEaseOutElastic(x) {
	var c4 = (2 * pi) / 3;
	
	return x == 0
	  ? 0
	  : (x == 1
	  ? 1
	  : power(2, -10 * x) * sin((x * 10 - 0.75) * c4) + 1);
}

function EaseOutElastic(start, _end, position) {
	gml_pragma("forceinline");
	return lerp(start, _end, nEaseOutElastic(position));
}

function EaseInOutBack(start, _end, position) {
	gml_pragma("forceinline");
	#macro __easeback_c1 (1.70158)
	#macro __easeback_c2 (__easeback_c1 * 1.525)
	
	return lerp(start, _end, position < 0.5
		? (power(2 * position, 2) * ((__easeback_c2 + 1) * 2 * position - __easeback_c2)) / 2
		: (power(2 * position - 2, 2) * ((__easeback_c2 + 1) * (position * 2 - 2) + __easeback_c2) + 2) / 2);
}

function EaseInBack(start, _end, position) {
	gml_pragma("forceinline");
	#macro __easeback_c3 (__easeback_c1 + 1)
	
	return lerp(start, _end, __easeback_c3 * position * position * position - __easeback_c1 * position * position);
}

function EaseOutBack(start, _end, position) {
	gml_pragma("forceinline");
	return lerp(start, _end, 1 + __easeback_c3 * power(position - 1, 3) + __easeback_c1 * power(position - 1, 2));
}