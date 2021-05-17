//Checks where your mouse coordinates to know which direction you want to dash in. 
//If your mouse is to the right of the player, you will dash right and vice versa
function doubleClicked(){
	if(mouseX > x){
		x += 150;
	}else if(mouseX < x){
		x -=150;
	}
}	

//Adds to the current speed depending on which condition is met(which button is hit)
function countSpeed(){
  if(keyLeft) xSpeed-= 0.5;
  if(keyRight) xSpeed+= 0.5;
  if(keyUp) ySpeed-= 0.5;
  if(keyDown) ySpeed+= 0.5;
}

//Adds speed to player
function changePosition(){
  x+=xSpeed;
  y+=ySpeed;
}

//Sets the booleans to true depending on which buttons is hit
function keyPressed() {
     if (key == "w") {
      keyUp = true;
    }
    if (key == "s") {
      keyDown = true;
    }
    if (key == "a") {
      keyLeft = true;
    }
    if (key == "d") {
      keyRight = true;
    }
		
	//New Fire Laser Component that goes on forever
		if(key == " " && back==space){
			//Creates laser object and appends it to laser array
			lasers.push(new Laser(x+15,y));
			//Creates another laser object if the addTurret boost is activated
			if (added2ndTurret){
				lasers.push(new Laser(x, y));
			}
			if(added3rdTurret){
				lasers.push(new Laser(x+30, y));
			}
			//Plays fire sound
			fireSound.play();
		}
	//Displays instruction screen if "I" is pressed
	if(key == "i" && back == homeScreen){
			back = instructions;
		}
	//Fires enemy laser when any button is pressed 
	if(back == space) enemyLasers.push(new Laser(enemies[0].x, enemies[0].y));
	
}
//Sets boolean to false when it isn't pressed
function keyReleased() {
    if (key == "w") {
      keyUp = false;
    }
    if (key == "s") {
      keyDown = false;
    }
    if (key == "a") {
      keyLeft = false;
    }
    if (key == "d") {
      keyRight = false;
		}
	//Removes instruction screen when "I" is released
		if(key == "i" && back == instructions){
			back = homeScreen;
		}

}
