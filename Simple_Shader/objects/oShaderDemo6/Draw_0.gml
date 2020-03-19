{

    draw_set_font(font0);
    draw_set_color(c_red);
    draw_text(10,10,string_hash_to_newline("Shader Demo6:颜色插值渐变"));

    
    if( shader_is_compiled(sShaderDemo6) )
    {              
        shader_set(sShaderDemo6);        
    
        // 注意: SIN() 范围是 1 到 -1. 使用 -1 将使图片显得 "更黑"
        var s = sin( degtorad(lerp_value) );
        lerp_value+=5;
        if( lerp_value>360 ) lerp_value-=360;
    
        // 插值到白色 (1,1,1)
        shader_set_uniform_f(colour_to_find, 1,1,1, s );       
        draw_sprite(sprite_index,image_index,x+48, y);              
    
        shader_reset();
    }else{
        draw_text(10,40,string_hash_to_newline("sShaderDemo6未就绪"));
    }
    
    
    // Draw normally for comparison    
    draw_sprite(sprite_index,image_index,x-48, y);   
}



