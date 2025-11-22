//movement used for a game jam i did
function MovementLogic() {
var _right = keyboard_check(ord("D"));
var _left = keyboard_check(ord("A"));
var _up = keyboard_check(ord("W"));
var _down = keyboard_check(ord("S"));


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

}

myspd = 2.5;

function AimLogic() {
mouseDirection = point_direction(x,y,mouse_x,mouse_y);	

	
image_angle = (mouseDirection div 10) * 10;
}
