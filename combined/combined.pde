
void setup() {
  size(400, 500);
  t1 = new Title();
  e1 = new Endurance(3); // level3
  b1 = new Balloon();
  n1 = new Nonomura();

  state = 0;
  isEnd = false;
}

Title t1;
Endurance e1;
Balloon b1;
Nonomura n1;

int state;
Boolean isEnd;

//60Hz /s
void draw() {
  
  if(isEnd){
    state = 0;
    isEnd = false;
    e1 = new Endurance(4);
    b1 = new Balloon();
  }
  
  switch(state){
    case 0: t1.draw(); break;
    
    case 1: 
    e1.draw();
            isEnd = e1.isEnd;
            break;
    
    case 2: b1.draw();
            isEnd = b1.isEnd;
            break;
    
    case 3:  n1.draw();
            break;
 
  }
  
}



void changeWindowSize(int w, int h) {
  surface.setSize(w, h);
}


void mouseClicked(){

  n1.mouseClickCount++;
  println(n1.mouseClickCount);
  if(n1.quiteNumber==1){
    exit();
  }
}


void keyPressed() {
   switch(state){
     case 0:
       if (keyCode == DOWN) {
         if(t1.gameNumber >=1 && t1.gameNumber < 3){
           t1.gameNumber += 1;
         }
       } else if (keyCode == UP) {
         if(t1.gameNumber >1 && t1.gameNumber <= 3){
           t1.gameNumber -= 1;
         }
       } else if (keyCode == ENTER) {
           changeWindowSize(640, 480);
           state = t1.gameNumber;
         }
       break;
       
     case 1:
       if (keyCode == UP) {
         e1.power = 2;
       } else if (keyCode == DOWN) {
         e1.power = 0;
     } break;
     
     case 2:
       b1.input += 1;
       if(b1.input == b1.burstInput) {
         b1.numberBurst += 1;
         b1.input = 0;
       }
  
     case 3:
       if (keyCode == RIGHT) {
         n1.swabPos += 3;
       } else if (keyCode == LEFT) {
         n1.swabPos -= 3;
     } break;
     
     
     
   }
   
   
   
}