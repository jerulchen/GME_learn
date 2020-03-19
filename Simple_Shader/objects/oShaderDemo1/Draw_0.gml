{
	//***显示标题
    draw_set_font(font0);
    draw_set_color(c_red);
    draw_text(10,10,string_hash_to_newline("Shader Demo1:旁通着色器"));
    
    if( shader_is_compiled( sShaderDemo1 ) )
    {       
		//***使用shader
        shader_set(sShaderDemo1);
		//***绘制自己
        draw_self();
		//***解除shader
        shader_reset();
    }else{
		//***未就绪
        draw_text(10,40,string_hash_to_newline("sShaderDemo1未就绪"));
    }
}

