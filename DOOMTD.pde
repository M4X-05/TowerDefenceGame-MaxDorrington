//Tower Defense Game
//Max Dorrington
//Programming 12

// ================ GLOBAL VARIABLES =================

final int INTRO    = 0;
final int MAPSELECT = 1;
final int PLAY     = 2;
final int BUILD    = 3;
final int GAMEOVER = 4;
int mode;
final int GUN = 0;
final int AOE = 1;
final int SNIPER = 2;

final int[] price = {5, 25, 50};
//Pallette
color white = #ffffff;
color black = #000000;
color red = #981414;
color blue = #004BDE;
color grey = #9D9898;
color pink = #CF0BDE;
color purple = #B812CB;
color dRed = #540b0e;
color green = #397640;
color orange = #E09129;
color dirt = #7C5100;
color lgreen = #50FF36;
//Mouse & Keyboard interaction variables
boolean mouseReleased;
boolean wasPressed;

//Buttons
Button start;
Button nextWave;
Button build;
Button playMode;
Button buyGunTower;
Button buySniperTower;
Button buyAOETower;
Button playAgain;
Button mapButton1;
Button mapButton2;
//Collections of objects
Node[] nodes; //7\
Node[] nodes2;
ArrayList <Mob> mobs;
ArrayList<Tower> towers;
ArrayList<Bullet> bullets;
AOE_ring aoe;
//Images and Gifs
Gif greens;
PImage arrow, tower, sniperTower, AOETower, city1, city2, mob, chunkymob, speedmob;
//Fonts
PFont Platinum, twenty, bostonCaps;

// ===================== SETUP =========================

void setup() {
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  size(1000, 800);
  // Initialize mode and font variables
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  initializeModes();
  initializeVariables();
  makeButtons();
  waves = 0;
  mode = INTRO;
}

void initializeModes() {
  //set up the default mode for things
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  mode = INTRO;
}

void initializeVariables() {
  //Load Images & Gifs
  tower = loadImage("tower/tower.png");
  sniperTower = loadImage("tower/sniperTower.png");
  AOETower = loadImage("tower/AOETower.png");
  arrow = loadImage("image/arrow.png");
  city1 = loadImage("play/city1.jpeg");
  city2 = loadImage("play/city2.png");
  mob = loadImage("mobs/mobs/mob.png");
  greens = new Gif("green/a(", ").gif", 50, 1, 500, 400, width, height);
  //Load Fonts
  Platinum = createFont("fonts/Platinum Sign.ttf", 80);
  bostonCaps = createFont("fonts/BOSTON CAPS.ttf", 80);
  twenty = createFont("fonts/full Pack 2025.ttf", 80);
  //Create Collections of Objects
  mobs = new ArrayList<Mob>();
  towers = new ArrayList<Tower>();
  bullets = new ArrayList<Bullet>();
  aoe = new AOE_ring (0, 0);
}

  void makeButtons() {
  //INTRO - Start
  start = new Button("START", width/2, 3*height/4, 300, 150, white, black);
  //PLAY - Next Wave, To Build Mode
  nextWave = new Button(arrow, 850, 200, 200, 100, red, white);
  build = new Button("Build", 850, 300, 200, 100, red, white);
  mapButton1 = new Button("MAP 1", 300, 500, 200, 100, green, white);
  mapButton2 = new Button("MAP 2", 700, 500, 200, 100, red, white);
  //BUILD - To play mode, Buy Sniper, Buy Gun, Buy AoE
  playMode = new Button ("PLAY", 850, 300, 200, 100, red, white);
  buyGunTower = new Button ("TOWER\n$"+price[GUN], 850, 400, 200, 100, blue, white);
  buySniperTower = new Button ("SNIPER\n$"+price[SNIPER], 850, 600, 200, 100, green, white);
  buyAOETower = new Button ("AOE\n$"+price[AOE], 850, 500, 200, 100, purple, white);
  //GAMEOVER - Reset
  playAgain = new Button ("PLAY AGAIN", 500, 550, 500, 200, white, black);
}


void makeNodes() {
  //map 1
  if (mapButton1.clicked) {
    nodes = new Node[4];
    nodes[0] = new Node(410, 685, 0, -1);
    nodes[1] = new Node(410, 420, +1, 0);
    nodes[2] = new Node(555, 420, 0, -1);
    nodes[3] = new Node(555, 120, +1, 0);

    //map 2
  } else if (mapButton2.clicked) {
    nodes = new Node[4];
    nodes[0] = new Node(199, 563, 0, -2);
    nodes[1] = new Node(199, 425, +2, 0);
    nodes[2] = new Node(405, 425, 0, -2);
    nodes[3] = new Node(405, 263, +2, 0);
  }
}


// ===================== DRAW ===========================

void draw() {
  click();

  if (mode == INTRO) {
    intro();
  } else if (mode == MAPSELECT) {
    mapSelect();
  } else if (mode == PLAY) {
    play();
  } else if (mode == BUILD) {
    build();
  } else if (mode == GAMEOVER) {
    gameOver();
  }
  textFont(twenty);
  textSize(20);
  text(mouseX + " ,"+ mouseY, mouseX, mouseY-20);
}
