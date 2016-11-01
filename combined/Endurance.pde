class Endurance {
  PImage img_smile, img_cry, img_endure, img_dead, face, sumo, bomb;
  Boolean isOut = false;
  PVector pos_rect, pos_sumo;

  final float imageHeight = 250;
  final float speed = 1;
  final float posx_sumo = width / 2 - imageHeight / 1.8;
  final float height_rect = imageHeight / 2.5;

  float heightMinus, counter, level, power;
  
  Endurance (int _level){
    img_smile = loadImage("smile.png");
    img_cry = loadImage("cry.png");
    img_endure = loadImage("endure.png");
    img_dead = loadImage("dead.png");
    sumo = loadImage("sumo.png");
    bomb = loadImage("bomb.png");
    pos_rect = new PVector(0, 0);
    pos_sumo = new PVector(posx_sumo, -imageHeight);
    heightMinus = 0;
    power = 0;
    counter = 1;
    level = _level;
  }
  
  
  void draw() {
    background(200);
    if(!isOut){
    
      counter += 1;
      
      if (counter% 181 == 0){
        level += 0.2;
        counter = 1;
      }
      
      // modify the position of objects
      pos_rect.y += speed * (1 + level * 0.1) - power;
      pos_sumo.y = pos_rect.y - imageHeight / 8 * 7;
      
      
      // height between the bottom of the rect and the bottom of the screen
      float heightLeft = height - pos_rect.y - height_rect;
      

      if (heightLeft < imageHeight) {
        heightMinus = (imageHeight-heightLeft);
      }
  
      
  
      image(sumo, pos_sumo.x, pos_sumo.y, imageHeight, imageHeight);
      fill(100);
      rect(0, pos_rect.y, width, height_rect);
  
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
      
      if (heightLeft <  imageHeight / 6){
        isOut = true;
      }
      
    } else {
      image(bomb, 0, 0, width, height);
      image(face, width / 2 - imageHeight / 2 , height / 2 - imageHeight / 2, imageHeight, imageHeight);
    }   
  
  }
  
}