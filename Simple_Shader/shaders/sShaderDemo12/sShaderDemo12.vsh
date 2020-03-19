//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour0;                   // (x,y,z)
attribute vec4 in_Colour1;                   // (x,y,z)
attribute vec4 in_TextureCoord;              // (u,v)

varying vec4 v_vColour1;
varying vec4 v_vColour2;
varying vec4 v_vTexcoord;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, 0.5, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour1 = in_Colour0;
    v_vColour2 = in_Colour1;
    v_vTexcoord = in_TextureCoord;
}

