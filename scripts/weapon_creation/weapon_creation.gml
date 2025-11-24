//constructor template for weapons
function create_weapon( _sprite = sShotgun, _length = 0, _bulletObj = oBullet, _cooldown= 1) constructor
{
	sprite = _sprite;
	length = _length;
	bulletObj = _bulletObj;
	cooldown = _cooldown;
	
}

//player weapon inv
global.PlayerWeapons = array_create(0);

//weapons

global.weaponList = {

	shotgun : new create_weapon(sShotgun, sprite_get_bbox_right(sShotgun) - sprite_get_xoffset(sShotgun),oBullet,25),
	AR :  new create_weapon(sAR, sprite_get_bbox_right(sAR) - sprite_get_xoffset(sAR),oBulletAR, 4),
}

	