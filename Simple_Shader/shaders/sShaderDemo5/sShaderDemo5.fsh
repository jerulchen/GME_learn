//
// simple colour swapping fragment shader
//
uniform vec3 f_Colour1;
uniform vec3 f_Colour2;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 col = texture2D( gm_BaseTexture, v_vTexcoord );
    if( col.rgb == f_Colour1.rgb )
    {
        col.rgb = f_Colour2.rgb;
    }
    gl_FragColor = v_vColour * col;
}

