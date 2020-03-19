//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vTexturePixelSize;

uniform vec2 v_TexturePixelSize;

vec2 ExtractCorner(vec4 _colour )
{
    float b = floor(_colour.b*255.0); //get whole number, (int)
    b = b - ((floor(b/2.0))*2.0);
    float r = floor(_colour.r*255.0); //get whole number, (int)
    r = r - ((floor(r/2.0))*2.0);
    float corner = (r*2.0) + b;       // Now have a 0,1,2 or 3 for the corner we're in. (topleft, clockwise)

    // Top left?
    if( corner==0.0 ){
        return vec2(-1,-1);
    } // Top Right?
    else if( corner==1.0 ){
        return vec2(1,-1);
    } // Bottom Right?
    else if( corner==2.0 ){
        return vec2(1,1);
    } // Bottom Left?
    else{
        return vec2(-1,1);
    }
}

void main()
{
    float scaler = 2.0;
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);

    // get a vector based on which corner the vertex is, and move the corner out by a SCALER amoiunt.
    vec2 corner = ExtractCorner(in_Colour);
    object_space_pos.xy = object_space_pos.xy + (corner*scaler);
    
    // Then transform as normal.
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord + (corner*v_TexturePixelSize*scaler);
    v_vTexturePixelSize = v_TexturePixelSize;
}

