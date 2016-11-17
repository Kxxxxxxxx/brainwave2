import oscP5.*;
import netP5.*;
final int N_CHANNELS = 4;
final int BUFFER_SIZE = 220;
final int PORT = 5000;
OscP5 oscP5 = new OscP5(this, PORT);

float buffer[] = {0,0,0,0};
float max[] = {0,0,0,0};

float a_size, alphaSize;
final float enduranceRate = 0.01;

// ここまでモニター用

void setup() {
  size(400, 500);

  //ここまでモニター
  
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
  alphaSize = 0;
  
    for(int ch = 0; ch < N_CHANNELS; ch++){
  }
  for(int ch = 0; ch < N_CHANNELS; ch++){
    alphaSize += buffer[ch];
  }
  
  alphaSize = alphaSize / 4;

  
  //ここまでモニター
  
 
  if(isEnd){
    state = 0;
    isEnd = false;
    e1 = new Endurance(4);
    b1 = new Balloon();
  }
  
  switch(state){
    case 0: t1.draw();
    break;
    
    case 1: 
    e1.draw();
            isEnd = e1.isEnd;
            e1.power = alphaSize * enduranceRate;
            //値の調整はこの2つのプリントで
            println(e1.speed * (1 + e1.level * 0.1));
            println("------"+ e1.power);
            break;
    
    case 2: b1.draw();
            b1.alphaSum += alphaSize;
            println(b1.alphaSum);
            isEnd = b1.isEnd;
            break;
    
    case 3:  n1.draw();
            isEnd = n1.isEnd;
            n1.swabPos = alphaSize * 1.5;
            println(n1.swabPos);
            break;
 
  }
  
}


void changeWindowSize(int w, int h) {
  surface.setSize(w, h);
}


void mouseClicked(){
  n1.mouseClickCount++;
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
           if (t1.gameNumber == 3){
              changeWindowSize(640, 480);
           }
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

void oscEvent(OscMessage msg){
  float data;
  if(msg.checkAddrPattern("/muse/elements/alpha_relative")){
    //if(msg.checkAddrPattern("/muse/eeg")){
    for(int ch = 0; ch < N_CHANNELS; ch++){
      data = msg.get(ch).floatValue() * 1000;
      //data = (data - (MAX_MICROVOLTS / 2)) / (MAX_MICROVOLTS / 2); // -1.0 1.0
      buffer[ch] = data;
      if(buffer[ch] > max[ch]) {
        max[ch] = buffer[ch];
      }
    }
  }
}