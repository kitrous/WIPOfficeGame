//center on player
if instance_exists( oPlayer )
{
	x = oPlayer.x;
	y = oPlayer.centerY;

}

// set cam pos
camera_set_view_pos(view_camera[0], x,y)