function checkLives(){
	if (lives <= 0){
		//changes background when player loses
			back = loseScreen;
		//Sets start equal to false so that objects stop spawning
			start = false;
		//Restarts if R is pressed
		if(keyIsDown(82)){
			back = space;
			reset();
			restart();
		//Brings back to Title Screen if T is pressed
		}else if(keyIsDown(84)){
			back = homeScreen;
			//Plays background music
			backgroundMusic.play();
			reset();
			restart();
		}
	}
}
