//
// lerp to colour fragment shader
//
varying vec2 v_vTexturePixelSize;
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec2 uv = v_vTexcoord;
    vec2 uv_offset = v_vTexturePixelSize*2.0;
    vec2 offset1 =  -uv_offset;
//    vec2 offset2 =  uv_offset;
//    vec2 offset3 =  uv_offset;
//    vec2 offset4 =  uv_offset;

//    offset1.y=0.0;
//    offset1.x=-offset1.x;
//    offset2.y=0.0;
//    offset3.x=0.0;
//    offset4.x=0.0;
//    offset4.y=-offset3.y;
    
    
    vec4 col0 = texture2D( gm_BaseTexture, uv);
    vec4 col1 = texture2D( gm_BaseTexture, uv+offset1);
//    vec4 col2 = texture2D( gm_BaseTexture, uv+offset2);
//    vec4 col3 = texture2D( gm_BaseTexture, uv+offset3);
//    vec4 col4 = texture2D( gm_BaseTexture, uv+offset4);
    col0.rgb = col0.rgb*col0.aaa;
    col0.a = max(col0.a,col1.a); //max(col1.a,max(col2.a,max(col3.a,col4.a))));
    gl_FragColor = v_vColour * col0;
}


