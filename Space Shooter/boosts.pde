function checkBoost(){
	//Checks to see if there are any boosts that are active
if(activeBoosts.length > 0){
	//Will only iterate through this once the zeroth index(the only index) in activeBoosts will be removed after the boost wears off 
		switch(activeBoosts[0]) {
			case "addTurret":
				/*Check if the second turret has been added before. If that's true, add the third turret. */
				if (added2ndTurret){
					added3rdTurret = true;
				}
				textPhrase = "Added another turret";
				text(textPhrase, width/2, height/2);
				//Wait 4 seconds before removing the above text
				setTimeout(removeText, 4000);
				added2ndTurret = true;
				activeBoosts.shift();
			break;
			case "shrink":
				textPhrase = "Shrink";
				text(textPhrase, width/2, height/2);
				hSize = 25
				vSize = 35;
				//Waits 10 seconds before returning to normal size
				setTimeout(function(){
					boosts.push(activeBoosts[0]);
					activeBoosts.shift();
					hSize = 50;
					vSize = 70;
					removeText();
				}, 10000);
			break;
			case "speedUp":
				textPhrase = "Speed Up";
				text(textPhrase, width/2, height/2);
				speedup = true;
				//Waits 10 seconds before returning to normal speed
				setTimeout(function(){
					boosts.push(activeBoosts[0]);
					activeBoosts.shift();
					removeText();
					speedup = false;
				}, 10000);
			break;
			case "barrier":
				textPhrase = "Created Barrier for Player. Mouse Click to use.";
				text(textPhrase, width/2, height/2);
				//Activates barrier boost
				barrier = true;
				//Waits 10 seconds before removing the boost
				setTimeout(function(){
					boosts.push(activeBoosts[0]);
					activeBoosts.shift();
					removeText();
					barrier = false;
				}, 10000)
			break;
			case "gainLife":
				textPhrase = "Gain Life";
				text(textPhrase, width/2, height/2);
				lives++;
				//Removes above text after 4 seconds
				setTimeout(removeText, 4000);
				boosts.push(activeBoosts[0]);
				activeBoosts.shift();
			break;
		}
			
		}
	
}
