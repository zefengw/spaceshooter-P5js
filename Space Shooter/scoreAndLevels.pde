function next(){
	//Creates message that prompts user to move on to the next level
	textPhrase="Press N to Advance to the next level";
	text(textPhrase, width/2, height/2);
}
function checkScore(){
	if (score >= 20 && level == 1){
		next();
		//If N is pressed...
		if(keyIsDown(78)){
			level = 2;
			removeText();
			//Sets the number of obstacles, coins, and enemies for level 2 
			obstacleCount = 15;
			coinCounter = 30;
			enemyCount = 15;
			//Calls reset to remove all objects
			reset();
			//Calls restart to re-create the objects with the designated number of obstacles, coins, and enemies for that level
			restart();
		}
	}
	//Similar patterns for other levels
	if (score >= 30 && level == 2){
		next();
		if(keyIsDown(78)){
			level = 3;
			removeText();
			obstacleCount = 20;
			coinCounter = 40;
			enemyCount = 20;
			reset();
			restart();
		}	
	}
	if (score >= 40 && level == 3){
		next();
		if(keyIsDown(78)){
			level = 4;
			removeText();
			obstacleCount = 25;
			coinCounter = 50;
			enemyCount = 25;
			reset();
			restart();
		}	
	}
	if (score >= 50 && level == 4){
		next();
		if(keyIsDown(78)){
			level = 5;
			removeText();
			obstacleCount = 30;
			coinCounter = 60;
			enemyCount = 30;
			reset();
			restart();
		}	
	}
	if (score >= 60 && level == 5){
		//Sets the amount of each object to zero because reaching level 5 and having a score greater than or equal to 60 means you won 
		obstacleCount = 0;
		coinCounter = 0;
		enemyCount = 0;
		reset();
		restart();
		//Changes background to the winning background
		back = winningScreen;
	}
}

