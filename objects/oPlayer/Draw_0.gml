//draw the weapon behind the player
	if aimDir >= 0 && aimDir < 180
	{
		draw_my_weapon();
	}

//draw player
	draw_self();


//draw the weapon
	if aimDir >= 180 && aimDir < 360
	{
		draw_my_weapon();
	}
	
//draw hp as number
	draw_set_colour(c_white);
	draw_text(x,y,string(hp));

