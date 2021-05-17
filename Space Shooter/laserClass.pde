//Sets speed of the laser to be 1 pixel every frame
let sy = 1;
class Laser{
	//Lasers take in an initial x and y value
	constructor(xL, yL){
		this.x = xL;
		this.y = yL;
	}
	
	//Displays and creates laser
	create(){
		image(laserImage, this.x, this.y, 15, 30);
	}
	
	//Laser for player
	laser(){
		this.y -= sy;
		sy += 1;
		sy *= 0.95;
	}
	//Laser for enemy. It is slightly slower than player's laser
	enemyLaser(){
		this.y += sy;
		sy += 1;
		sy *= 0.9;
	}
	
}
