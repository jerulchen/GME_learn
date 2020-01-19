/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 35CE3407
/// @DnDArgument : "var" "room"
/// @DnDArgument : "value" "rm_game"
if(room == rm_game)
{
	/// @DnDAction : YoYo Games.Instances.Set_Alarm
	/// @DnDVersion : 1
	/// @DnDHash : 16ED479E
	/// @DnDParent : 35CE3407
	/// @DnDArgument : "steps" "60"
	alarm_set(0, 60);

	/// @DnDAction : YoYo Games.Instances.Set_Alarm
	/// @DnDVersion : 1
	/// @DnDHash : 7CEA4B5B
	/// @DnDParent : 35CE3407
	/// @DnDArgument : "steps" "300"
	/// @DnDArgument : "alarm" "1"
	alarm_set(1, 300);

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 553BB748
	/// @DnDParent : 35CE3407
	/// @DnDArgument : "var" "char_bullettype"
	char_bullettype = 0;

	/// @DnDAction : YoYo Games.Loops.Repeat
	/// @DnDVersion : 1
	/// @DnDHash : 47774E4C
	/// @DnDParent : 35CE3407
	/// @DnDArgument : "times" "6"
	repeat(6)
	{
		/// @DnDAction : YoYo Games.Random.Choose
		/// @DnDVersion : 1
		/// @DnDHash : 3A992DC9
		/// @DnDInput : 2
		/// @DnDParent : 47774E4C
		/// @DnDArgument : "var" "choice"
		/// @DnDArgument : "var_temp" "1"
		/// @DnDArgument : "option_1" "1"
		var choice = choose(0, 1);
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 5575B435
		/// @DnDParent : 47774E4C
		/// @DnDArgument : "var" "choice"
		if(choice == 0)
		{
			/// @DnDAction : YoYo Games.Random.Get_Random_Number
			/// @DnDVersion : 1
			/// @DnDHash : 53F19760
			/// @DnDParent : 5575B435
			/// @DnDArgument : "var" "xx"
			/// @DnDArgument : "var_temp" "1"
			/// @DnDArgument : "max" "room_width*0.3"
			var xx = (random_range(0, room_width*0.3));
		}
	
		/// @DnDAction : YoYo Games.Common.Else
		/// @DnDVersion : 1
		/// @DnDHash : 1581E93B
		/// @DnDParent : 47774E4C
		else
		{
			/// @DnDAction : YoYo Games.Random.Get_Random_Number
			/// @DnDVersion : 1
			/// @DnDHash : 55520AD8
			/// @DnDParent : 1581E93B
			/// @DnDArgument : "var" "xx"
			/// @DnDArgument : "var_temp" "1"
			/// @DnDArgument : "min" "room_width*0.7"
			/// @DnDArgument : "max" "room_width"
			var xx = (random_range(room_width*0.7, room_width));
		}
	
		/// @DnDAction : YoYo Games.Random.Choose
		/// @DnDVersion : 1
		/// @DnDHash : 0F6FE425
		/// @DnDInput : 2
		/// @DnDParent : 47774E4C
		/// @DnDArgument : "var" "choice"
		/// @DnDArgument : "var_temp" "1"
		/// @DnDArgument : "option_1" "1"
		var choice = choose(0, 1);
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 7CB002D5
		/// @DnDParent : 47774E4C
		/// @DnDArgument : "var" "choice"
		if(choice == 0)
		{
			/// @DnDAction : YoYo Games.Random.Get_Random_Number
			/// @DnDVersion : 1
			/// @DnDHash : 32FCBB0A
			/// @DnDParent : 7CB002D5
			/// @DnDArgument : "var" "yy"
			/// @DnDArgument : "var_temp" "1"
			/// @DnDArgument : "max" "room_height*0.3"
			var yy = (random_range(0, room_height*0.3));
		}
	
		/// @DnDAction : YoYo Games.Common.Else
		/// @DnDVersion : 1
		/// @DnDHash : 13942C0B
		/// @DnDParent : 47774E4C
		else
		{
			/// @DnDAction : YoYo Games.Random.Get_Random_Number
			/// @DnDVersion : 1
			/// @DnDHash : 5109D0F7
			/// @DnDParent : 13942C0B
			/// @DnDArgument : "var" "yy"
			/// @DnDArgument : "var_temp" "1"
			/// @DnDArgument : "min" "room_height*0.7"
			/// @DnDArgument : "max" "room_height"
			var yy = (random_range(room_height*0.7, room_height));
		}
	
		/// @DnDAction : YoYo Games.Instances.Create_Instance
		/// @DnDVersion : 1
		/// @DnDHash : 4777CC68
		/// @DnDParent : 47774E4C
		/// @DnDArgument : "xpos" "xx"
		/// @DnDArgument : "ypos" "yy"
		/// @DnDArgument : "objectid" "obj_asteroid"
		/// @DnDSaveInfo : "objectid" "97e8affe-05b4-406c-96d2-2d6973ae0443"
		instance_create_layer(xx, yy, "Instances", obj_asteroid);
	}
}