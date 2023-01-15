float obsNum;                //https://www.youtube.com/channel/UCvjgXvBlbQiydffZU7m1_aw
float ms = millis();
float msCurrent =0;
float time = 10000;

void obstacle() {
  msCurrent = millis() - ms;
  if (msCurrent>=time && msCurrent< (time + 4000)) {
    obsNum =1;
  }
  if (msCurrent>= (time + 4000) && msCurrent< (time + 9000)) {
    obsNum=2;
  }
  if (msCurrent>=(time + 9000) && msCurrent<(time + 19000)) {
    obsNum=3;
  }
  if (msCurrent>=(time + 19000)) {
    obsNum=4;
  }
  for (int i = 0; i < obsNum; i++) {
    rocket[i].display();
  }
}//end obs1
