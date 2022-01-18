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