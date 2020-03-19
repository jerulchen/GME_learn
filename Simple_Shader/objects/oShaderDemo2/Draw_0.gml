{
    draw_set_font(font0);
    draw_set_color(c_red);
    draw_text(10,10,string_hash_to_newline("Shader Demo2:红色着色器"));

    if( shader_is_compiled(sShaderDemo2) )
    {    
        shader_set(sShaderDemo2);
        draw_self();
        shader_reset();
    }else{
        draw_text(10,40,string_hash_to_newline("sShaderDemo2未就绪"));
    }


}

