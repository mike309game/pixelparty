src = 1;
dest = 1;

alphasrc = 1;
alphadest = 1;

value = 0;
counter = 0;

stringfromconst = function(arg) {
	//return string(arg);
	switch(arg) {
		case bm_zero:
			return "bm_zero";
			break;
		case bm_one:
			return "bm_one";
			break;
		case bm_src_colour:
			return "bm_src_colour";
			break;
		case bm_inv_src_colour:
			return "bm_inv_src_colour";
			break;
		case bm_src_alpha:
			return "bm_src_alpha";
			break;
		case bm_inv_src_alpha:
			return "bm_inv_src_alpha";
			break;
		case bm_dest_alpha:
			return "bm_dest_alpha";
			break;
		case bm_inv_dest_alpha:
			return "bm_inv_dest_alpha";
			break;
		case bm_dest_colour:
			return "bm_dest_colour";
			break;
		case bm_inv_dest_colour:
			return "bm_inv_dest_colour";
			break;
		case bm_src_alpha_sat:
			return "bm_src_alpha_sat";
			break;
	}
}