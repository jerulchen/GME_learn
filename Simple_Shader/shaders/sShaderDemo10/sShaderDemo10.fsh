//
// Simple passthrough fragment shader
//
varying vec2 v_vPosition;
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 v_MaskParams;      // x,y=position, z=radius, 

void main()
{
    vec2 v = v_MaskParams.xy - v_vPosition.xy;
    float dist = (v.x*v.x) + (v.y*v.y);
    float RadSq = v_MaskParams.z*v_MaskParams.z;
    if( dist>RadSq  ){
        discard;    // throw pixel away if it's out of range
    }else{
        gl_FragColor = gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    }
}

