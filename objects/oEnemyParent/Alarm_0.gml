
if (instance_exists(oPlayer) && distance_to_object(oPlayer) < distance_to_player){
target_x = oPlayer.x;
target_y = oPlayer.y;

}
else
{
target_x = random_range(xstart - 100, xstart + 100);
target_y = random_range(ystart - 100, ystart + 100);
}

alarm[0] = 60;