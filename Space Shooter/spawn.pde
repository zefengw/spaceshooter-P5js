//Displays enemy and makes it so that it follows the player in the x-direction at 2 pixels per frame. It spawns one at a time.
function enemySpawn(){
	if(back == space){
 		image(enemy, enemies[0].x, enemies[0].y, 50, 70);
		if(enemies[0].x > x) enemies[0].x-=2;
		else enemies[0].x+=2;
	}
}

//Displays obstacles and makes it so that it moves downward. If it goes off-screen, it is returned back to the top of the screen. It spawns all at once
function obstacleSpawn(){
	if(back == space){
	for (let i = 0; i < obstacleCount; i++){
 		image(asteroid, obstacles[i].x, obstacles[i].y, obstacles[i].size, obstacles[i].size);
		obstacles[i].y += obstacles[i].ySpeed;
		if (obstacles[i].y > height){
			obstacles[i].y = 0;
			obstacles[i].x = random(leftWall, rightWall);
		}
	}
}
}

//Displays coins and makes it so that they all fall at a constant speed. It spawns one at a time
function coinSpawn(){
	if(coins.length>0 && back == space){
		image(coin, coins[0].x, coins[0].y, 30,30);
		coins[0].y += 3;
	}
}
