//
// 2 texture lookup
//
varying vec2 v_vTexcoord;
varying vec2 v_vTexcoord2;

uniform sampler2D second_texture;

void main()
{
    gl_FragColor =  texture2D( gm_BaseTexture, v_vTexcoord ) * texture2D( second_texture, v_vTexcoord2);
}

