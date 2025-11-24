


myspd = 2.5;



//sprite control
	face = 3;
	sprite[0] = sPlayerRight;
	sprite[1] = sPlayerUp;
	sprite[2] = sPlayerLeft;
	sprite[3] = sPlayerDown;
	
	weaponOffsetDist = 2;
	
	
	centerYOffset = -4;
	centerY = y + centerYOffset;// set in step event
	aimDir = 0;

//weaponinfo
	shootTimer = 0;
	
	
	
	
	
	shotgun = {
		sprite : sShotgun,
		length : sprite_get_bbox_right(sShotgun) - sprite_get_xoffset(sShotgun),
		bulletObj : oBullet,
		cooldown : 25,
	}

weapon = shotgun;