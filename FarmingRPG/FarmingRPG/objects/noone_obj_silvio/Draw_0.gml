
var anim_length = 9;
var frame_size = 64;
var anmi_speed = 12;

if (moveX < 0)
{
	y_frame = 9;
}
else if (moveX > 0)
{
	y_frame = 11;
	
}
else if (moveY < 0)
{
	y_frame = 8;
	
}
else if (moveY > 0)
{
	y_frame = 10;
	
}
else
{
	x_frame = 0;
}


var  _x = x - x_offset;
var _y  = y - y_offset;


if (x_frame + (anmi_speed / room_speed) < anim_length) 
{
	x_frame += anmi_speed / room_speed;
}
else
{
	x_frame = 1;
}


//draw character base
draw_sprite_part(spr_base,0,frame_size * floor(x_frame), y_frame * frame_size, frame_size, frame_size, _x, _y);

//draw character feet
draw_sprite_part( spr_feets,0,frame_size * floor(x_frame), y_frame * frame_size, frame_size, frame_size, _x, _y);

//draw character legs
draw_sprite_part( spr_legs,0,frame_size * floor(x_frame), y_frame * frame_size, frame_size, frame_size, _x, _y);

//draw character shirt
draw_sprite_part(spr_torso,0,frame_size * floor(x_frame), y_frame * frame_size, frame_size, frame_size, _x, _y);

//draw character hair
draw_sprite_part( spr_hair,0,frame_size * floor(x_frame), y_frame * frame_size, frame_size, frame_size, _x, _y);



//increment frame for animation

draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_yellow, c_yellow, c_yellow, c_yellow, true)