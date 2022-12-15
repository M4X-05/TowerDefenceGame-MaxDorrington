//Mobs are the monsters that the towers defend against.
//Mobs spawn at the start and then move across the map,
//changing direction when they hit a node. If they get
//to the end of the map, they deal damage to the player.
//Once the player has no more health, it's game over!

class Mob {
  float x, y, vx, vy, d, hp, speed;
  int die, maxhp, value;
  color fillColor, strokeColor;

  float xPos = 0;
  float yPos = 0;

  // Declare a variable to store the direction of the image
  float xDir = 1;
  float yDir = 1;

  Mob (float _x, float _y, float _vx, float _vy) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    die = 0;
    d = 40;
    maxhp = 2;
    hp = 2;
    speed = 1;
  }

  void show() {
    healthbar();
    strokeWeight(3);
    image(mob, x, y, width/6, height/6);
  }

  void act() {
    x = x + vx * speed;
    y = y + vy * speed;

    int i = 0;
    while (i < nodes.length) {
      if (dist(nodes[i].x, nodes[i].y, x, y) < speed) {
        vx = nodes[i].dx;
        vy = nodes[i].dy;
      }
      i++;
    }

    i = 0;
    while (i < bullets.size()) {
      Bullet myBullet = bullets.get(i);
      if (dist(myBullet.x, myBullet.y, x, y) <d/2 + myBullet.d/2) {
        hp = hp - 1;
        myBullet.hp = 0;
      }
      i++;
    }

    if ( x > height || y > width || y < 0) {
      hp = hp - 3;
      lives = lives -1;
    }
  }
  void healthbar() {
    rectMode(CORNER);
    noStroke();
    fill(black);
    rect(x-27, y-(d+10)-2, 54, 24);//background
    fill(white);
    rect(x-25, y-(d+10), 50, 20);
    fill(pink);
    rect(x-25, y-(d+10), hp*50/maxhp, 20);
    rectMode(CENTER);
  }
}
