// get sampler
second_texture = shader_get_sampler_index(sShaderDemo11,"second_texture");

// create a simple custom format. 
// NOTE: You should only create one of these at startup, not every time the object is created.
//       You can not delete these so take care with their creation.
vertex_format_begin();
vertex_format_add_position();
vertex_format_add_textcoord();
vertex_format_add_textcoord();
myformat = vertex_format_end();

// Create a buffer to use
mybuffer = vertex_create_buffer_ext(1024*16);



