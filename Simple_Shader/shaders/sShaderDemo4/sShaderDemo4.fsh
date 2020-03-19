//
// BLOCKY SPRITE fragment shader
//
uniform vec3 f_SpritePixelSize;



varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec2 uv = (v_vTexcoord/f_SpritePixelSize.xy) / f_SpritePixelSize.z;
    uv = floor(uv);
    vec2 uv2 = (uv*f_SpritePixelSize.xy)*f_SpritePixelSize.z;

    gl_FragColor = (v_vColour * texture2D( gm_BaseTexture, uv2 ));
}

