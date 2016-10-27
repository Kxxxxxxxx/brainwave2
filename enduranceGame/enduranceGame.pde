void setup() {
  size(400, 500);
  imageHeight = 250;
  img_smile = loadImage("smile.png");
  img_cry = loadImage("cry.png");
  img_endure = loadImage("endure.png");
  img_dead = loadImage("dead.png");
  sumo = loadImage("sumo.png");
  bomb = loadImage("bomb.png");
  //pt = new PVector(320,600);
  heightMinus = 0;
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
float imageHeight;
void draw() {
  background(200);
  
  if(!isOut){
      float heightLeft = height - mouseY;

      if (heightLeft < imageHeight) {
        heightMinus = (imageHeight-(height - mouseY));
      }
  
      fill(100);
  
      image(sumo, width / 2 - imageHeight /2, mouseY - 320, imageHeight, imageHeight);
      rect(0, mouseY-100, width, 100);
  
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
      
      if (mouseY > height - (imageHeight / 6)){
        isOut = true;
      }
      
  }else {
    image(bomb, 0, 0, width, height);
    image(face, width / 2 - imageHeight / 2 , height / 2 - imageHeight / 2, imageHeight, imageHeight);
  }
}