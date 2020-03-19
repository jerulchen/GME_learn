{

    draw_set_font(font0);
    draw_set_color(c_red);
    draw_text(10,10,string_hash_to_newline("Shader Demo5:简单的颜色替换"));

    
    if( shader_is_compiled(sShaderDemo5) )
    {              
        shader_set(sShaderDemo5);
        
		//***目标色
        // 1,1,1 = 纯白 (每个通道范围 0 到 1)
        shader_set_uniform_f(colour_to_find, 1,1,1 );       
        //***替换色
		// 1,0,0 = 红
        shader_set_uniform_f(colour_to_set, 1,0,0 );    
        //150 151 160
		//shader_set_uniform_f(colour_to_find, 150/255,151/255,160/255);
		//shader_set_uniform_f(colour_to_set, 0,0,1 );
        draw_sprite(sprite_index,image_index,x+48, y);   
                
        shader_reset();
    }else{
        draw_text(10,40,string_hash_to_newline("sShaderDemo5未就绪"));
    }
    
    // Draw normally for comparison        
    draw_sprite(sprite_index,image_index,x-48, y);   
}



