
var _right = keyboard_check(ord("D"));
var _left = keyboard_check(ord("A"));
var _up = keyboard_check(ord("W"));
var _down = keyboard_check(ord("S"));
shootKey = mouse_check_button(mb_left);
swapKeyPressed = mouse_check_button_pressed(mb_right);

//player movement+collision
#region
var _xinput = _right - _left;
var _yinput = _down - _up;


var _spd = 0;
moveDir = point_direction(0,0,_xinput,_yinput);

var _inputLevel = point_distance(0,0,_xinput,_yinput);
_inputLevel = clamp(_inputLevel,0,1);
_spd = myspd * _inputLevel;

xspd = lengthdir_x(_spd,moveDir);
yspd = lengthdir_y(_spd,moveDir);

//collision
if place_meeting(x + xspd, y, oCollisionWall){
xspd = 0;
}
if place_meeting(x,y + yspd, oCollisionWall){
yspd = 0;
}

if place_meeting(x + xspd, y, oDoor) && global.keyObtain && global.enemiesCleared == true{
room_goto_next()
}
if place_meeting(x,y + yspd, oDoor)&& global.keyObtain && global.enemiesCleared == true {
room_goto_next()
}


//move player
x += xspd;
y += yspd;


//get damaged
get_damaged(oDamagePlayer, true);

//aiming
	centerY = y + centerYOffset;
	aimDir = point_direction(x,centerY,mouse_x,mouse_y);



//sprite control
	//make sure player is facing the correct direction
	face = round(aimDir/90);
	if face == 4 { face = 0; };
	
	//animate
	if xspd == 0 && yspd == 0{
	image_index = 0;
	
	}
	//set player sprite
	mask_index = sprite[3];
	sprite_index = sprite[face];
	
	//depth 
	depth = -bbox_bottom;

//weapon swapping
	var _playerWeapons = global.PlayerWeapons;
		
		//cycle through weapons
		if swapKeyPressed
		{
			//change selection 
			selectedWeapon++;
			if selectedWeapon >= array_length(_playerWeapons) { selectedWeapon = 0; };
			
			//set new weapon
			weapon = _playerWeapons[selectedWeapon];
		}

//shoot the weapon
if shootTimer > 0 { shootTimer--; };

	if shootKey && shootTimer <= 0
	{
	//reset timer
		shootTimer = weapon.cooldown;
	//create bullet
		var _xOffset = lengthdir_x( weapon.length + weaponOffsetDist, aimDir);
		var _yOffset = lengthdir_y( weapon.length + weaponOffsetDist, aimDir);
		
		var _spread = weapon.spread;
		var _spreadDiv = _spread / max(weapon.bulletNum-1,1);
		
		//creates number of bullet
		for ( var i = 0; i < weapon.bulletNum; i++ )
		{
			var _bulletInst = instance_create_depth(x + _xOffset,centerY + _yOffset,depth-100,weapon.bulletObj);
	
		//change bullets direction
			with( _bulletInst )
			{
				dir = other.aimDir - _spread/2 + _spreadDiv*i;
				
				//turn bullet
				if dirFix == true{
				image_angle = dir;
				}
			}
	}
	}
	
if hp <= 0
{
	room_restart();
}