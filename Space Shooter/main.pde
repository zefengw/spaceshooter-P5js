//Player Coordinates
var x, y; 
//Player Movement Directions
var keyLeft, keyRight, keyUp, keyDown;
//Background
var back;
//Player Dimensions
var hSize, vSize;
//Boundaries
var leftWall, rightWall;
//Player Speeds
var xSpeed, ySpeed;
//Lasers from Players
var lasers = [];
//Lasers from Enemies
var enemyLasers = [];
//All Boosts
var boosts;
//Active Boosts on Player
var activeBoosts = [];
//Add Turret Boost. Stores booleans 
var added2ndTurret, added3rdTurret;
//Store Enemy Objects. If enemy dies, remove it from array
var enemies = [];
//Store obstacle objects. If crash into obstacle remove it from array. Click with mouse to destroy to raise intensity of game
var obstacles = [];
//Stores coin objects to collect
var coins = [];
//Player Lives, Score, the number of coins collected by player, and the level
var lives, score, coinCount, level
//Boolean to track when game started
var start;
//Booleans for Boosts to indicate if they are active. Remove Turret Boost will indicate that the player reached the maximum amount of turrets possible.
var addedTurret, speedup, barrier, removeTurretBoost;
//Used to add/remove text on canvas
var textPhrase;
//Used to store objects upon collision
var temp;
//Boolean used in collisions 
var hit, hitPlayer;
//Stores the number of obstacles, enemies, or coins that will spawn during levels
var obstacleCount, enemyCount, coinCounter;

function restart(){
	//RemoveTurretBoost: true when the maximum number(3) of turrets is reached and removes that boost from the array
	boosts = (removeTurretBoost ? shuffle(["shrink", "speedUp", "barrier", "gainLife"]) : shuffle(["shrink", "speedUp", "barrier", "gainLife", "addTurret"]));
	//Only if player dies, will they lose all of their coins. 
	if(lives <= 0){
		coinCount = 0;
	}
	lives = 5;
	//Starting position
	x = width/2;
	y = height- 100;
	score = 0;
	textPhrase = "";
	start = true;
	barrier = false;
	//Re-creates all required objects
	for(let i = 0; i < obstacleCount; i++){
		obstacles.push(new Obstacle(random(leftWall, rightWall), 0, random(30, 50), random(5, 10)));
	}
	for(let i = 0; i < enemyCount; i++){
		enemies.push(new Enemy(x, random(0, 100)));
	}
for(let i = 0; i < coinCounter; i++){
		coins.push(new Coins(random(leftWall,rightWall), 0));
	}
}

function setup() {
	//Defining all variables
	boosts = shuffle(["addTurret", "shrink", "speedUp", "barrier", "gainLife"]);
	added2ndTurret = false;
	added3rdTurret = false;
	removeTurretBoost = false;
	lives = 5;
	back = homeScreen;
	background(back);
	leftWall = 10;
	rightWall = 715;
  createCanvas(windowWidth/2, windowHeight);
	xSpeed = 0;
	ySpeed = 0;
	//Player Initial Position
	x = width/2;
	y = height- 100;
	
	hSize = 50;
	vSize = 70;
	level = 1;
	coinCount = 0;
	score = 0;
	textPhrase = "";
	/*Creating the amount of objects for level 1. 
		There will be 10 obstacles(i.e., asteroids), 10 enemies, and 20 coins throughout the first level
	*/
	obstacleCount = 10;
	for(let i = 0; i < obstacleCount; i++){
		//Creates an obstacle object with a random x-coordinate that is between the boundaries, a y-coordinate of zero, a random size between 30 and 50 pixels,
		//and a random speed  
		obstacles.push(new Obstacle(random(leftWall, rightWall), random(10, 30), random(30, 70), random(5, 10)));
	}
	enemyCount = 10;
	for(let i = 0; i < enemyCount; i++){
		//Creates an enemy that has the same x-coordinate as the player and a random y-coordinate between 0 and 100 pixels
		enemies.push(new Enemy(x, random(0, 100)));
	}
	coinCounter = 20;
	for(let i = 0; i < coinCounter; i++){
		//Creates coins with a random x-coordinate within the boundaries and an initial y-coordinate of 0
		coins.push(new Coins(random(leftWall,rightWall), 0));
	}
	start = false;
	hit = false;
	barrier = false;
	hitPlayer = false;
	//Background Music
	backgroundMusic.play();
}

