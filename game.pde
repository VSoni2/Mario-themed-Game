float bTim = millis();    //// every whatever time the background would speed up *do that later
Float bG1X = 0.0;

void mainGame() {
  background(200, 200, 0);
  noTint();
  image(background, bG1X, 100, 1920, 890);
  image(background, bG1X + background.width, 100, 1920, 890);
  image(ground, bG1X, 990, 1920, 100);
  image(ground, bG1X + ground.width, 990, 1920, 100);
  bG1X -= 5.0;
  if (bG1X < -background.width) {
    bG1X = 0.0;
  }
  fill(0);
  rect(0, 0, 1920, 100);
  drawCharacter();
  applyGravity();
  movement();
  keepInScreen(); 
  obstacle();
  score();
  printScore();
  if ( keyPressed && (key == 'p' || key == 'P')) {
    sound = new SoundFile (this, "sound/buttonClick.wav");
    sound.play();
    scene = 5;
    currentTime = 0;
    startTime = millis();
  }
}//end mainGame
