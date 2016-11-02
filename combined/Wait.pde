class Wait {

  float countStart, waitTime;
  
  
  Wait() {
    countStart = millis();
    waitTime = 4000;
  }
  
  Boolean isEnd() {
    if(millis() - countStart > waitTime) {
      return true;
    }
    return false;
  }


}