{

    draw_set_font(font0);
    draw_set_color(c_red);
    draw_text(10,10,string_hash_to_newline("Shader Demo4:马赛克效果"));
    

	//***获取材质参数
    var texture = sprite_get_texture(sprite_index, image_index);
    texel_width = texture_get_texel_width(texture);
    texel_height = texture_get_texel_height(texture);
    
    if( shader_is_compiled(sShaderDemo4) )
    {              
        shader_set(sShaderDemo4);
        
        step = (room_width+200)/6;
        x=100;
        for(var i=1;i<9;i++){
			//(材质大小,宽,高,像素)
            shader_set_uniform_f(tex_pixel_size, texel_width, texel_height, i );
            draw_sprite(sprite_index,image_index,x-(i>4)*step*4, y+(i>4)*sprite_height*0.8);   
            x+=step;
        }
                
        shader_reset();
    }else{
        draw_text(10,40,string_hash_to_newline("sShaderDemo4未就绪"));
    }


}



