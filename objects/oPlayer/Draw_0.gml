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
	draw_text(x,y,string(hp));

//show key is obtained to go to next room
	if global.keyObtain == true	
	{ 
		draw_text(oPlayer.x,oPlayer.y,"Key Obtained"); 
	}