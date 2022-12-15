//This function draws the PLAY screen
int waves;
boolean enemy;
int money = 200;
int lives = 3;
int m = 0;
int i = 0;
int count = 0;

void play() {
  if (mapButton1.clicked) {
    drawMap();
  }
  if (mapButton2.clicked) {
    drawMap2();
  }
  animateThings();
  handlePlayClicks();
  playInterface();
  if (lives == 0) {
    mode = GAMEOVER;
  }
}


void animateThings() {
  int i = 0;
  while (i < mobs.size()) {
    Mob myMob = mobs.get(i);
    stroke(black);
    myMob.act();
    myMob.show();
    myMob.healthbar();
    if (myMob.hp <= 0) {
      mobs.remove(i);
      money = money + 1;
    } else {
      i++;
    }
  }

  i = 0;
  while (i < towers.size()) {
    Tower myTower = towers.get(i);
    if (mobs.size() > 0) myTower.act();
    myTower.show();
    i++;
  }
  i = 0;
  while (i < bullets.size()) {
    Bullet myBullet = bullets.get(i);
    myBullet.act();
    myBullet.show();
    if (myBullet.hp <= 0) {
      bullets.remove(i);
    } else {
      i++;
    }
    if (build.clicked && mobs.size() == 0) {
      mode = BUILD;
    }
  }
}

void playInterface() {
  stroke(black);
  fill(white);
  textFont(bostonCaps);
  text("TNTD", 850, 50);
  textSize(50);
  text("Wave: "+waves, 850, 125);
  text("MONEY: "+money, 850, 700);
  text("LIVES: "+lives, 850, 750);
}

void drawMap() {
  if (mapButton1.clicked) {
    city1.resize(1000, 800);
    background(city1);
    stroke(black);
    fill(black);
    textFont(bostonCaps);
    textSize(50);
    text("START", 60, 600);
    text("END", 660, 45);
    textFont(bostonCaps);
    fill(black);
    strokeWeight(5);
    rect(900, 400, 400, 850);
    i = 0;
    while (i < 4) {  // This condition will be true as long as i is less than 4
      nodes[i].show();
      i++;
    }
  }
}
void drawMap2() {
  if (mapButton2.clicked) {
    city2.resize(1000, 800);
    background(city2);
    stroke(black);
    fill(black);
    textFont(bostonCaps);
    textSize(50);
    text("START", 60, 625);
    text("END", 660, 210);
    textFont(bostonCaps);
    fill(black);
    strokeWeight(5);
    rect(900, 400, 400, 850);
    i = 0;
    while (i < 4) {  // This condition will be true as long as i is less than 4
      nodes[i].show();
      i++;
    }
  }
}

void handlePlayClicks() {
  textFont(bostonCaps);
  nextWave.show();
  waveStuff();
  build.show();
  if (build.clicked && mobs.size() == 0 && mobs.size() == 0) {
    mode = BUILD;
  }
}
void waveStuff() {
  if (mapButton1.clicked) {
    if (mobs.size() == 0) {
      enemy = false;
      i = 0;
      if (nextWave.clicked && mobs.size() == 0) {
        enemy = true;
        m++;
        waves++;
      }
      while (enemy == true && i < m) {
        mobs.add (new Mob(0-40*i, 685, 1, 0));
        i++;
      }
    }
    if (nextWave.clicked && waves % 3 == 0) {
      i = 0;
      while (i < waves/3) {
        mobs.add(new ChonkyMob(0-40*i, 685, 1, 0));
        i++;
      }
    }
    if (nextWave.clicked && waves % 5 == 0) {
      i = 0;
      while (i < waves/5) {
        mobs.add(new SpeedMob (0-40*i, 685, 1, 0));
        i++;
      }
    }
  }
  if (mapButton2.clicked) {
    if (mobs.size() == 0) {
      enemy = false;
      i = 0;
      if (nextWave.clicked && mobs.size() == 0) {
        enemy = true;
        m++;
        waves++;
      }
      while (enemy == true && i <= m) {
        mobs.add (new Mob(0-40*i, 563, 1, 0));
        i++;
      }
    }
    if (nextWave.clicked && waves % 3 == 0) {
      i = 0;
      while (i < waves/3) {
        mobs.add(new ChonkyMob(0-40*i, 563, 1, 0));
        i++;
      }
    }
    if (nextWave.clicked && waves % 5 == 0) {
      i = 0;
      while (i < waves/5) {
        mobs.add(new SpeedMob (0-40*i, 563, 1, 0));
        i++;
      }
    }
  }
}
