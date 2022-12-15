//A Tower is the player's main defense against the mobs.
//Towers are placed on the maps and then automatically
//act. There are 3 kinds of towers (but you can make more!)

//Gun Tower: These towers shoot bullets that fly across
//           the screen and do damage to mobs.

//AoE Tower: These towers place AoE_Rings that deal damage
//           to all mobs in the ring.

//Sniper Tower: These towers automatically target the first
//              mob no matter where they are on the scren.

class Tower {

  final int PLACING = 0;
  final int PLACED = 1;

  float x, y, d;
  int cooldown;
  int threshold = 550;
  int towerMode;
  int gunType;


  Tower(float mouseX, float mouseY, int c, int th, int _gunType) {
    x= mouseX;
    y = mouseY;
    cooldown = c;
    threshold = th;
    towerMode = PLACING;
    gunType = _gunType;
  }

  void show() {
    if (gunType == GUN) showGunTower();
    if (gunType == AOE) showAOETower();
    if (gunType == SNIPER) showSniperTower();
  }

  void act() {
    if (gunType == GUN) actGunTower();
    else if (gunType == AOE) actAOETower();
    else if (gunType == SNIPER) actSniperTower();
  }
  void showGunTower() {
    stroke(black);
    strokeWeight(4);
    fill(blue);
    //square(x, y, 40);
    if (towerMode == PLACED) {
      image(tower, x, y);
    } else if (towerMode == PLACING && money >= 5) {
      image(tower, mouseX, mouseY);
      if (mousePressed && mouseX > 0 && mouseX < 700) {
        towerMode = PLACED;
        money = money - 5;
        x = mouseX;
        y = mouseY;
      }
    }
  }

  void actGunTower() {
    cooldown ++;
    if (cooldown >= threshold && mobs.size() > 0) {
      cooldown = 0;
      bullets.add(new Bullet(x, y, 0, -10)); //Up
      bullets.add(new Bullet(x, y, 0, 10));  //Down
      bullets.add(new Bullet(x, y, -10, 0)); //Left
      bullets.add(new Bullet(x, y, 10, 0));  //Right
    }
  }

  void showAOETower() {
    stroke(black);
    strokeWeight(3);
    fill(orange);
    circle(x, y, 40);
    if (towerMode == PLACED) {
      image(AOETower, x, y);
    } else if (towerMode == PLACING && money >= 25) {
      image(AOETower, mouseX, mouseY);
      if (mousePressed && mouseX > 0 && mouseX < 700) {
        towerMode = PLACED;
        money = money - 25;
        x = mouseX;
        y = mouseY;
      }
    }
  }

  void actAOETower() {
    cooldown++;
    if (cooldown >= threshold && mobs.size() > 0) {
      aoe.x = x;
      aoe.y = y;
      aoe.act();
      aoe.show();
    }
    if (cooldown > 60) {
      cooldown = 0;
    }
  }
  
  void showSniperTower(){
    stroke(black);
    strokeWeight(4);
    fill(purple);
    if (towerMode == PLACED) {
      image(sniperTower, x, y);
    } else if (towerMode == PLACING && money >= 50) {
      image(sniperTower, mouseX, mouseY);
      if (mousePressed && mouseX > 0 && mouseX < 700) {
         towerMode = PLACED;
         x = mouseX;
         y = mouseY;
         money = money - 50;
      }
    }
  }
  
  void actSniperTower(){
    cooldown++; 
    if(cooldown >= threshold && mobs.size() > 0) {
      Mob myMob = mobs.get(0);
      myMob.hp = myMob.hp - 0.05;
      stroke(red);
      strokeWeight(10);
      line(myMob.x, myMob.y, x, y+50);
    }
    if (cooldown > 50) {
      cooldown = 0;
    }
  }
}
