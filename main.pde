import processing.sound.*;
SoundFile sound;
PImage player, obs1;
obstacles1[] rocket = new obstacles1[100];  // this is how many obstacles you want on the screen
PImage[] obs = new PImage[1];  // what kind they are
PImage background;//all background code from https://forum.processing.org/two/discussion/12084/looping-background-image
PImage ground;
PImage deathScreen;
PImage pauseB;
PImage marioTitle;
PImage obs0;
int psizex, psizey;
int size1 = 100;
int size2 = 189;
int startTime = millis();
int currentTime = 0;
int startTimeDeath = millis();
int currentTimeDeath = 0;
int mx = 120;
int my = 200;
int score = 0;
float tm = millis();
float tmC = 0;
boolean ifHit = false;
boolean deathScreenSoundOn = false;

void setup() {
  fullScreen();
  mainMenu();
  background = loadImage("images/background.png");
  background.resize(1920, 890);
  ground = loadImage("images/ground.png");
  ground.resize(1920, 100);
  player = loadImage("images/player1.png");
  deathScreen = loadImage("images/deathScreen.jpg");
  pauseB = loadImage("images/pauseB.png");
  sound = new SoundFile (this, "sound/hitSound.wav");
  sound = new SoundFile (this, "sound/buttonClick.wav");
  sound = new SoundFile (this, "sound/marioDeath.wav");
  psizex = 200;
  psizey = 800;
  for (int i = 0; i < obs.length; i ++) {
    obs[i] = loadImage("images/obs"+i+".png");
  }
  for (int i =0; i< rocket.length; i++) {
    int index = int(random(0, obs.length));
    rocket[i] = new obstacles1(obs[index], random(2120, 2620), random(100, 880), 200, 100);
  }
}//end setup

void draw() {
  if (scene == 1) {
    mainMenu();
  }
  if (scene == 2) {
    howToPlay();
  }
  if (scene == 3) {
    mainGame();
  }
  if (scene == 4) {
    deathScreen();
  }
  if (scene == 5) {
    pauseMenu();
  }
}//end draw

//////////////////////////////////////////////////// 
//User Interface
/////////////////////////////////////////////////// 

void mouseClicked() {
  println("Mouse X coordinate: "+ mouseX);
  println("Mouse Y coordinate: " + mouseY);
  if (scene == 1 && mouseX >= 860 && mouseX <= 1060 && mouseY >=500 && mouseY <= 600) {
    sound = new SoundFile (this, "sound/buttonClick.wav");
    sound.play();
    scene = 2;
  }
}//end mouseClicked

void restart() {
  score = 0;
  mx = 120;
  mx = 200;
  tm = millis();
  tmC = 0;
  ////////////////////////////////////
  currentTime = 0;
  startTime = millis();
  ///////////////////////////////////
  ms = millis();
  msCurrent = 0;
  obsNum =0;
  psizex = 200;
  psizey = 800;
  for (int i =0; i< rocket.length; i++) {
    int index = int(random(0, obs.length));
    rocket[i] = new obstacles1(obs[index], random(2120, 2620), random(100, 880), 200, 100);
  }
}// end restart

void score() {
  score ++;
}//end score

void printScore() {
  print(score);
  fill(255);
  textSize(100);
  text(score, 289, 100);

  textSize(100);
  text("Score: ", 0, 100);
}//end printScore

/////////////////////////////////////////////////////////
//Mario
/////////////////////////////////////////////////////////

void drawCharacter() {
  image(player, psizex, psizey, size1, size2);
}
