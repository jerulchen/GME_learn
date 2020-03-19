{
    draw_set_font(font0);
    draw_set_color(c_red);
    draw_text(10,10,string_hash_to_newline("Shader Demo9:灰度"));

    if( shader_is_compiled( sShaderDemo9 ) )
    {
        y-=60;
        draw_self();
        
        shader_set(sShaderDemo9);
        y+=120;
        draw_self();
        shader_reset();
        y-=60;
    }else{
        draw_text(10,40,string_hash_to_newline("sShaderDemo9未就绪"));
    }
}

