//damagesetup
	get_damaged_create(20, true);
	


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
	
	//add weapons to player weapon inv
	array_push(global.PlayerWeapons,global.weaponList.shotgun );
	array_push(global.PlayerWeapons, global.weaponList.AR );
	
	
	selectedWeapon = 0;
	weapon = global.PlayerWeapons[1];

