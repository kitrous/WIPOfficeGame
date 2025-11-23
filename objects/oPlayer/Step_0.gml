
MovementLogic();

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