/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 23510372
/// @DnDArgument : "var" "room"
/// @DnDArgument : "value" "rm_game"
if(room == rm_game)
{
	/// @DnDAction : YoYo Games.Instance Variables.If_Score
	/// @DnDVersion : 1
	/// @DnDHash : 7370D139
	/// @DnDParent : 23510372
	/// @DnDArgument : "op" "4"
	/// @DnDArgument : "value" "1000"
	if(!variable_instance_exists(id, "__dnd_score")) __dnd_score = 0;
	if(__dnd_score >= 1000)
	{
		/// @DnDAction : YoYo Games.Rooms.Go_To_Room
		/// @DnDVersion : 1
		/// @DnDHash : 534DB9CD
		/// @DnDParent : 7370D139
		/// @DnDArgument : "room" "rm_win"
		/// @DnDSaveInfo : "room" "38d1b7d7-d23b-47f8-9de5-ccdababbf117"
		room_goto(rm_win);
	}

	/// @DnDAction : YoYo Games.Instance Variables.If_Lives
	/// @DnDVersion : 1
	/// @DnDHash : 2364DE91
	/// @DnDParent : 23510372
	/// @DnDArgument : "op" "3"
	if(!variable_instance_exists(id, "__dnd_lives")) __dnd_lives = 0;
	if(__dnd_lives <= 0)
	{
		/// @DnDAction : YoYo Games.Rooms.Go_To_Room
		/// @DnDVersion : 1
		/// @DnDHash : 7394D77B
		/// @DnDParent : 2364DE91
		/// @DnDArgument : "room" "rm_gameover"
		/// @DnDSaveInfo : "room" "62d54e40-aa01-413e-87d0-a092d63b577f"
		room_goto(rm_gameover);
	}

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 00986937
	/// @DnDParent : 23510372
	/// @DnDArgument : "var" "char_bullettype"
	/// @DnDArgument : "not" "1"
	/// @DnDArgument : "value" ""0""
	if(!(char_bullettype == "0"))
	{
		/// @DnDAction : YoYo Games.Common.Apply_To
		/// @DnDVersion : 1
		/// @DnDHash : 1BF8135F
		/// @DnDApplyTo : 7eaf8bc0-6011-4b24-9af8-509f42e3e9c0
		/// @DnDParent : 00986937
		with(obj_game) {
			/// @DnDAction : YoYo Games.Instances.Get_Alarm
			/// @DnDVersion : 1
			/// @DnDHash : 50E3C401
			/// @DnDParent : 1BF8135F
			/// @DnDArgument : "var" "char_bullettype_cd"
			/// @DnDArgument : "var_temp" "1"
			/// @DnDArgument : "alarm" "2"
			var char_bullettype_cd = alarm_get(2);
		}
	}
}