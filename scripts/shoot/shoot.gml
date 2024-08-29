function shoot(_dmg, _knock_back, _player, _dir, _life){
	var _proj = instance_create_layer(x, y, "Midground", oProjectile);
	_proj.direction = _dir
	_proj.image_angle = _dir
	_proj.x += lengthdir_x(70, _dir);
	_proj.y += lengthdir_y(70, _dir);
	_proj.life = _life;
	_proj.dmg = _dmg;
	_player.hspd += lengthdir_x(_knock_back, _dir+180)
	_player.vspd += lengthdir_y(_knock_back, _dir+180)
	_player.jumpHoldTime = 0;
	_player.frictionDelayTime = 0;
}