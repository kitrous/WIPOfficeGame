//rec damage
	get_damaged(oDamageEnemy);

//chase player
	if instance_exists(oPlayer) && distance_to_object(oPlayer) < colDistance{
		dir = point_direction(x,y,oPlayer.x,oPlayer.y);
		spd = 2;
	} 
	
	//getting speeds
		xspd = lengthdir_x( spd, dir);
		yspd = lengthdir_y( spd, dir);

	//get correct face
	if xspd > 0 {
		face = 1;
	}
	if xspd < 0 {
		face = -1;
	}
		
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
		



//death
	if hp <= 0
	{
	instance_destroy();
	}