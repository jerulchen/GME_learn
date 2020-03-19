{
    draw_set_font(font0);
    draw_set_color(c_red);
    draw_text(10,10,string_hash_to_newline("Shader Demo3:向着色器传递变量"));
    
    
    if( shader_is_compiled(sShaderDemo3) )
    {    
        shader_set(sShaderDemo3);
    
        step = (room_width-100)/5;
        x = 100;
        shader_set_uniform_f(channel_mask, 1,0,0,1);            // 红色
        draw_sprite(sprite_index,image_index,x, y);
        x+=step;
        
        shader_set_uniform_f(channel_mask, 0,1,0,1);            // 绿色
        draw_sprite(sprite_index,image_index,x, y);
        x+=step;
        
        shader_set_uniform_f(channel_mask, 0,0,1,1);            // 蓝色
        draw_sprite(sprite_index,image_index,x, y);
        x+=step;
    
        shader_set_uniform_f(channel_mask, 1,1,0,1);            // 红色+绿色
        draw_sprite(sprite_index,image_index,x, y);
        x+=step;
        
        shader_set_uniform_f(channel_mask, 1,0,1,1);            // 红色+蓝色
        draw_sprite(sprite_index,image_index,x, y);
        x+=step;
    
        // 通过变量，绘制一个变化颜色的精灵    
        var ss,cc,tt;
        ss = sin(s);
        cc = cos(c);
        tt = tan(t);
        s=s+0.1;
        if( s>2 ) s=0;//红
        c=c+0.01;
        if( c>2 ) c=0;//绿
        t=t+0.1;
        if( t>2 ) t=0;//蓝
            
        shader_set_uniform_f(channel_mask, ss,cc,tt,1);            
        draw_sprite(sprite_index,image_index, 100+(step*2), 300);
        
                
        shader_reset();
    }else{
        draw_text(10,40,string_hash_to_newline("sShaderDemo3未就绪"));
    }
    
    
}

