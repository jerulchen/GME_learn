{
    draw_set_font(font0);
    draw_set_color(c_red);

    draw_self();
    draw_text(40,140,string_hash_to_newline("大家好! 大家好! 大家好! 大家好! 大家好! 大家好! 大家好! 大家好! 大家好!"));
    
    
    if( shader_is_compiled( sShaderDemo10 ) )
    {
        var s = (sin(degtorad(angle))+1.0)/2.0;
        shader_set(sShaderDemo10);
		//***(id,x,y,r)剪切范围
        shader_set_uniform_f(v_mask, room_width/2, room_height/2, (room_width/1.5)*s );
        draw_background_stretched(background0,0,0,room_width,room_height);
        shader_reset();
    }else{
        draw_text(10,40,string_hash_to_newline("sShaderDemo10未就绪"));
    }
    
    
    draw_set_font(font0);
    draw_set_color(c_red);
    draw_text(10,10,string_hash_to_newline("Shader Demo10:剪切蒙版"));
 
    angle+=2;
    if( angle>360 ) angle -=360;
}

