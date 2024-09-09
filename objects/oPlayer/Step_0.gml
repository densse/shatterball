//var _right = keyboard_check(ord("D"));
//var _left = keyboard_check(ord("A"));
//var _bash = mouse_check_button_pressed(mb_right);
//var _jump = keyboard_check_pressed(ord("W"));
//var _jump_hold = keyboard_check(ord("W"));

var _input = rollback_get_input();

var _jump_pressed = false
if(_input.jump && jumpPressed = false)
{
	jumpPressed = true;
	_jump_pressed = true;
}
else if(!_input.jump)
{
	jumpPressed = false
}
var _bash_pressed = false
if(_input.bash && bashPressed = false)
{
	bashPressed = true;
	_bash_pressed = true;
}
else if(!_input.bash)
{
	bashPressed = false
}

var _attack_pressed = false
if(_input.attack && attackPressed = false)
{
	attackPressed = true;
	_attack_pressed = true;
}
else if(!_input.attack)
{
	attackPressed = false
}


if(hspd > 40)
{
	hspd = 40;
}
if(hspd < -40)
{
	hspd = -40;
}
if(vspd > 40)
{
	vspd = 40;
}
if(vspd < -40)
{
	vspd = -40;
}


if(_input.jump && jumpHoldTime > 0)
{
	vspd += 0.4*playerSpeed;
	//frictionDelayTime = 2;
}
else
{
	vspd += 0.7*playerSpeed;
}

if(frictionDelayTime < 0)
{
	if(hspd < 7 && hspd > -7)
	{
		hspd += (_input.right-_input.left)*spd*playerSpeed;
	}
	//hspd /= ((0.01*playerSpeed) + 1);
	if(hspd > 0)
	{
		hspd -= 0.2;
	}
	
	if(vspd > 0)
	{
		vspd -= 0.2;
	}
	if(hspd < 0)
	{
		hspd += 0.2;
	}
	
	if(vspd < 0)
	{
		vspd += 0.2;
	}
	//vspd /= ((0.01*playerSpeed) + 1);
}
else
{
	hspd += (_input.right-_input.left)*spd*playerSpeed*0.25;
}


if(place_meeting(x+hspd, y, oSolid))
{
	var _increment = hspd/abs(hspd)
	while(!place_meeting(x + _increment, y, oSolid))
	{
		x += _increment;
	}
	if(hspd > 10 or hspd < -10)
	{
		hspd *= -1;
		wallBuffer = 8;
	}
	else
	{
		hspd = 0;
	}
}
else
{
	x += (hspd*playerSpeed);
}

if(place_meeting(x, y+vspd, oSolid))
{
	var _increment = vspd/abs(vspd)
	while(!place_meeting(x, y + _increment, oSolid))
	{
		y += _increment;
	}
	if(vspd > 10 or vspd < -10)
	{
		vspd *= -1;
		wallBuffer = 8;
	}
	else
	{
		vspd = 0;
	}
	
	coyoteTime = 5;
}
else
{
	y += (vspd * playerSpeed);
}

if(jumpBuffer > 0 && coyoteTime > 0)
{
	vspd =-14;
	jumpHoldTime = 20;
	//frictionDelayTime = 0;
}

if(bashBuffer > 0  && bashes > 0 && wallBuffer > 0)
{
	bashBuffer = 0;
	wallBuffer = 0;
	//bashes -= 1;
	//bash(_input, 10, self, true);
	bashing = 50;
	wallBash = true;
	bashX = x;
	bashY = y;
}

var _dist = 100;
var _dash = -1;
with(oDash)
{
	var _dash_dist = point_distance(x, y, other.x, other.y);
	if(_dash_dist < _dist)
	{
		_dist = _dash_dist;
		_dash = self;
	}
}

if(_jump_pressed)
{
	jumpBuffer = 6
}

if(_bash_pressed)
{
	bashBuffer = 10;
}
if(bashBuffer > 0 && _dash != -1 && bashes > 0)
{
	bashes -= 1;
	bashRecharge = 100;
	bashing = 50;
	bashBuffer = 0;
	frictionDelayTime = 0;
	bashX = _dash.x;
	bashY = _dash.y;
	//bash(_input, 25, self, false);
}

if(bashing >= 0)
{
	//show_debug_message(bashing);
	if(!_input.bash or bashing == 0)
	{
		if(wallBash)
		{
			bash(_input, 10, self, true);
			wallBash = false;
		}
		else
		{
			bash(_input, 23, self, false);
		}
		bashing = 0;
		playerSpeed = 1;
	}
	else if(playerSpeed > 0)
	{
		playerSpeed -= 0.2;
	}
}

if(_input.attack && reload < 0)
{
	weapon(_input, self);
}

if(bashRecharge <= 0)
{
	if(bashes < 3)
	{
		bashes += 1;
		bashRecharge = 100;
	}
}

if(_input.sniper)
{
	weapon = sniper;
	reload = 0;
}
else if(_input.machinegun)
{
	weapon = machinegun;
	reload = 0;
}
else if(_input.shotgun)
{
	weapon = shotgun;
	reload = 0;
}
//variable upkeep
jumpBuffer -= playerSpeed;
jumpHoldTime -= playerSpeed;
bashBuffer -= playerSpeed;
if(frictionDelayTime >= 0)
{
	instance_create_layer(x, y, "Midground", oBashParticle);
	frictionDelayTime -= playerSpeed;
}
reload -= playerSpeed;
bashRecharge -= playerSpeed;
bashing -= 1;
wallBuffer -= playerSpeed;
coyoteTime -= 1;

//camera
rotation -= hspd*0.03*playerSpeed;
rotation /= 1+(0.1*playerSpeed);
if (player_local)
{
	var _size = max(abs(rotation)*0.2, 1)
	camera_set_view_angle(view_camera[0], rotation);
	camera_set_view_pos(view_camera[0], clamp(x-960, 0,room_width-1920), clamp(y-540, 0, room_height-1080));
	camera_set_view_size(view_camera[0], 1920 * _size, 1080 *_size);
}