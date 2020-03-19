{
    draw_set_font(font0);
    draw_set_color(c_red);
    draw_text(10,10,string_hash_to_newline("Shader Demo12:自定义顶点格式2"));
    
    var UVs1 = sprite_get_uvs(sprite_index, image_index);
    var UVs2 = sprite_get_uvs(sprite_index, 0);
    draw_text(10,40,string_hash_to_newline("UVs: "+string(UVs1[0])+", "+string(UVs1[1])+", "+string(UVs1[2])+", "+string(UVs1[3])) );

            
    if( shader_is_compiled( sShaderDemo12 ) )
    {
        var w = 64;
        var h = 64;
        var b = mybuffer;
        vertex_begin(b,myformat);

        var c1 = $ff00ffff;
        var c2 = $ffff00ff;
        // triangle 1
        vertex_position(b,x,y);
        vertex_argb(b, c1 );
        vertex_argb(b, c2 );
        vertex_float4(b,UVs1[0],UVs1[1], UVs2[0],UVs2[1]);

        vertex_position(b,x+w,y);
        vertex_argb(b, c1 );
        vertex_argb(b, c2 );
        vertex_float4(b,UVs1[2],UVs1[1], UVs2[2],UVs2[1]);

        vertex_position(b,x+w,y+h);
        vertex_argb(b, c1 );
        vertex_argb(b, c2 );
        vertex_float4(b,UVs1[2],UVs1[3], UVs2[2],UVs2[3]);

        // triangle 2
        vertex_position(b,x+w,y+h);
        vertex_argb(b, c1 );
        vertex_argb(b, c2 );
        vertex_float4(b,UVs1[2],UVs1[3], UVs2[2],UVs2[3]);

        vertex_position(b,x,y+h);
        vertex_argb(b, c1 );
        vertex_argb(b, c2 );
        vertex_float4(b,UVs1[0],UVs1[3], UVs2[0],UVs2[3]);

        vertex_position(b,x,y);
        vertex_argb(b, c1 );
        vertex_argb(b, c2 );
        vertex_float4(b,UVs1[0],UVs1[1], UVs2[0],UVs2[1]);
                                
        vertex_end(b);
                                    
        var tex1 = sprite_get_texture(sprite_index,image_index);
        var tex2 = sprite_get_texture(sprite_index,0);

        shader_set(sShaderDemo12);
        texture_set_stage(second_texture,tex2);
        vertex_submit(b, pr_trianglelist,tex1);
        shader_reset();
    }else{
        draw_text(10,70,string_hash_to_newline("sShaderDemo12未就绪"));
    }
}



