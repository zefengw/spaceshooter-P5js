function player2(){
	//Redefine the x-coordinate of second paddle to be within the screen
	xRect2 = constrain(xRect2, 0, width-40);
	//Change x-position depending on the key pushed
	if(key =='a'){
	  xRect2-=10;
	}
	if(key =='d'){
	  xRect2+=10;
	}
	
}
