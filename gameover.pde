//This function draws the GAMEOVER screen.

void gameOver() {
  background(red);
  fill(white);
  textSize(100);
  text("GAMEOVER", 500, 400);
  gameoverClicks();
}

void gameoverClicks() {
  playAgain.show();
  if(playAgain.clicked) {
    mode = INTRO;
    lives = 3;
    waves = 0;
    money = 200;    
    int i = 0;
    while(i < mobs.size()) {
      mobs.remove(i);
      i++;
    }
    i = 0;
    while(i < bullets.size()) {
      bullets.remove(i);
      i++;
    }
    while(i < towers.size()) {
      towers.remove(i);
      i++;
    }   
  }
}
