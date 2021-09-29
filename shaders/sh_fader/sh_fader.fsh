//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float fadeammt;

void main()
{
	vec4 fragment = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	fragment.rgb += fadeammt; //do not touch the alpha
    gl_FragColor = fragment;
}
