event_inherited();

run_speed = 3;
nor_speed = 2;
walk_speed = 1;
spd = walk_speed;

x_frame = 1;
y_frame = 8;

x_offset = sprite_get_xoffset(mask_index);
y_offset = sprite_get_yoffset(mask_index);



spr_base = -1;
spr_torso = -1;
spr_legs = -1;
spr_hair = -1;
spr_feets = -1;

spr_shadow = spr_character_shadow;

moveX = 0;
moveY = 0;
can_move = true;

alarm[1] = 1;

portrait_index = 0;
voice = snd_voice1;
name = "Anonymous";

text = ["This person has nothing to say."];
speakers = [id];