//movement used for a game jam i did
function MovementLogic() {
var _right = keyboard_check(ord("D"));
var _left = keyboard_check(ord("A"));
var _up = keyboard_check(ord("W"));
var _down = keyboard_check(ord("S"));


var _xinput = _right - _left;
var _yinput = _down - _up;

if (_xinput != 0 && _yinput != 0) {
	_xinput *= 0.7071;
	_yinput *= 0.7071;
}

x += _xinput * myspd;
y += _yinput * myspd;

}

myspd = 2.5;

function AimLogic() {
mouseDirection = point_direction(x,y,mouse_x,mouse_y);	

	
image_angle = (mouseDirection div 10) * 10;
}
