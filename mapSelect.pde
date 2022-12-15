  void mapSelect() {
    textFont(twenty);
    fill(black);
    background(black);
    fill(white);
    flashingSign2();
    handleButtonClicks(); 
    image(city1, 300, 300, width/5, height/5);
    image(city2, 700, 300, width/5, height/5);
  }

  void flashingSign2() {
  count++;
  if (count < 20) shadowText("MAP SELECT", width/2, 100, 50 , black, white);
  if (count == 40) count = 0;
}

  void handleButtonClicks() {
    mapButton1.show();
    if(mapButton1.clicked) {
       mode = PLAY;
    }
    mapButton2.show();
    if(mapButton2.clicked) {
      mode = PLAY;
    }
    makeNodes();
  }
  
