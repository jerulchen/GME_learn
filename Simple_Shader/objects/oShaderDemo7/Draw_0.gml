 {

    draw_set_font(font0);
    draw_set_color(c_red);
    draw_text(10,10,string_hash_to_newline("Shader Demo7:轮廓描边!"));


    if( shader_is_compiled(sShaderDemo7) )
    {              
        shader_set(sShaderDemo7);        
        shader_enable_corner_id(true);//***必须有否则有bug
    
        // Get FONT texture details
        var texture = font_get_texture(font0);
        var texel_width = texture_get_texel_width(texture);
        var texel_height = texture_get_texel_height(texture);    
               
        draw_set_color(c_white);
        shader_set_uniform_f(Vtex_pixel_size, texel_width, texel_height );
        draw_text(250,y-30,string_hash_to_newline("大家好!"));

        
        
        var texture = sprite_get_texture(sprite_index, image_index);
        var texel_width = texture_get_texel_width(texture);
        var texel_height = texture_get_texel_height(texture);    
        
        shader_set_uniform_f(Vtex_pixel_size, texel_width, texel_height );            
        //image_blend=c_yellow;
        draw_self();
        
        shader_reset();
        shader_enable_corner_id(true);

    }else{
        draw_text(10,40,string_hash_to_newline("sShaderDemo7未就绪"));
    }
}