function preload(){
	//Loading all images and sounds
	space = loadImage("nasa-galaxy_9pu4.jpg");
	player = loadImage("ClipartKey_146283.png");
	enemy = loadImage("073aeb9a8d0271e.png");
	asteroid = loadImage("unnamed.png");
	laserImage = loadImage("laser.png");
	loseScreen = loadImage("loseScreenUpdated1.png");
	homeScreen = loadImage("homeScreenUpdated.png");
	coin = loadImage("c12dc536b8f8797b629eb9942a2dbbf1.gif");
	instructions = loadImage("instructions.png");
	winningScreen = loadImage("winningScreenUpdated.png");
	fireSound = loadSound("Fire.wav");
	dieSound = loadSound("Die.wav");
	backgroundMusic = loadSound("443865__vabsounds__laserattack.wav");
}

function draw() {
	//Aligns all text to the center of the screen
	textAlign(CENTER, CENTER);
  background(back);
	//Checks if start is true. If so, it spawns all of the objects
	if(start){
		obstacleSpawn();
		enemySpawn();
		coinSpawn();
	}
	checkLives();
	checkHome();
	//Sets boundaries for x
  x = constrain(x, leftWall, rightWall);
	//Creates Player
  image(player,x, y, hSize, vSize);
	//Change speed based on current keys pressed.
  countSpeed();   
	//Change position based on speed.
  changePosition(); 
	checkScore();
	
	
	//Sets all text to white and size 20
	fill('white');
	textSize(20);
	//Creates on-screen text that displays score, coins, lives, and level
	text("Score: " + score, 670, 50);
	text("Coins: " + coinCount, 670, 70);
	text("Lives: " + lives, 60, 50);
	text("Level: " + level, 60, height-20);
	/*Decelerates the ship's speed so that the player speed doesn't go crazy 
		If the speedup boost is active, it decelerates the ship by a less amount(5%) and thus the ship becomes faster than before the boost.
	*/
	xSpeed *= (speedup ? 0.95 : 0.9); 
  ySpeed *= (speedup ? 0.95 : 0.9);
	
	checkBoost();
	//If both the second turret and the third turret has been added, remove the addTurret buff entirely
	if(added2ndTurret && added3rdTurret){
		removeTurretBoost = true;
	}
	
	collision();
	
	//Checks the number of coins to allow player to use a boost
	if (coinCount >= 10){
		textPhrase = "Press J to use your boost";
		text(textPhrase, width/2, height/2);
		if (keyIsDown(74)){
			coinCount -= 10;
			activeBoosts.push(boosts[0]);
			boosts.shift();
		}
	}
	
}

//Used to remove text from screen 
function removeText(){
	textPhrase = "";
}

//Removes all of the coin objects, obstacles, enemies, and boosts. This is so that excess objects don't spawn each time player dies or goes on to a new level 
function reset(){
	coins = [];
	obstacles = [];
	enemies = [];
	activeBoosts = [];
}

/*Checks to see if player is on the home screen and is pressing a button or clicking something that is not "T".
This is because when a player dies, it let's them return to the home screen by pressing "T" on the keyboard, making it so that the game doesn't start
as soon as player is redirected to homescreen. This also works when the mouse is pressed
*/
function checkHome(){
	if (back == homeScreen && ((keyIsPressed && !keyIsDown(84) || mouseIsPressed))){
			start = true;
			back = space;
		//Pauses background music
			backgroundMusic.pause();
	}
}



