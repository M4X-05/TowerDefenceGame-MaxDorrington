//This function draws the INTRO screen.

void intro() {
   //doom.show();
   textAlign(CENTER, CENTER);
   greens.show();
   textFont(twenty);
   textSize(50);
   fill(black);
   text("THE NEIGHBOURHOOD", 510, 210);
   fill(white);
   text("THE NEIGHBOURHOOD", 500, 200);
   textSize(35);
   fill(black);
   text("PROTECT WHAT IS YOURS", 510, 270);
   fill(white);
   text("PROTECT WHAT IS YOURS", 500, 260);
   textSize(10);
   start.show();
   if(start.clicked) {
     mode = MAPSELECT;
   }
}
