//
// red channel only fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragColor = (v_vColour * texture2D( gm_BaseTexture, v_vTexcoord ));
    gl_FragColor.bg = vec2(0.0, 0.0);   // leave .ra channels alone  
}

