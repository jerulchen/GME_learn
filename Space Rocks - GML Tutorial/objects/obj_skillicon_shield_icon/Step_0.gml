/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_ship))

{
	if (obj_ship.alarm[3] >= 0 || obj_ship.alarm[2] <= 0 )
	{
	sprite_index = spr_icon_shield_1;	
	//draw_sprite(spr_icon_shield_1,0,room_width,room_height);
	//draw_set_halign(fa_center);
	//draw_set_valign(fa_bottom);
	//draw_text(room_width-(sprite_width / 2), room_height - (sprite_height / 2), string(obj_ship.alarm[3] / room_speed ));
	//draw_set_halign(fa_left);
	//draw_set_valign(fa_top);
	
	}
	
	
	if (obj_ship.alarm[3] <= 0 && obj_ship.alarm[2] >= 0)
	{
	
	sprite_index = spr_icon_shield_0;	
	//draw_sprite(spr_icon_shield_0,0,room_width,room_height);
	//draw_set_halign(fa_center);
	//draw_set_valign(fa_bottom);
	//draw_text(room_width-(sprite_width / 2), room_height - (sprite_height / 2), string(obj_ship.alarm[2] / room_speed ));
	//draw_set_halign(fa_left);
	//draw_set_valign(fa_top);
	if (obj_ship.alarm[2] <= 0 )
	{
	sprite_index = spr_icon_shield_1;	
	}
	
	}
}