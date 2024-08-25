function bash(_input, _length, _player_id, _add){
	var _dir = point_direction(x, y, _input.mouseX, _input.mouseY);
	if(_add)
	{
		hspd += lengthdir_x(_length, _dir);
		vspd += lengthdir_y(_length, _dir);
	}
	else
	{
		hspd = lengthdir_x(_length, _dir);
		vspd = lengthdir_y(_length, _dir);
	}
	frictionDelayTime = 35;
	var _part = instance_create_layer(x, y, "Midground", oBashParticle);
	_part.image_xscale = 0.5;
	_part.image_yscale = 0.5;
	_part.x = _player_id.x;
	_part.y = _player_id.y;
	_player_id.jumpHoldTime = 0;
}