function collision(){
	//Barrier Boost and Collisions. Checks to see if barrier boost is active, the game has started, and if player is trying to use it
	if(mouseIsPressed && back==space && barrier){
		//Creates barrier
			rect(mouseX, mouseY, 100, 10);
		
		//Collision with Barrier and Obstacles
		for (let i = 0; i < obstacleCount; i++){
			//Boolean to check if the barrier collided with any obstacle
				hit = collideRectCircle(mouseX, mouseY, 100, 10, obstacles[i].x, obstacles[i].y, obstacles[i].size);
				if(hit){
					//Removes the colliding obstacle from array
					temp = obstacles.splice(i, 1);
					//But also appends it to the back of the array so that the number of obstacles(obstacleCount) stays the same, and doesn't cause an ArrayOutOfBounds Error
					//The obstacle also won't display after being appended to the end of the array because that requires another loop.
					obstacles.push(temp);
					score++;
					//Plays Die Sound
					dieSound.play();
					break;
				}
		}
		//Collision with Barrier and Enemy Lasers
		for(let j = 0; j < enemyLasers.length; j++){
			//Boolean to check if the barrier collided with any enemy lasers
			hit = collideRectRect(mouseX, mouseY, 100, 10, enemyLasers[j].x, enemyLasers[j].y, 15, 30);
			if(hit){
				//If so, remove the laser from the screen
				enemyLasers.splice(j, 1);
			}
		}
		}
	
	//Prevents players from going below or above the screen
	if (y < 0  || y > height- 50) {
		ySpeed *= -1;
  }
	
	//Firing laser
	if (lasers.length > 0){
		for (let i = 0; i < lasers.length; i++){
			//Creates laser for each laser in the array and moves it accordingly
			lasers[i].create();
			lasers[i].laser();
			//Removes laser if it goes passed the screen to make game run more smoothly
			if(lasers[i].y < 0){
				lasers.splice(i, 1);
			}
		}
	}
	//Enemy Firing Laser
	if (enemyLasers.length > 0){
		for (let i = 0; i < enemyLasers.length; i++){
			//Creates enemy laser for each enemy laser in the array and moves it accordingly
			enemyLasers[i].create();
			enemyLasers[i].enemyLaser();
			
			//Enemy Laser and Player Collision Check
			hitPlayer = collideRectRect(enemyLasers[i].x, enemyLasers[i].y, 15, 30, x, y, hSize, vSize);
			if(hitPlayer){
				//If enemy laser collides with player, remove the enemy laser and make player lose a life.
				enemyLasers.splice(i, 1);
				if(!(lives <= 0)){
					lives--;					
				}
				dieSound.play();
				break;
			}
			//Removes enemy laser if it goes passed the screen to make game run more smoothly
			if(enemyLasers[i].y > height){
				enemyLasers.splice(i, 1);
			}
		}
	}
	
	
//Coin and Player Collision
	//Checks to see if there are still coins in the array
	if(coins.length > 0){
		//Boolean to check if the player collides with a coin
	hitPlayer = collideRectCircle(x, y, hSize, vSize, coins[0].x, coins[0].y, 30);
	if(hitPlayer){
		//Increments the number of coins and removes it from the array
		coinCount++;
		coins.shift();
	}else if(coins[0].y > height){
		//Also removes coin from array if it goes past the screen
		coins.shift();
	}
	}
	
//Enemy and Player Collision
for(let i = 0; i < enemyCount; i++){
	//Boolean to check if the player collides with an enemy
	hitPlayer = collideRectRect(x, y, hSize, vSize, enemies[i].x, enemies[i].y, 50, 70);
	if(hitPlayer){
		//If so, deletes the enemy as well as removing a life from the player and incrementing the score
		temp = enemies.splice(i, 1);
		if(!(lives <= 0)){
					lives--;					
				}
		score++;
		enemies.push(temp);
		dieSound.play();
		break;
	}
}
	// Laser and enemy collision
	for(let j = 0; j < lasers.length; j++){
		for(let i = 0; i < enemyCount; i++){
			//Boolean to check if the laser collides with the enemy ship
		hit = collideRectRect(enemies[i].x, enemies[i].y, 50, 70, lasers[j].x, lasers[j].y, 15, 30);
		if(hit){
			//If so, remove the enemy and laser from screen
			temp = enemies.splice(i, 1);
			lasers.splice(j, 1);
			//Pushes enemy back to array so that enemyCount stays constant
			enemies.push(temp);
			score++;
			dieSound.play();
			break;
		}

	}
	}
	
	//Obstacles and Player Collision
	for(let i = 0; i < obstacleCount; i++){
		//Boolean to check if the player collides with an obstacle
		hitPlayer = collideRectCircle(x, y, hSize, vSize, obstacles[i].x, obstacles[i].y, obstacles[i].size);
		if(hitPlayer){
			//If so remove obstacle from array and appends it to the array
			temp = obstacles.splice(i, 1);
			//Increments score and decrements lives
			score++;
			if(!(lives <= 0)){
					lives--;					
				}
			obstacles.push(temp);
			dieSound.play();
			break;
		}
		
		
	}

	//Collision with laser and obstacles
	for (let i = 0; i < lasers.length; i++){
		for(let j = 0; j < obstacleCount;j++){
			//Boolean to check if the player's laser collides with any obstacle
			hit = collideRectCircle(lasers[i].x, lasers[i].y, 15, 30, obstacles[j].x, obstacles[j].y, obstacles[j].size);
			if(hit){
				//If so remove obstacle from array, obstacles, and append it back to obstacles
				temp = obstacles.splice(j, 1);
				//Remove laser from array and increment score
				lasers.splice(i, 1);
				obstacles.push(temp);
				score++;
				dieSound.play();
				break;
			}
	}
	}
}
