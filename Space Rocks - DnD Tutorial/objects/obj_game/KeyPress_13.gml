/// @DnDAction : YoYo Games.Switch.Switch
/// @DnDVersion : 1
/// @DnDHash : 2DAF14A5
/// @DnDArgument : "expr" "room"
var l2DAF14A5_0 = room;
switch(l2DAF14A5_0)
{
	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 5E4A19CB
	/// @DnDParent : 2DAF14A5
	/// @DnDArgument : "const" " rm_start"
	case  rm_start:
		/// @DnDAction : YoYo Games.Rooms.Go_To_Room
		/// @DnDVersion : 1
		/// @DnDHash : 3F19C4A3
		/// @DnDParent : 5E4A19CB
		/// @DnDArgument : "room" "rm_game"
		/// @DnDSaveInfo : "room" "6023ff5e-2eed-48a2-8f79-53c0b4770cb1"
		room_goto(rm_game);
		break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 267E9B6C
	/// @DnDParent : 2DAF14A5
	/// @DnDArgument : "const" " rm_gameover"
	case  rm_gameover:
		/// @DnDAction : YoYo Games.Game.Restart_Game
		/// @DnDVersion : 1
		/// @DnDHash : 0617DFAB
		/// @DnDParent : 267E9B6C
		game_restart();
		break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 24059282
	/// @DnDParent : 2DAF14A5
	/// @DnDArgument : "const" " rm_win"
	case  rm_win:
		/// @DnDAction : YoYo Games.Game.Restart_Game
		/// @DnDVersion : 1
		/// @DnDHash : 26113756
		/// @DnDParent : 24059282
		game_restart();
		break;
}