function ls(){
	textSize(12);
	text("Player 1", 40, 50);
	text("Player 2", 40, 350);
	text("Score: " + score1, 20, 70);
	text("Score: " + score2, 20, 370);
	text("Lives: " + lives, 100, 70);
	text("Lives: " + lives2, 100, 370);
	
if(lives2 == 0 || score1 == 50){
		textSize(20);
		text("Game Over. You win Player 1", 150, height/2);
		speedX = 0;
		speedY = 0;
	}else if(lives == 0 || score2 == 50){
		textSize(20);
		text("Game Over. You win Player 2", 150, height/2);
		speedX=0;
		speedY=0
}
}
