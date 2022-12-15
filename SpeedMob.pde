class SpeedMob extends Mob {
  SpeedMob(float _x, float _y, float _vx, float _vy) {
     super(_x, _y, _vx, _vy);
     maxhp = 2;
     d = 25;
     hp = 2;
     fillColor = orange;
     strokeColor = orange;
     speed = 3;
  }
}
