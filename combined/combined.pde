void setup() {
  size(400, 500);
  t1 = new Title();
  e1 = new Endurance(3); // level3
  b1 = new Balloon();

  state = 0;
  isEnd = false;
}
Title t1;
Endurance e1;
Balloon b1;

int state;
Boolean isEnd;

//60Hz /s
void draw() {
  
  if(isEnd){
    state = 0;
    isEnd = false;
    e1 = new Endurance(4);
  }
  
  switch(state){
    case 0: t1.draw(); break;
    
    case 1: e1.draw();
            isEnd = e1.isEnd;
            break;
    
    case 2: b1.draw();
            break;
    
    case 3: break;
 
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
           state = t1.gameNumber;
         }
       break;
       
     case 1:
       if (keyCode == UP) {
         e1.power = 2;
       } else if (keyCode == DOWN) {
         e1.power = 0;
         break;
     }
     
     case 2:
     
     case 3:
   }
}