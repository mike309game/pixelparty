//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float timer;

void main()
{
	//                                                                                                                                    wave                       amp
    vec2 tcoord = fract(vec2( v_vTexcoord.x,v_vTexcoord.y+ sin(((v_vTexcoord.x*500.0)+timer)/10.0)*0.06));
	gl_FragColor = v_vColour * texture2D( gm_BaseTexture, tcoord );
}
