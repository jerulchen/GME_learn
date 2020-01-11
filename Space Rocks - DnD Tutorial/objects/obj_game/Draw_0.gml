/// @DnDAction : YoYo Games.Switch.Switch
/// @DnDVersion : 1
/// @DnDHash : 681C9F79
/// @DnDArgument : "expr" "room"
var l681C9F79_0 = room;
switch(l681C9F79_0)
{
	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 727639AE
	/// @DnDParent : 681C9F79
	/// @DnDArgument : "const" "rm_game"
	case rm_game:
		/// @DnDAction : YoYo Games.Drawing.Draw_Instance_Score
		/// @DnDVersion : 1
		/// @DnDHash : 201388AB
		/// @DnDParent : 727639AE
		/// @DnDArgument : "x" "20"
		/// @DnDArgument : "y" "20"
		if(!variable_instance_exists(id, "__dnd_score")) __dnd_score = 0;
		draw_text(20, 20, string("Score: ") + string(__dnd_score));
	
		/// @DnDAction : YoYo Games.Drawing.Draw_Instance_Lives
		/// @DnDVersion : 1
		/// @DnDHash : 61D5A6AA
		/// @DnDParent : 727639AE
		/// @DnDArgument : "x" "30"
		/// @DnDArgument : "y" "60"
		/// @DnDArgument : "sprite" "spr_lives"
		/// @DnDSaveInfo : "sprite" "baf64fca-758d-417e-aa0f-959b69cb7796"
		var l61D5A6AA_0 = sprite_get_width(spr_lives);
		var l61D5A6AA_1 = 0;
		if(!variable_instance_exists(id, "__dnd_lives")) __dnd_lives = 0;
		for(var l61D5A6AA_2 = __dnd_lives; l61D5A6AA_2 > 0; --l61D5A6AA_2) {
			draw_sprite(spr_lives, 0, 30 + l61D5A6AA_1, 60);
			l61D5A6AA_1 += l61D5A6AA_0;
		}
	
		/// @DnDAction : YoYo Games.Drawing.Set_Font
		/// @DnDVersion : 1
		/// @DnDHash : 0C5402D4
		/// @DnDParent : 727639AE
		/// @DnDArgument : "font" "fnt_text"
		/// @DnDSaveInfo : "font" "fa150d32-c611-41fa-ada8-d8fbbb673902"
		draw_set_font(fnt_text);
		break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 3C62C642
	/// @DnDParent : 681C9F79
	/// @DnDArgument : "const" "rm_start"
	case rm_start:
		/// @DnDAction : YoYo Games.Drawing.Set_Alignment
		/// @DnDVersion : 1.1
		/// @DnDHash : 2C77195E
		/// @DnDParent : 3C62C642
		/// @DnDArgument : "halign" "fa_center"
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
	
		/// @DnDAction : YoYo Games.Drawing.Set_Color
		/// @DnDVersion : 1
		/// @DnDHash : 28071F13
		/// @DnDParent : 3C62C642
		/// @DnDArgument : "color" "$FFFF63E5"
		draw_set_colour($FFFF63E5 & $ffffff);
		var l28071F13_0=($FFFF63E5 >> 24);
		draw_set_alpha(l28071F13_0 / $ff);
	
		/// @DnDAction : YoYo Games.Drawing.Draw_Value_Transformed
		/// @DnDVersion : 1
		/// @DnDHash : 2CF1394C
		/// @DnDParent : 3C62C642
		/// @DnDArgument : "x" "250"
		/// @DnDArgument : "y" "100"
		/// @DnDArgument : "xscale" "3"
		/// @DnDArgument : "yscale" "3"
		/// @DnDArgument : "caption" ""SPACE ROCKS ""
		draw_text_transformed(250, 100, string("SPACE ROCKS ") + "", 3, 3, 0);
	
		/// @DnDAction : YoYo Games.Drawing.Set_Color
		/// @DnDVersion : 1
		/// @DnDHash : 0C9A02AF
		/// @DnDParent : 3C62C642
		draw_set_colour($FFFFFFFF & $ffffff);
		var l0C9A02AF_0=($FFFFFFFF >> 24);
		draw_set_alpha(l0C9A02AF_0 / $ff);
	
		/// @DnDAction : YoYo Games.Drawing.Draw_Value
		/// @DnDVersion : 1
		/// @DnDHash : 0529E195
		/// @DnDParent : 3C62C642
		/// @DnDArgument : "x" "250"
		/// @DnDArgument : "y" "200"
		/// @DnDArgument : "caption" ""GET 1000 SCORE TO WIN""
		draw_text(250, 200, string("GET 1000 SCORE TO WIN") + "");
	
		/// @DnDAction : YoYo Games.Drawing.Draw_Value
		/// @DnDVersion : 1
		/// @DnDHash : 75CA2F9B
		/// @DnDParent : 3C62C642
		/// @DnDArgument : "x" "250"
		/// @DnDArgument : "y" "230"
		/// @DnDArgument : "caption" ""USE  UP / LEFT/ DOWN TO CONTROL""
		draw_text(250, 230, string("USE  UP / LEFT/ DOWN TO CONTROL") + "");
	
		/// @DnDAction : YoYo Games.Drawing.Draw_Value
		/// @DnDVersion : 1
		/// @DnDHash : 7AC84114
		/// @DnDParent : 3C62C642
		/// @DnDArgument : "x" "250"
		/// @DnDArgument : "y" "260"
		/// @DnDArgument : "caption" ""PRESS 【SPACEBAR】 TO SHOOT""
		draw_text(250, 260, string("PRESS 【SPACEBAR】 TO SHOOT") + "");
	
		/// @DnDAction : YoYo Games.Drawing.Set_Color
		/// @DnDVersion : 1
		/// @DnDHash : 2529E6FA
		/// @DnDParent : 3C62C642
		/// @DnDArgument : "color" "$FF00FFFF"
		draw_set_colour($FF00FFFF & $ffffff);
		var l2529E6FA_0=($FF00FFFF >> 24);
		draw_set_alpha(l2529E6FA_0 / $ff);
	
		/// @DnDAction : YoYo Games.Drawing.Draw_Value
		/// @DnDVersion : 1
		/// @DnDHash : 2020F8A8
		/// @DnDParent : 3C62C642
		/// @DnDArgument : "x" "250"
		/// @DnDArgument : "y" "350"
		/// @DnDArgument : "caption" ""PRESS ENTER TO START""
		draw_text(250, 350, string("PRESS ENTER TO START") + "");
	
		/// @DnDAction : YoYo Games.Drawing.Set_Color
		/// @DnDVersion : 1
		/// @DnDHash : 35D37689
		/// @DnDParent : 3C62C642
		draw_set_colour($FFFFFFFF & $ffffff);
		var l35D37689_0=($FFFFFFFF >> 24);
		draw_set_alpha(l35D37689_0 / $ff);
	
		/// @DnDAction : YoYo Games.Drawing.Set_Alignment
		/// @DnDVersion : 1.1
		/// @DnDHash : 6B7B4B95
		/// @DnDParent : 3C62C642
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 3C350064
	/// @DnDParent : 681C9F79
	/// @DnDArgument : "const" "rm_gameover"
	case rm_gameover:
		/// @DnDAction : YoYo Games.Drawing.Set_Alignment
		/// @DnDVersion : 1.1
		/// @DnDHash : 078ACB66
		/// @DnDParent : 3C350064
		/// @DnDArgument : "halign" "fa_center"
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
	
		/// @DnDAction : YoYo Games.Drawing.Set_Color
		/// @DnDVersion : 1
		/// @DnDHash : 0406CF47
		/// @DnDParent : 3C350064
		/// @DnDArgument : "color" "$FF0000FF"
		draw_set_colour($FF0000FF & $ffffff);
		var l0406CF47_0=($FF0000FF >> 24);
		draw_set_alpha(l0406CF47_0 / $ff);
	
		/// @DnDAction : YoYo Games.Drawing.Draw_Value_Transformed
		/// @DnDVersion : 1
		/// @DnDHash : 65298DD2
		/// @DnDParent : 3C350064
		/// @DnDArgument : "x" "250"
		/// @DnDArgument : "y" "150"
		/// @DnDArgument : "xscale" "3"
		/// @DnDArgument : "yscale" "3"
		/// @DnDArgument : "caption" ""GAME OVER""
		draw_text_transformed(250, 150, string("GAME OVER") + "", 3, 3, 0);
	
		/// @DnDAction : YoYo Games.Drawing.Set_Color
		/// @DnDVersion : 1
		/// @DnDHash : 6DECFE6A
		/// @DnDParent : 3C350064
		draw_set_colour($FFFFFFFF & $ffffff);
		var l6DECFE6A_0=($FFFFFFFF >> 24);
		draw_set_alpha(l6DECFE6A_0 / $ff);
	
		/// @DnDAction : YoYo Games.Drawing.Draw_Instance_Score
		/// @DnDVersion : 1
		/// @DnDHash : 592CE96C
		/// @DnDParent : 3C350064
		/// @DnDArgument : "x" "250"
		/// @DnDArgument : "y" "250"
		/// @DnDArgument : "caption" ""FINAL SCORE: ""
		if(!variable_instance_exists(id, "__dnd_score")) __dnd_score = 0;
		draw_text(250, 250, string("FINAL SCORE: ") + string(__dnd_score));
	
		/// @DnDAction : YoYo Games.Drawing.Set_Alignment
		/// @DnDVersion : 1.1
		/// @DnDHash : 007CF916
		/// @DnDParent : 3C350064
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 390D2EE1
	/// @DnDParent : 681C9F79
	/// @DnDArgument : "const" "rm_win"
	case rm_win:
		/// @DnDAction : YoYo Games.Drawing.Set_Alignment
		/// @DnDVersion : 1.1
		/// @DnDHash : 78C6B7A7
		/// @DnDParent : 390D2EE1
		/// @DnDArgument : "halign" "fa_center"
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
	
		/// @DnDAction : YoYo Games.Drawing.Set_Color
		/// @DnDVersion : 1
		/// @DnDHash : 7CDDCAE5
		/// @DnDParent : 390D2EE1
		/// @DnDArgument : "color" "$FF00FF00"
		draw_set_colour($FF00FF00 & $ffffff);
		var l7CDDCAE5_0=($FF00FF00 >> 24);
		draw_set_alpha(l7CDDCAE5_0 / $ff);
	
		/// @DnDAction : YoYo Games.Drawing.Draw_Value_Transformed
		/// @DnDVersion : 1
		/// @DnDHash : 194469EB
		/// @DnDParent : 390D2EE1
		/// @DnDArgument : "x" "250"
		/// @DnDArgument : "y" "150"
		/// @DnDArgument : "xscale" "3"
		/// @DnDArgument : "yscale" "3"
		/// @DnDArgument : "caption" ""YOU WIN !""
		draw_text_transformed(250, 150, string("YOU WIN !") + "", 3, 3, 0);
	
		/// @DnDAction : YoYo Games.Drawing.Set_Color
		/// @DnDVersion : 1
		/// @DnDHash : 0EE90236
		/// @DnDParent : 390D2EE1
		draw_set_colour($FFFFFFFF & $ffffff);
		var l0EE90236_0=($FFFFFFFF >> 24);
		draw_set_alpha(l0EE90236_0 / $ff);
	
		/// @DnDAction : YoYo Games.Drawing.Draw_Instance_Score
		/// @DnDVersion : 1
		/// @DnDHash : 4B105F4D
		/// @DnDParent : 390D2EE1
		/// @DnDArgument : "x" "250"
		/// @DnDArgument : "y" "250"
		/// @DnDArgument : "caption" ""FINAL SCORE: ""
		if(!variable_instance_exists(id, "__dnd_score")) __dnd_score = 0;
		draw_text(250, 250, string("FINAL SCORE: ") + string(__dnd_score));
	
		/// @DnDAction : YoYo Games.Drawing.Set_Alignment
		/// @DnDVersion : 1.1
		/// @DnDHash : 540C042E
		/// @DnDParent : 390D2EE1
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		break;
}