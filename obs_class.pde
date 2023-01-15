class obstacles1 {
  float x;
  float y;
  int l = 100;
  int w = 200;
  PImage img;
  obstacles1(PImage tempImg, float tempX, float tempY, int tempL, int tempW) {
    x = tempX;
    y = tempY;
    l = tempL;
    w = tempW;
    img = tempImg;
  }
  void display() {
    image(img, x, y, l, w);
    Speed();
    hit();

    if (x < -200) {
      x =random(2120, 2620);
      y=random(100, 880);
    }
  }//end display

  void Speed() {
    float speed = 11;
    float tim = millis();
    if (tim >= 5000) {
      speed += 0.001;
    }
    x -=speed;
  }

  void hit() {
    if ((x+l)>psizex && (x+60)<(psizex+size1)  &&   (y+w-10) > psizey && (y+10) < (psizey+size2)) {
      scene = 4;
      ifHit = false;
      currentTimeDeath = 0;
      startTimeDeath = millis();
    }
  }
}// end class
