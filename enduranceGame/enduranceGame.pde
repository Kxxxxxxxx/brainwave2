void setup() {
  size(400, 500);
  img_smile = loadImage("smile.png");
  img_cry = loadImage("cry.png");
  img_endure = loadImage("endure.png");
  img_dead = loadImage("dead.png");
  sumo = loadImage("sumo.png");
  bomb = loadImage("bomb.png");
  //pt = new PVector(320,600);
  heightMinus = 0;
  power = 0;
  counter = 1;
  level = 1;

  pos_rect = new PVector(0, 0);
  pos_sumo = new PVector(posx_sumo, -imageHeight);
  rect(pos_rect.x, pos_rect.y, width, height_rect);
  println(pos_rect.x);
  println(pos_rect.y);
  println(width);
  println(height_rect);
 
}
//PVector pt;
PImage img_smile;
PImage img_cry;
PImage img_endure;
PImage img_dead;
PImage face;
PImage sumo;
PImage bomb;

Boolean isOut = false;

float heightMinus;
final float imageHeight = 250;

PVector pos_rect;
PVector pos_sumo;
final float speed = 1;
final float posx_sumo = width / 2;
final float height_rect = imageHeight / 2.5;


float counter;
float level;
float power;


//60Hz /s
void draw() {
  background(200);
  
  
  if(!isOut){
    
      counter += 1;
      
      if (counter% 181 == 0){
        level += 0.2;
        counter = 1;
      }
      
      println(power);
      pos_rect.y += speed * level - power;
      pos_sumo.y = pos_rect.y - imageHeight / 8 * 7;
      
      float heightLeft = height - pos_rect.y - height_rect;
      

      if (heightLeft < imageHeight) {
        heightMinus = (imageHeight-heightLeft);
      }
  
      fill(100);
  
      image(sumo, pos_sumo.x, pos_sumo.y, imageHeight, imageHeight);
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
      
  }else {
    image(bomb, 0, 0, width, height);
    image(face, width / 2 - imageHeight / 2 , height / 2 - imageHeight / 2, imageHeight, imageHeight);
  }
}


void keyPressed() {
  if (keyCode == UP) {
       power = 2;
    } else if (keyCode == DOWN) {
       power = 0;
    }
}