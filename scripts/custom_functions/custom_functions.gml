//drawing players weapon
function draw_my_weapon(){
//draw the weapon

	//get the weapon off the player's body
	var _xOffset = lengthdir_x(weaponOffsetDist, aimDir );
	var _yOffset = lengthdir_y(weaponOffsetDist, aimDir);
var _weaponYsc1 = 1;

if aimDir > 90 && aimDir < 270{
_weaponYsc1 = -1;
}
draw_sprite_ext( weapon.sprite, 0 , x + _xOffset, centerY + _yOffset, 1,_weaponYsc1,aimDir,c_white,1);
}

//damage calculation
	//damage create event
	function get_damaged_create(_hp = 10)
	{
		hp = _hp;
		
		//create damage list
		damageList = ds_list_create();
	}
	
	//damage step event 
	function get_damaged(_damageObj) 
	{
	
	//rec damage
	if place_meeting(x , y, _damageObj){
		
		//getting list of damage instances
			//create ds list and copy instances to it
				var _instList = ds_list_create();
				instance_place_list(x,y,_damageObj,_instList, false);
			
			//size of our list
				var _listSize = ds_list_size(_instList);
			//loop through list
				for( var i = 0; i < _listSize; i++){
					var _inst = ds_list_find_value( _instList, i );
					
				//check if instance is already in the damage list
				if ds_list_find_index( damageList, _inst ) == -1
				{
				//add new damage instance to the damage list
					ds_list_add(damageList, _inst);
				//take damage from specific instance
					hp -= _inst.damage;
				
				//tell damage instance it has impacted
					_inst.hitConfirm = true;
				}
			}
		
			//free memory by destroying ds list
				ds_list_destroy(_instList);
}

	//clear the damage list of objects that dont exist anymore or arent touching anymore
		var _damageListSize = ds_list_size(damageList);
		for( var i = 0; i < _damageListSize; i++){
		//if not touching the damage instance anymore, remove it from the list and set loop back 1 position
			var _inst = ds_list_find_value( damageList, i );
			if !instance_exists(_inst) || !place_meeting(x, y, _inst)
			{
				ds_list_delete(damageList,i);
				i--;
				_damageListSize--;
			}
		}
	}
	