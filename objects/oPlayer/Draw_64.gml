//set font
	draw_set_font(JetBrains)
//show key is obtained to go to next room and plays sound
keyPlayed = false;
	if global.keyObtain == true	&& !keyPlayed
	{ 
		
		draw_text_scribble(room_width/2,room_height/3,"[rainbow][wave]Key Obtained");
		
		keyPlayed = true;
	}
	