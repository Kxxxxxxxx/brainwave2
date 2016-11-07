class Wait {

  float countStart, waitTime;
  
  Wait(int sec) {
    countStart= millis();
    waitTime = sec * 1000;
  }
  
  Boolean isEnd() {
    if(millis() - countStart > waitTime) {
      return true;
    }
    return false;
  }


}