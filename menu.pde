int scene = 0;

void mainMenu() {
  currentTime = 0;
  startTime = millis();
  scene = 1;
  background(#99FCFC);
  marioTitle = loadImage("images/marioTitle.png");
  obs0 = loadImage("images/obs0.png");
  image(marioTitle, width/2 - 800, 600);
  image(obs0, width/2 + 300, 80);
  pushMatrix();
  scale(-1.0, 1.0);
  image(marioTitle, -1*(width/2 + 800), 600);
  image(obs0, -1*(width/2 - 300), 80);
  popMatrix();

  //title
  strokeWeight(0);
  fill(0);
  textSize(150);
  text("Mario Bullet Time", 325, 400);

  //startbutton
  stroke(0);
  strokeWeight(8);
  fill(255);
  rect(860, 500, 200, 100);
  fill(0);
  textSize(38);
  text("START", 900, 560);
}//end mainMenu

void howToPlay() {
  currentTime = millis() - startTime;
  if (currentTime > 6000) {
    scene = 3;
  }///link https://forum.processing.org/one/topic/time-reset.html
  background(#99FCFC);
  image(marioTitle, width/2 - 900, 375);
  image(obs0, width/2 + 600, 475);

  //instructions
  textSize(65);
  text("Use the UP arrow to dodge the oncoming obstacles.", 149, 150);
  text("Use the 'P' key to pause the game", 435, 930);
  //arrowKeys
  stroke(0);
  strokeWeight(8);
  fill(#99FCFC);
  rect(660, 470, 200, 200, 35);//Box
  fill(0);
  strokeWeight(10);
  line(757, 535, 757, 625);//line
  strokeJoin(ROUND);
  triangle(757, 535, 727, 580, 787, 580);//triangle
  //pause key
  stroke(0);
  strokeWeight(8);
  fill(#99FCFC);
  rect(1060, 470, 200, 200, 35);//Box
  fill(0);
  textSize(125);
  text("P", 1125, 620);
  textSize(65);
}//end howToPlay

void deathScreen() {
  currentTimeDeath = millis() - startTimeDeath;
  sound = new SoundFile (this, "sound/hitSound.wav");
  if (ifHit == false) {
    ifHit = true;
    sound.play();
  }
  if (currentTimeDeath > 500) {
    image(deathScreen, 0, 0, 1920, 1080);
    sound = new SoundFile (this, "sound/marioDeath.wav");
    if (deathScreenSoundOn == false) {
      deathScreenSoundOn = true;
      sound.play();
    }
    if (currentTimeDeath > 3000) {
      image(deathScreen, 0, 0, 1920, 1080);
      fill(255);
      rect(530, 480, 250, 150);//play again
      rect(1120, 480, 250, 150);//main menu
      fill(0);
      textSize(40);
      text(" Play \nAgain", 595, 540);
      text(" Menu \nScreen", 1175, 540);
      score += 0;
      fill(255);
      text(score, (width/2)- 55, height/2- 65);
      text("Your Score", (width/2)- 115, 430);
      if (scene == 4 && mousePressed && mouseX >= 530 && mouseX <= 780 && mouseY >= 480 && mouseY <= 630) {
        sound = new SoundFile (this, "sound/buttonClick.wav");
        sound.play();
        scene = 3;
        restart();
        deathScreenSoundOn = false;
      }
      if (scene == 4 && mousePressed && mouseX >=1120 && mouseX <= 1370 && mouseY >= 480 && mouseY <= 630) {
        sound = new SoundFile (this, "sound/buttonClick.wav");
        sound.play();
        scene = 1;
        restart();
        deathScreenSoundOn = false;
      }
    }
  }
}//end deathScreen

void pauseMenu() {
  currentTime = millis() - startTime;
  if (currentTime > 0 && currentTime < 400) {
    tint(255, 80);
    image(pauseB, 0, 0, 1920, 1080);
  } else if (currentTime > 400) {
    tint(255, 0);
    image(pauseB, 0, 0, 1920, 1080);
  }
  if (currentTime > 600) {
    fill(255);
    rect(530, 430, 250, 150);
    rect(1120, 430, 250, 150);
    fill(0);
    textSize(40);
    text("  Keep \nPlaying", 580, 490);
    text(" Menu \nScreen", 1175, 490);
    if (scene == 5 && mousePressed && mouseX >= 530 && mouseX <= 780 && mouseY >= 430 && mouseY <= 580) {
      sound = new SoundFile (this, "sound/buttonClick.wav");
      sound.play();
      scene = 3;
    }//keep playing
    if (scene == 5 && mousePressed && mouseX >=1120 && mouseX <= 1370 && mouseY >= 430 && mouseY <= 580) {
      sound = new SoundFile (this, "sound/buttonClick.wav");
      sound.play();
      scene = 1;
      restart();
    }
  }
}//end pauseMenu
