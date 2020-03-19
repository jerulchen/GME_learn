{

    draw_set_font(font0);
    draw_set_color(c_red);
    draw_text(10,10,string_hash_to_newline("Shader Demo8:阴影"));


    var texture = sprite_get_texture(sprite_index, image_index);
    texel_width = texture_get_texel_width(texture);
    texel_height = texture_get_texel_height(texture);    


    if( shader_is_compiled(sShaderDemo8) )
    {              
        shader_set(sShaderDemo8);        
    
        draw_set_color(c_white);
        shader_set_uniform_f(Vtex_pixel_size, texel_width, texel_height );
        draw_text(250,y-30,string_hash_to_newline("大家好!"));

        //image_blend=c_yellow;
        draw_self();
        
        shader_reset();

    }else{
        draw_text(10,40,string_hash_to_newline("sShaderDemo8未就绪"));
    }
}



