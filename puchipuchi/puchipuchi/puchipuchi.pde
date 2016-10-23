int count = 0;
int j = 8;
int k = 8;
int n = 8;
int p = 8;

void setup(){
  size(400,400);
}

void draw(){
  background(255);
  for(int l = 0; l < k; l++){
    for(int i = 0; i < j; i++){
      for(int m = 0; m < n; m++){
        for(int o = 0; o < p; o++){
          rect(40*l,40*i,40,40);
          rect(40*m,40*o,40,40);
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
    if(n == 8){
      j--;
      n--;
      count = 0;
    }
    if(n < 8){
      n--;
      count = 0;
      if(n == 0){
        n = 8;
        p--;
      }
    }
  }
}