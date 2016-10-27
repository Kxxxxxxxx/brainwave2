void setup() {
  size(320, 320);
  imageHeight = 100;
  img_smile = loadImage("smile.png");
  img_cry = loadImage("cry.png");
  img_endure = loadImage("endure.png");
  img_dead = loadImage("dead.png");
  pt = new PVector(320,320);
  heightMinus = 0;
}
PVector pt;
PImage img_smile;
PImage img_cry;
PImage img_endure;
PImage img_dead;

float heightMinus;
float imageHeight;
void draw() {
  background(200);
  
  float heightLeft = pt.y -mouseY;

  if (heightLeft < imageHeight) {
    heightMinus = (imageHeight-(pt.y-mouseY));
  }
  
  fill(100);
  rect(0, mouseY-100, width, 100);
  
  if (heightLeft >= imageHeight / 2 ) {
    image(img_smile, pt.x / 2 - 50, pt.y - 100 + heightMinus, imageHeight, imageHeight - heightMinus);
  } else if (heightLeft >= imageHeight / 3 && heightLeft < imageHeight / 2) {
    image(img_endure, pt.x / 2 - 50, pt.y - 100 + heightMinus, imageHeight, imageHeight - heightMinus);
  } else if (heightLeft >= imageHeight / 4 && heightLeft < imageHeight / 3){
    image(img_cry, pt.x / 2 - 50, pt.y - 100 + heightMinus, imageHeight, imageHeight - heightMinus);
  } else {
    image(img_dead, pt.x / 2 - 50, pt.y - 100 + heightMinus, imageHeight, imageHeight - heightMinus);
  }
  
}