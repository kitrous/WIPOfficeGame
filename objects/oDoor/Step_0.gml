//if enemy doesnt exist anymore, enemy check is true
	if !instance_exists(oEnemyParent){
		global.enemiesCleared = true;
	}
//if enemy is cleared and keyObtain is true then door lock is true which means they are cleared to go to next room
	if global.enemiesCleared == true && global.keyObtain == true 
	{
		
		global.doorLock = true;
	}