
var _right = keyboard_check(ord("D"));
var _left = keyboard_check(ord("A"));
var _up = keyboard_check(ord("W"));
var _down = keyboard_check(ord("S"));
shootKey = mouse_check_button(mb_left);
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


//move player
x += xspd;
y += yspd;


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

//shoot the weapon
	if shootKey {
	
	//create bullet
		var _xOffset = lengthdir_x( weaponLength + weaponOffsetDist, aimDir);
		var _yOffset = lengthdir_y( weaponLength + weaponOffsetDist, aimDir);
		var _bulletInst = instance_create_depth(x + _xOffset,centerY + _yOffset,depth-100,bulletObj);
	
	//change bullets direction
		with( _bulletInst ){
			dir = other.aimDir;
		}
	}
