




/*








THIS DOESN'T MOTHERFUCKING WORK








*/





















#undef precision
#undef highp

precision highp float;
//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

vec3 yiq2rgb(vec3 yiq) {
	mat3 yiq2rgb_mat = mat3(
	1.0,  0.946882, 0.623557,
	1.0, -0.274788,-0.635691,
	1.0, -1.108545, 1.709007
	);
	return yiq2rgb_mat * yiq;
}

vec3 rgb2yiq(vec3 col) {
	mat3 yiq_mat = mat3(
	0.2989, 0.5870, 0.1140,
	0.5959, -0.2744, -0.3216,
	0.2115, -0.5229, 0.3114
	);
	return col * yiq_mat;
}

void main()
{
	vec4 tex = texture2D( gm_BaseTexture, v_vTexcoord );
	vec3 yiq = tex.xyz;
	yiq.x  = yiq.x * 2.0;
    yiq.yz = yiq.yz * 2.0 - 1.0;
	vec3 _rgb = yiq2rgb(yiq);
	_rgb = clamp(_rgb, 0.0, 1.0);
    _rgb = pow(_rgb, vec3(2.2 / 2.0));
	vec4 c;
	c = vec4(_rgb, 1.0);
    gl_FragColor = c.bgra;//v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}
