 float theta;
 int r;
 Boolean isStop = false;
 float circleXpos;
 float circleYpos;
 
 void setup() {
   circleYpos = 50;
   theta = 0;
   r = 30;
   noStroke();
   size(400,400);
 }
 void draw() { 
      background(255);
      
      
      
      if(!isStop){
        theta += 0.05;
      //x = 10*abs(r*sin(theta));
        circleXpos = -10*abs(r*cos(theta)) + 350;
      //x = r*sin(theta);
      
      }
      
      stroke(100);
      fill(255,255,255);
      rect(35,35,330,30);
      stroke(150);
      fill(255,255,255);
      ellipse(circleXpos,circleYpos,30,30);
      
      
      
      if(isStop){
        //fill(255,255,255);
        //text("ge", width/2, height/2); 
      fill(0,0,0);
      float score = 100 * (circleXpos - 50) / 300  ;
      textAlign( CENTER );
      text(int(score) +  "点！！", width/2, height/2);  
      }
      
 }
 
 void keyPressed(){
     if (key == ENTER) {
         isStop = true;
     }
     if (key == TAB) {
         isStop = false;
         theta = 0;
     }
 }