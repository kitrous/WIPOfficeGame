//move
	xspd = lengthdir_x(spd,dir);
	yspd = lengthdir_y(spd,dir);
	
	x += xspd;
	y += yspd;
	
	
	
	
	
		//destroy
	if destroy == true{
		instance_destroy();
	
	}
	//collision
	if place_meeting(x,y,oSolidWall)
	{
		destroy = true;
	}
	
	//bullet out of range
	if point_distance(xstart,ystart,x,y) > maxDist
	{
		destroy = true;
	}
	
	