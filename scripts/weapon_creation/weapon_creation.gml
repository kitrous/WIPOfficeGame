//constructor template for weapons
function create_weapon( _sprite = sShotgun, _length = 0, _bulletObj = oBullet, _cooldown= 1, _bulletNum = 1, _spread = 0) constructor
{
	sprite = _sprite;
	length = _length;
	bulletObj = _bulletObj;
	cooldown = _cooldown;
	bulletNum = _bulletNum;
	spread = _spread;
	
}

//player weapon inv
global.PlayerWeapons = array_create(0);

//weapons

global.weaponList = {

	shotgun : new create_weapon(sShotgun, sprite_get_bbox_right(sShotgun) - sprite_get_xoffset(sShotgun),oBullet,25,4,45),
	AR :  new create_weapon(sAR, sprite_get_bbox_right(sAR) - sprite_get_xoffset(sAR),oBulletAR, 4,1,0),
}

	