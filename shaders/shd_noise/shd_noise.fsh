//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float time;
uniform float ammt;

float random (vec2 st) {
    return fract(sin(dot(st.xy,
                         vec2(12.9898+time,78.233+time)))*
        43758.5453123);
}

void main()
{
	vec4 texFrag = texture2D( gm_BaseTexture, v_vTexcoord );
	texFrag.rgb += vec3(random(v_vTexcoord) / ammt);
    gl_FragColor = v_vColour * texFrag;
}
