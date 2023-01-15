float mariospeedVert = 0;                  
int h = 800;                                   
int topx = 100;
float gravity = 6;
int mSpeed = 6;

void applyGravity() {
  if (keyPressed == false) {
    psizey += gravity;
  }
}// end applyGravity

void keepInScreen() {
  if (psizey > h) {
    psizey = h;
  }
  if (psizey < topx ) {
    psizey = topx;
  }
}//end keepInScreen

void movement() {
  if (keyPressed && keyCode == UP) {
    psizey -= mSpeed;
  }
} // end movements
