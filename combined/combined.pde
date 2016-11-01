void setup() {
  size(400, 500);
  t1 = new Title();
  e1 = new Endurance(3); // level3
}
Title t1;
Endurance e1;
int state = 0;

//60Hz /s
void draw() {
  
  switch(state){
    case 0: t1.draw(); break;
    
    case 1: e1.draw(); break;
    
    case 2: break;
    
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