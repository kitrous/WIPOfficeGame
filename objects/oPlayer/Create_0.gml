//movement used for a game jam i did
function MovementLogic() {
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
#endregion
}

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
	bulletObj = oBullet;