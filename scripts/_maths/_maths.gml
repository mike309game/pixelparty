//from p3d lmfao


function Approach(current,target,amount){
	
	// approach the value but do not go over
	
	if (current < target) {
	    return min(current+amount, target);
	} else {
	    return max(current-amount, target);
	}
}

function EaseInOutQuad(inputvalue,outputmin,outputmax,inputmax) {
	inputvalue /= inputmax * 0.5;
	
	if (inputvalue < 1)
	{
	    return outputmax * 0.5 * inputvalue * inputvalue + outputmin;
	}
	
	return outputmax * -0.5 * (--inputvalue * (inputvalue - 2) - 1) + outputmin;
}

function EaseInCubic(start, _end, position) {
	return (_end-start) * power(position, 3) + start;
}

function EaseOutCubic(start, _end, position) {
	return (_end-start) * (power(position - 1, 3) + 1) + start;
}

function EaseInOutCubic(start, _end, position) {
	//var _chng = _end-start;
	//var _mid = (start+_end) / 2;
	
	if (position < .5)
	  return EaseInCubic(start,(start+_end) / 2,position*2)
	else
	  return EaseOutCubic((start+_end) / 2,_end,(position-.5)*2);
}