class Balloon {
  
  final float imageSize = width / 4;
  final int maxColumn = 3;
  final int maxRow = 3;
  final int numberBalloon = maxColumn * maxColumn;
  final int burstInput = 5;
  final int sumBurst = 10000;
  float s, alphaSum;
<<<<<<< HEAD
  int count, state,input, numberBurst, iBeforeScore;
  PImage balloon, burst, img, glad, sad;
  Boolean startCount, startMoveToEnd, isEnd;
  String Highscore[];
  PrintWriter POutput;
=======
  int state,input, numberBurst; 
  PImage balloon, burst, img, glad;
  Boolean startCount, startMoveToEnd, isEnd ,isMusicStart;;
>>>>>>> d39e0aac66669cff1955929adc790ac1c9a20dc4
  Wait wait;

  Balloon() {
    isMusicStart = true;
    balloon = loadImage("balloon.jpg");
    burst = loadImage("burst.png");
    glad = loadImage("glad.jpg");
    sad = loadImage("sad.jpg");
    s = imageSize;
    Highscore = loadStrings("balloonhighscore.txt");
    iBeforeScore = loadScore();
    numberBurst = 0;
    input = 0;
    state = 0;
    startCount = true;
    startMoveToEnd = true;
    isEnd = false;
    alphaSum = 0;
    
  }
  
  void draw() {
    background(255);
    noFill();
    frameRate(30);
    count++;
    String time1 = String.valueOf(30-count/30);
    rect(0,460,12*(30-count/30),30);
    text(time1,370,460,30,30);
    switch(state){
      case 0: drawObject();
              changeState();
              
              break;
      case 1: displayhappyEnd();
              moveToTitle();
              
              break;
      case 2: displaybadEnd();
              moveToTitle();
    }
    
   if (alphaSum > sumBurst) {
     alphaSum =0;
        if(numberBurst < 9){
            numberBurst += 1;
        }
   }
    
    
    
  }
  
  void drawObject(){
    for(int i = 1; i <= numberBalloon; i++){
        int posx = i % maxColumn;
        int posy = i / maxRow + 1;
        
        if(posx == 0){
          posx = maxColumn;
          posy -= 1;
        }
        if(i <= numberBurst){
          img = burst;
        } else{
          img = balloon;
        }
        image(img, s * (2 * posx - 1) / 2, s * (2 * posy + 1) / 2, s, s);
      }
  }
  
  void displayhappyEnd(){
    saveScore(numberBalloon);
    image(glad,0,0,width,height);
    dispHighScore();
  }
  
  void displaybadEnd(){
    if(numberBurst > iBeforeScore){
      saveScore(numberBurst);
    }
    image(sad,0,0,width,height);
    dispHighScore();
  }
  
  void saveScore(int iScoreBase){
    POutput = createWriter("balloonhighscore.txt");
    POutput.println(iScoreBase);
    POutput.flush();
    POutput.close();
  }
  
  int loadScore(){
    String sLinedata[] = null;
    String sScore;
    sLinedata = Highscore;
    if(sLinedata != null){
      sScore = sLinedata[0];
    }else{
      sScore = "0";
    }
    return(Integer.parseInt(sScore));
  }
  
  void dispHighScore(){
    String sNowscore;
    String sHighscore;
    sHighscore = "　最高得点　: " + String.valueOf(iBeforeScore);
    if(numberBurst >= numberBalloon){
      sNowscore = "今回の得点　: " + String.valueOf(numberBalloon);
    }else{
      sNowscore = "今回の得点　: " + String.valueOf(numberBurst);
    }
    text(sNowscore,150,24);
    text(sHighscore,150,72);
  }
  
  void changeState() {
    if(numberBurst >= numberBalloon){
       if(startCount){
           startCount = false;
           wait = new Wait(2); 
       }
       if(wait.isEnd()){
          state = 1;
          startMoveToEnd = true;
       }
     }
     if(count >= 900){
       if(startCount){
           startCount = false;
           wait = new Wait(0); 
       }
       if(wait.isEnd()){
          state = 2;
          startMoveToEnd = true;
       }
     }
  }
  
  void moveToTitle() {
    if(startMoveToEnd) {
      startMoveToEnd = false;
      wait = new Wait(2);
    }
    if(wait.isEnd()){
      isEnd = true;
    }
  }
}