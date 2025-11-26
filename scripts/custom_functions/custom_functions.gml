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
draw_sprite_ext( weapon.sprite, 0 , x + _xOffset, centerY + _yOffset, 1,_weaponYsc1,aimDir,c_white,image_alpha);
}

//damage calculation
	//damage create event
	function get_damaged_create(_hp = 10, _iframes = false)
	{
		hp = _hp;
		
		//get the iframes
		if _iframes == true
		{
			iframeTimer = 0;
			iframeNumber = 90;
		}
		
		//create damage list
		if _iframes == false
		{
		damageList = ds_list_create();
		}
	}
	
	//damage cleanup event
	function get_damaged_cleanup()
	{
		//not needed if using iframes
		
		//delete our damage list data structure to free memory
		ds_list_destroy(damageList);
	}
	
	//damage step event 
	function get_damaged(_damageObj, _iframes = false) 
	{
		//special exit for iframe timer
		if _iframes == true && iframeTimer > 0 
	{
		iframeTimer--;
		
		if iframeTimer mod 5 == 0
		{
			if image_alpha == 1
			{
				image_alpha = 0;
			} else {
				image_alpha = 1;
			}
		}
		exit;
	}
	
	//make sure iframe blinking stops
	if _iframes == true {image_alpha = 1;}

	
	
	//rec damage
	if place_meeting(x , y, _damageObj){
		
		//getting list of damage instances
			//create ds list and copy instances to it
				var _instList = ds_list_create();
				instance_place_list(x,y,_damageObj,_instList, false);
			
			//size of our list
				var _listSize = ds_list_size(_instList);
			//loop through list
			var _hitConfirm = false;
			
				for( var i = 0; i < _listSize; i++){
					var _inst = ds_list_find_value( _instList, i );
					
				//check if instance is already in the damage list
				if	_iframes == true || ds_list_find_index( damageList, _inst ) == -1
				{
				//add new damage instance to the damage list
				if _iframes == false
				{
					ds_list_add(damageList, _inst);
				}
				//take damage from specific instance
					hp -= _inst.damage;
				_hitConfirm = true;
				//tell damage instance it has impacted
					_inst.hitConfirm = true;
				}
			}
			//set iframes if hit
			if _iframes == true && _hitConfirm
			{
			iframeTimer = iframeNumber;
			
			}
			
			//free memory by destroying ds list
				ds_list_destroy(_instList);
}

	//clear the damage list of objects that dont exist anymore or arent touching anymore
	if _iframes == false
	{
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
	}
	