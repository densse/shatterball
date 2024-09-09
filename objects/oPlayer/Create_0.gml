var _input = rollback_get_input();

machinegun = function(_input, _player)
{
	shoot(33, 0, _player, point_direction(x, y, _input.mouseX, _input.mouseY), 50);
	reload = 10;
}

shotgun = function(_input, _player)
{
	for(i = -3; i <= 3; i++)
	{
		shoot(33, 0, _player, point_direction(x, y, _input.mouseX, _input.mouseY) + (i*10), 4);
	}
	reload = 30;
}

sniper = function(_input, _player)
{
	shoot(100, 0, _player, point_direction(x, y, _input.mouseX, _input.mouseY), 50);
	reload = 100;
}

hspd = 0;
vspd = 0;
spd = 1.2;
frictionDelayTime = 0;
rotation = 0;
playerSpeed = 1;
hp = 99;

//bash
bashPressed = true;
bashing = -1;
wallBash = false;
bashRecharge = 100;
bashes = 3;
bashX = 0;
bashY = 0;
wallBuffer = 0;

//jump
jumpHoldTime = 0;
jumpPressed = true;
coyoteTime = 0;

//buffers
jumpBuffer = 0;
bashBuffer = 0;

//attack
attackPressed = true;
reload = 0;
weapon = sniper;

with (oPlayerSpawner)
{
	if (player_id == other.player_id)
	{
		other.x = x;
		other.y = y;
		break;
	}
}

//instance_deactivate_all(true);
show_debug_overlay(true);
players ++;