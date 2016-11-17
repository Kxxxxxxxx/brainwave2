class Endurance {
  PImage img_smile, img_cry, img_endure, img_dead, face, sumo, bomb;
  Boolean isOut = false;
  Boolean startCount = true;
  Boolean isEnd;
  PVector pos_rect, pos_sumo;
  Wait wait;

  final float imageHeight = 250;      // image size
  final float speed = 1;              // fundamental lowering speed of bar
  final float posx_sumo = width / 2 - imageHeight / 1.8;   // x-coordinate is never changed
  final float height_rect = imageHeight / 2.5;             // height of bar

  float heightMinus, counter, level, power, heightLeft;
  Boolean isMusicStart;
  
  Endurance (int _level){
    isMusicStart = true;
    img_smile = loadImage("smile.png");     //load image files
    img_cry = loadImage("cry.png");
    img_endure = loadImage("endure.png");
    img_dead = loadImage("dead.png");
    sumo = loadImage("sumo.png");
    bomb = loadImage("bomb.png");
    pos_rect = new PVector(0, 0);   // position of bar below sumo wrestler
    pos_sumo = new PVector(posx_sumo, -imageHeight);   // position of sumo wrestler
    power = 0;                      // amout of α wave
    counter = 1;                    // to make game more difficult
    level = _level;                 // initial game level
    isEnd = false;                  // for screen transition to title
  }
  
  
  void draw() {
    background(200);
    if(!isOut){
      
      modifyLevel();
      modifyObstaclePosition();
      
      if (heightLeft < imageHeight) {
        heightMinus = (imageHeight-heightLeft);
      }
      
      drawObstacles();
      drawFace();
      endDecision();
        
    // Game Over
    } else {
      startMoveToTitle();
    }   
  }
  
  void modifyLevel(){
    counter += 1;      
      // level up as time passes
     if (counter% 181 == 0){
        level += 0.2;
        counter = 1;
     }
  }
  
  void modifyObstaclePosition(){
    // modify the position of objects
      
      pos_rect.y += speed * (1 + level * 0.1) ;
      if (pos_rect.y >=0 ) { 
         pos_rect.y -= power;
      }
      pos_sumo.y = pos_rect.y - imageHeight / 8 * 7;
      
       // height between the bottom of the rect and the bottom of the screen
      heightLeft = height - pos_rect.y - height_rect;
  }
  
  void drawObstacles(){
      image(sumo, pos_sumo.x, pos_sumo.y, imageHeight, imageHeight);
      fill(100);
      rect(0, pos_rect.y, width, height_rect);
      }
      
      
  void drawFace() {
    if (heightLeft >= imageHeight / 2 ) {
        face = img_smile;
      } else if (heightLeft >= imageHeight / 3 && heightLeft < imageHeight / 2) {
        face = img_endure;
      } else if (heightLeft >= imageHeight / 4 && heightLeft < imageHeight / 3){
        face = img_cry;
      } else {
        face = img_dead;
      }
      image(face, width / 2 - imageHeight /2, height - imageHeight + heightMinus, imageHeight, imageHeight - heightMinus);
  }
  
  void endDecision() {
    if (heightLeft <  imageHeight / 6){
        isOut = true;
      }
  }
  
  void startMoveToTitle() {
    if(startCount){
        startCount = false;
        wait = new Wait(4); 
      }
      image(bomb, 0, 0, width, height);
      image(face, width / 2 - imageHeight / 2 , height / 2 - imageHeight / 2, imageHeight, imageHeight);
      isEnd = wait.isEnd();
  }
}