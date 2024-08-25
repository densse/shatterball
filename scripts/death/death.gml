function death(_player)
{
	with(_player)
	{
		instance_destroy();
	}
	players --;
	if(players <= 1)
	{
		if(room == rLevel4)
		{
			room_goto(rLevel1);
		}
		else
		{
			room_goto_next();
		}
	}
}