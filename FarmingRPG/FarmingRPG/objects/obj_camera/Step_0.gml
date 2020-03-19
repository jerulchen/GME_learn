//x = following.x;
//y = following.y;
scr_get_input();


if move_camera
{
	x += input_right * camera_mov_spd - input_left * camera_mov_spd;
	y += input_down * camera_mov_spd - input_up * camera_mov_spd;
}

else
{

	x = clamp(x, following.x - h_border, following.x + h_border);
	y = clamp(y, following.y - v_border, following.y + v_border);

}