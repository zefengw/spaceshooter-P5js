var x = 50, y = 50; //Default ball position

//First Paddle
var speedX = 3, speedY = 3;
var xRect = 200, yRect = 20;
//Score for both Players
var score1 = 0, score2 = 0;
//Lives for both Players
var lives = 3, lives2 = 3;
//Second Paddle
var xRect2 = 200, yRect2 = 360;

function preload(){
	table = loadImage('Untitled.png');
}


function setup() {
	createCanvas(600,400);
	back = table;
	background(back);
	
}

function draw() {
	background(back);
	textSize(12);
	text("Win by making your opponent run out of lives or reach a score of 50 first", 60, 150)
	ls();
	//Create Shapes
	ellipse(x, y, 20, 20);//ball
	rect(xRect, yRect,40,20);  //paddle
	rect(xRect2, yRect2, 40, 20);
	//Change speed of ball
	x+=speedX;
	y+=speedY;
	
	checkSides();
  touchStarted();
	
	//collision code
	checkPaddleCollision();
}





