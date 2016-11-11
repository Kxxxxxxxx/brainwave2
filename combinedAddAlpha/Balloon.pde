class Balloon {
  
  final float imageSize = width / 4;
  final int maxColumn = 3;
  final int maxRow = 3;
  final int numberBalloon = maxColumn * maxColumn;
  final int burstInput = 5;
  final int sumBurst = 10000;
  float s, alphaSum;
  int count,state,input, numberBurst; 
  PImage balloon, burst, img, glad,sad;
  Boolean startCount, startMoveToEnd, isEnd;
  Wait wait;

  Balloon() {
    balloon = loadImage("balloon.jpg");
    burst = loadImage("burst.png");
    glad = loadImage("glad.jpg");
    sad = loadImage("sad.jpg");
    s = imageSize;
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
    frameRate(1);
    count++;
    rect(0,460,12*(30-count),30);
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
    image(glad,0,0,width,height);
  }
  
  void displaybadEnd(){
    image(sad,0,0,width,height);
  }
  
  void changeState() {
    if(numberBurst >= 9){
       if(startCount){
           startCount = false;
           wait = new Wait(2); 
       }
       if(wait.isEnd()){
          state = 1;
          startMoveToEnd = true;
       }
     }
     if(count >= 29){
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
      wait = new Wait(4);
    }
    if(wait.isEnd()){
      isEnd = true;
    }
  }
  
}