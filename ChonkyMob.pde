class ChonkyMob extends Mob {
  
  ChonkyMob (float _x, float _y, float _vx, float _vy) {
    super(_x, _y, _vx, _vy);
    maxhp = 2 + waves;
    d = 80;
    hp = 2 + waves;
    fillColor = orange;
    strokeColor = blue;
    speed = 0.5;
  }
}
