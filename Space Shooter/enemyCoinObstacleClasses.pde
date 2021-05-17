class Enemy{
	//Creates enemy taking in an x and y coordinate
	constructor(xE, yE){
	this.x = xE;
	this.y = yE; 
	}
}
class Coins{
	//Creates coin and takes in an initial x and y coordinate
	constructor(xC, yC){
		this.x=xC;
		this.y=yC;
	}
}
class Obstacle{
	//Creates an obstacle that takes in an initial x and y coordinate, size, and speed
	constructor(xO, yO, sizeO, ySpeedO){
		this.x = xO;
		this.y= yO;
		this.size = sizeO;
		this.ySpeed = ySpeedO;
	}
}
