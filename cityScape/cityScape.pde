
var x = 0, y = 500;
var moonX = 0, moonY = 500;
var speedXM = 0, speedYM = 0;
var speedX = 2, speedY = 1; 
var myRans, back;


function preload(){
	sunrise = loadImage('https://openprocessing-usercontent.s3.amazonaws.com/files/user271443/visual1185282/h1a9d6a9c9724f3cedc0d244f97a1caf5/20201011-sunrise-toronto.jpg');
	midday = loadImage('https://openprocessing-usercontent.s3.amazonaws.com/files/user271443/visual1185282/h1a9d6a9c9724f3cedc0d244f97a1caf5/cumulus-cloud-1024x512.jpg');
	sunset = loadImage('https://openprocessing-usercontent.s3.amazonaws.com/files/user271443/visual1185282/h1a9d6a9c9724f3cedc0d244f97a1caf5/photo-1490735891913-40897cdaafd1.jfif');
	night = loadImage('https://openprocessing-usercontent.s3.amazonaws.com/files/user271443/visual1185282/h1a9d6a9c9724f3cedc0d244f97a1caf5/1585862428885.jpeg');
}

function setup(){
	back = sunrise;
	createCanvas(windowWidth,windowHeight);
	background(back);
	fill(0);
	myRans = [];//new Array(int(windowWidth/50)+1);
	makeBuildings();
	
}


function draw(){
	background(back);
	//Sun
	fill(255,255,0);
  ellipse(x,y,35,35);
	//Moon
	fill(100);
	ellipse(moonX, moonY, 35, 35);
	x+=speedX;
	y-=speedY;	
	moonX += speedXM;
	moonY -= speedYM;
	if (x == width/4){
		back = midday;
	}else if(x == width/2){
		speedY = -1;
		back = sunset;
	}else if (x > width){
		x=10;
		y=500;
		speedX = 0;
		speedY = 0;
		moonX = 0;
		moonY = 500;
		speedXM = 2;
		speedYM = 1;
		back = night;
	}
	if(moonX == width/2){
		speedYM = -1;
	}else if(moonX > width){
		moonX = 0;
		moonY = 500;
		speedXM = 0;
		speedYM = 0;
		x=10;
		y=500;
		speedX = 2;
		speedY = 1;
		back = sunrise;
	}
	fill(0);
	stroke(255);
	displayBuildings();
}



function makeBuildings(){
	var buildings = windowWidth/50;
  for (var i = 0; i < buildings ;i++){ 
		var r = int(random(3))+1;
		myRans[i]=r;
		//myRan += str(r) + " ";
		//text(str(myRan),50,50);
		stroke(255);
		rect(50*i, height-100*r, 50, 100*r);
  }

}

function displayBuildings(){
  for (var i = 0; i < myRans.length; i++) { 
		r= myRans[i];
		//myRan += str(r) + " ";
		//text(str(myRan),50,50);
		stroke(255);
		rect(50*i, height-100*r, 50, 100*r);
  }

}
