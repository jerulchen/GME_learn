 //hud默认大小是当前view的大小，并非camera的尺寸，所以显得分辨率有点高（对比游戏画面），这里设置一下
var camera_id = view_camera[0];
var view_width = camera_get_view_width(camera_id);
var view_height = camera_get_view_height(camera_id);
//show_debug_message(string(view_height )+ "+" + string(view_width));
display_set_gui_size(view_width, view_height);


if !instance_exists(o_skeleton) exit;
draw_hp =  o_skeleton.hp;
draw_max_hp = o_skeleton.max_hp;

audio_play_sound(a_music, 4, true);