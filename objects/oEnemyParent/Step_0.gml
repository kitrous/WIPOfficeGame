//rec damage
	if place_meeting(x , y, oDamageEnemy){
		
		//getting list of damage instances
			//create ds list and copy instances to it
				var _instList = ds_list_create();
				instance_place_list(x,y,oDamageEnemy,_instList, false);
			
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
				
				//tell damage to destroy itself
					_inst.destroy = true;
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
//death
	if hp <= 0
	{
	instance_destroy();
	}