speed += 20;


if(life > 0)
{
	life -= 1;
}
else
{
	instance_destroy();
}

var _player = collision_line(x, y, x + lengthdir_x(speed, direction), y + lengthdir_y(speed, direction), oPlayer, false, false)
if(_player != noone)
{
	//show_message(_player.hp);
	_player.hp -= dmg;
	_player.hspd += lengthdir_x(knockBack, direction);
	_player.vspd += lengthdir_y(knockBack, direction);
	if(_player.hp <= 0)
	{
		death(_player);
	}
	instance_destroy();
}