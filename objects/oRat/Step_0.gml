
//chase player
	if instance_exists(oPlayer){
		dir = point_direction(x,y,oPlayer.x,oPlayer.y);
	}
		
	//getting speeds
		xspd = lengthdir_x( spd, dir);
		yspd = lengthdir_y( spd, dir);
	
	//collision
	if place_meeting( x + xspd,y,oCollisionWall) || place_meeting( x + xspd,y,oEnemyParent)
	{
		xspd = 0;
	}
	if place_meeting(x,y+yspd,oCollisionWall) || place_meeting(x, y + yspd,oEnemyParent)
	{
		yspd = 0;
	}
	//moving
		x += xspd;
		y += yspd;
	


	// damaged and dying
		event_inherited();


