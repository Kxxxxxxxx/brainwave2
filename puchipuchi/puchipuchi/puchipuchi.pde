int count = 0;
int j = 8;

void setup(){
  size(400,400);
}

void draw(){
  background(255);
  for(int i = 0; i < j; i++){
    rect(40*i,40*i,40,40);
  } 
}

void keyPressed(){
  if (key == ENTER) {
    count++;
  }
  
  if(count >4){
    j--;
    count = 0;
  }
}