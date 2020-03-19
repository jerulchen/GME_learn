//
// Simple gray scale fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 col = texture2D( gm_BaseTexture, v_vTexcoord );
    float average = min(1.0, ((col.r+col.g+col.b)/3.0) );
    gl_FragColor = v_vColour * vec4(average,average,average, col.a);
}

