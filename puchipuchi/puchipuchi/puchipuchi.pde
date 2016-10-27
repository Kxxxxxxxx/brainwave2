int count = 0;
int j = 3;
int k = 3;
int n = 3;
int p = 3;
int r = 3;
int t = 3;
PImage img1;
PImage img2;

void setup(){
  size(400,400);
  img1 = loadImage("husen.jpg");
  img2 = loadImage("haretu.png");
}

void draw(){
  background(255);
  for(int q = 0; q < r; q++){
    for(int s = 0; s < t; s++){
      image(img2,120*q,120*s,120,120);
    }
  }
  for(int l = 0; l < k; l++){
    for(int i = 0; i <= j; i++){
      for(int m = 0; m < n; m++){
        for(int o = 0; o < p; o++){
              image(img1,120*l,120*(i-1),120,120);
              image(img1,120*m,120*o,120,120);
        }
      }
    }
  } 
}

void keyPressed(){
  if (key == ENTER) {
    count++;
  }
  if(count >4){
    if(n == 3){
      j--;
      n--;
      count = 0;
    }
    else{
      n--;
      count = 0;
      if(n == 0){
        n = 3;
        p--;
      }
    }
  }
}