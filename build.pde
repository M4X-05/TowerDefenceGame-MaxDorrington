//This function draws the BUILD screen

void build() {
  if (mapButton1.clicked) {
    drawMap();
  }
  if (mapButton2.clicked) {
    drawMap2();
  }
  textSize(70);
  textFont(twenty);
  flashingSign();
  textFont(bostonCaps);
  animateThings();
  buyGunTower.show();
  buySniperTower.show();
  buyAOETower.show();
  textFont(bostonCaps);
  fill(white);
  textSize(50);
  text("MONEY: "+money, 850, 700);
  text("LIVES: "+lives, 850, 750);
  textFont(bostonCaps);
  handleBuildClicks();
}

void flashingSign() {
  count++;
  if (count < 20) shadowText("BUILD MODE", width/2-100, 100, 50 , red, black);
  if (count == 40) count = 0;
}

void handleBuildClicks() {

   playMode.show();
     if(playMode.clicked) {
       mode = PLAY;
     }   
     if(buyGunTower.clicked && money >= 5) {
       towers.add(new Tower(0, 0, 0, 30, GUN));
     }
     if(buyAOETower.clicked && money >= 25){
       towers.add(new Tower(0, 0, 0, 30, AOE));
     }
     if(buySniperTower.clicked && money >= 50) {
       towers.add(new Tower(0, 0, 0, 0, SNIPER));
     }
  }
  
