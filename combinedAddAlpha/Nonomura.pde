class Nonomura {
  PImage Nonoimg,Nonoimg2,Nonoimg3,Nonoimg5,earimg,Samuraimg,macimg,trampimg;
  float bx,by, swabPos;
  int mouseClickCount=0;
  int quiteNumber=0;
  int startWordCount,gameovercount=0,gameovercount2=0;
  int score=0,timeLimit=300,posResult=-100;

  String[] startWord = {"","3","2","1","GO!"};
  Boolean isMusicStart, startCount, isEnd;
  
  Wait wait;
 
  Nonomura() {
    startCount = true;
    isMusicStart = true;
    isEnd = false;
     strokeWeight(5);
     bx=0;
     by=height*2/4;
     swabPos = 350;
  }
  
  void draw(){
    Nonoimg3 = loadImage("nonomura3.jpg");
    image(Nonoimg3, 0, 0, width, height);
    if(mouseClickCount==0) startWindow();
    else goGame();
  }
  
  void startWindow(){
    title();
    drawStar(width/2,height/2);
    startWord();
}

void goGame(){
  if(startWordCount >= startWord.length){
    if(gameovercount==0){
    game();
    score();
    timer();
    }else{
    finishgame();
    }
  }else{
    areYouReady();
    startWordCount++;
  }
}


void title(){
  fill(255);
  textAlign(CENTER);
  textSize(80);
  text("NONO CLEAN",width/2,height/3);
}

void drawStar(int px,int py) {
  noStroke();
  smooth();
  fill(255, 255, 0);
  beginShape();
    vertex(px      , py - 40);
    vertex(px - 24 , py + 30);
    vertex(px + 36 , py -  16);
    vertex(px - 36 , py -  16);
    vertex(px + 24 , py + 30);
  endShape(CLOSE);
}


void startWord(){
  fill(255);
  textAlign(CENTER);
  textSize(24);
  text("Click Schreen and you start game",width/2,height*2/3);
}
  

void game() {
 
    background(255);
    earimg = loadImage("ear1.jpg");
    image(earimg, 160, 0, width/2, height);
  frameRate(10);
  
  
  
  if(swabPos>=305){
    Nonoimg3 = loadImage("nonomura3.jpg");
    image(Nonoimg3, 420, 300, width/3, height*2/5);
    fill(122);
    rect(swabPos, by, 310, 10);
    fill(#ff0000);
    rect(swabPos+20, by, 10, 10);
    //fill(122);
    //rect(swabPos+30, by, 150, 10);
    //fill(#ff0000);
    rect(swabPos+180, by, 10, 10);
    fill(122);
    //rect(swabPos+190, by, 120, 10);
  }else if(285<=swabPos&&swabPos<305){
    Nonoimg3 = loadImage("nonomura3.jpg");
    image(Nonoimg3, 420, 300, width/3, height*2/5);
    fill(122);
    rect(305, by, swabPos-285, 10);
    fill(#ff0000);
    rect(swabPos+20, by, 10, 10);
    fill(122);
    rect(swabPos+30, by, 150, 10);
    fill(#ff0000);
    rect(swabPos+180, by, 10, 10);
    fill(122);
    rect(swabPos+190, by, 110, 10);
  }else if(275<=swabPos&&swabPos<285){
    Nonoimg2 = loadImage("nonomura2.jpg");
    image(Nonoimg2, 420, 300, width/3, height*2/5);
    fill(#ff0000);
    rect(305, by, swabPos-275, 10);
    fill(122);
    rect(swabPos+30, by, 150, 10);
    fill(#ff0000);
    rect(swabPos+180, by, 10, 10);
    fill(122);
    rect(swabPos+190, by, 110, 10);
    if(gameovercount==0&&gameovercount2==0){
    score+=1;
    }
  }else if(125<=swabPos&&swabPos<275){
    Nonoimg2 = loadImage("nonomura2.jpg");
    image(Nonoimg2, 420, 300, width/3, height*2/5);
    fill(122);
    rect(305, by, swabPos-125, 10);
    fill(#ff0000);
    rect(swabPos+180, by, 10, 10);
    fill(122);
    rect(swabPos+190, by, 110, 10);
    if(gameovercount==0&&gameovercount2==0){
    score+=1;
    }
    if(170<=timeLimit&&timeLimit<=200){
      Samuraimg = loadImage("samuragouti.jpg");
    image(Samuraimg, 420, 0, width/3, height*2/5);
    }
    if(120<=timeLimit&&timeLimit<=150){
      macimg = loadImage("mac.jpg");
    image(macimg, 0, 300, width/3, height*2/5);
    }
    if(70<=timeLimit&&timeLimit<=100){
      trampimg = loadImage("tramp.jpg");
    image(trampimg, 420, 0, width/3, height*2/5);
    }
  }else if(115<=swabPos&&swabPos<125){
    Nonoimg2 = loadImage("nonomura2.jpg");
    image(Nonoimg2, 420, 300, width/3, height*2/5);
    fill(#ff0000);
    rect(305, by, swabPos-115, 10);
    fill(122);
    rect(swabPos+190, by, 110, 10); 
    if(gameovercount==0&&gameovercount2==0){
    score+=1;
    }
    if(timeLimit%2==0){
      background(#ff0000);
    }

  }else{
    if(timeLimit!=0){
    gameovercount=1;
    }
  }
}

void score(){
  textSize(30);
  text("score:"+score/3, width/10, height/10);
}

void timer(){
  timeLimit-=0.1;
  textSize(30);
  text("time:"+timeLimit/10, width*3/20, height*2/10);
  if(timeLimit==0){
    timeLimit+=0;
    gameovercount2=1;
    gameover2();
  }
}

void finishgame(){
   if(mouseClickCount==1){
    Nonoimg5 = loadImage("nonomura5.jpg");
    image(Nonoimg5, 0, 0, width, height);
    fill(#800080);
    textSize(70);
    text("GAMEOVER!",width*1/2,posResult);
    if(posResult<height*2/5){
    posResult +=50;
    }else{
    posResult +=0;
    }   
   }else if(mouseClickCount>=2){
     startMoveToTitle();
   }        
}



void areYouReady(){
  frameRate(1);
  textSize(100);
  textAlign(CENTER);
  text(startWord[startWordCount], width/2, height/2);
}



void gameover2(){
    if(mouseClickCount==1){
    Nonoimg2 = loadImage("nonomura2.jpg");
    image(Nonoimg2, 0, 0, width, height);
    fill(#800080);
    textSize(70);
    text("FINISH!",width*1/2,posResult);
    if(posResult<height*2/5){
    posResult +=50;
    }else{
    posResult +=0;
    }   
    }
    else if(mouseClickCount>=2){
     startMoveToTitle();
    }
}
  
void last(){
    background(255);
    textSize(50);
    text("score:"+score/3,width*1/2,height*1/2);
}

void mouseClicked(){
  mouseClickCount++;
  println(mouseClickCount);
  if(quiteNumber==1){
    exit();
  }
}

void startMoveToTitle() {
    if(startCount){
        startCount = false;
        wait = new Wait(4); 
      }
      last();
      isEnd = wait.isEnd();
  }
  
}