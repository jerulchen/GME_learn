/// @description state machine
// You can write your code in this editor

//sprite_index = s_skeleton_idle_strip3;

switch (state)
{
	case "move":
		#region move state
		if input.right
		{
			move_and_colide(run_speed, 0);
			image_xscale = 1;
			sprite_index = s_skeleton_run_strip6;
			image_speed = 0.6;
		}

		if input.left
		{
			move_and_colide(-run_speed, 0);
			image_xscale = -1;
			sprite_index = s_skeleton_run_strip6;
			image_speed = 0.6;
		}

		if !input.right && !input.left
		{
			sprite_index = s_skeleton_idle_strip3;
			image_speed = 0.4;
		}
		else
		{
			if animation_hit_frame(2) or animation_hit_frame(5)
			{
				audio_play_sound(a_footstep, 2, false);
			}
		}
	
		if input.roll
		{
			state = "roll";
			
		}
		
		if input.attack
		{
			state = "attack one";
			
		}
		
		#endregion
		break;
	
	case "roll":
		#region roll state
		set_state_sprite(s_skeleton_roll_strip7, 0.7, 0);
	
		if image_xscale = 1 
		{
			move_and_colide(roll_speed, 0);
		}
		if image_xscale = -1 
		{
			move_and_colide(-roll_speed, 0);
		}
		
		if animation_end()
		{
			state = "move";
		}
		
		//测试脚本 animation_hit_frame
		//if animation_hit_frame(1)
		//{
		//	show_debug_message(image_index)
		//}
		#endregion
		break;

	case "attack one":
		#region attack one state
		set_state_sprite(s_skeleton_attack_one_strip5, 0.7, 0);
		
		if animation_hit_frame(0)
		{
			audio_play_sound(a_swipe,3,false);
			create_hitbox(x, y, self, s_skeleton_attack_one_damage, 3, 4, strength *0.2, image_xscale)
		}
		
		if input.attack && animation_hit_frame_range(2, 4)
		{
			state = "attack two";
			
		}
		if animation_end()
		{
			state = "move";
		}
		
		#endregion
		break;
	
	case "attack two":
		#region attack two state
		set_state_sprite(s_skeleton_attack_two_strip5, 0.7, 0);
		
		if animation_hit_frame(1)
		{
			audio_play_sound(a_swipe,3,false);
			create_hitbox(x, y, self, s_skeleton_attack_two_damage, 3, 4, strength *0.2, image_xscale)
		}
		
		if input.attack && animation_hit_frame_range(2,4)	
		{
			state = "attack three";
		}
		if animation_end()
		{
			state = "move";
		}
		#endregion
		break;
		
	case "attack three":
		#region attack three state
		set_state_sprite(s_skeleton_attack_three_strip6, 0.7, 0);
		
		if animation_hit_frame(2)
		{
			audio_play_sound(a_swipe,3,false);
			create_hitbox(x, y, self, s_skeleton_attack_three_damage, 4, 4, strength *0.5, image_xscale)
		}
		
		if animation_end()
		{
			state = "move";
		}
		#endregion
		break;
		
	case "knockback":
		#region knockback state
		knockback_state(s_skeleton_hitstun,"move");
		
		#endregion
		break;
	
	default:
		//show_debug_message("State " +state+ " dose not exists");
		state = "move";
	
}
