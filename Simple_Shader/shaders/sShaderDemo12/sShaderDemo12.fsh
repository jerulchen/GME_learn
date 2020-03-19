//
// 2 texture lookup
//
varying vec4 v_vColour1;
varying vec4 v_vColour2;
varying vec4 v_vTexcoord;

uniform sampler2D second_texture;

void main()
{
    gl_FragColor = v_vColour1*texture2D( gm_BaseTexture, v_vTexcoord.xy ) + v_vColour2*texture2D( second_texture, v_vTexcoord.zw);}

