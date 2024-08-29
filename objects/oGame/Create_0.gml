if(!rollback_game_running)
{
	var _join = rollback_join_game();
	
	if(!_join) rollback_create_game(1, false);
}
globalvar players;
players = 0;
gameStart = true;
//audio_play_sound(soFightMusic, 0, infinity);