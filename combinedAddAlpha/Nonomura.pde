class Nonomura {
  PImage img;
  PImage photo,photo2,photo3; 
  float bx,by;
  int mouseClickCount=0;
  int quiteNumber=0;
  int startWordCount,gameovercount=0,gameovercount2=0;
  int swabPos;
  int score=0,s=300,ti=-100;

  String[] startWord = {"","3","2","1","GO!"};
 
  Nonomura() {
     strokeWeight(5);
     bx=0;
     by=height*2/4;
     swabPos = 350;
  }
  
  void draw(){
    img = loadImage("nonomura3.jpg");
    image(img, 0, 0, width, height);
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
    photo3 = loadImage("ear1.jpg");
    image(photo3, 160, 0, width/2, height);
  frameRate(10);
  if(swabPos>=305){
    photo = loadImage("nonomura3.jpg");
    image(photo, 420, 300, width/3, height*2/5);
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
    photo = loadImage("nonomura3.jpg");
    image(photo, 420, 300, width/3, height*2/5);
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
    photo = loadImage("nonomura2.jpg");
    image(photo, 420, 300, width/3, height*2/5);
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
    photo = loadImage("nonomura2.jpg");
    image(photo, 420, 300, width/3, height*2/5);
    fill(122);
    rect(305, by, swabPos-125, 10);
    fill(#ff0000);
    rect(swabPos+180, by, 10, 10);
    fill(122);
    rect(swabPos+190, by, 110, 10);
    if(gameovercount==0&&gameovercount2==0){
    score+=1;
    }
    if(170<=s&&s<=200){
      photo = loadImage("samuragouti.jpg");
    image(photo, 420, 0, width/3, height*2/5);
    }
    if(120<=s&&s<=150){
      photo = loadImage("mac.jpg");
    image(photo, 0, 300, width/3, height*2/5);
    }
    if(70<=s&&s<=100){
      photo = loadImage("tramp.jpg");
    image(photo, 420, 0, width/3, height*2/5);
    }
  }else if(115<=swabPos&&swabPos<125){
    photo = loadImage("nonomura2.jpg");
    image(photo, 420, 300, width/3, height*2/5);
    fill(#ff0000);
    rect(305, by, swabPos-115, 10);
    fill(122);
    rect(swabPos+190, by, 110, 10); 
    if(gameovercount==0&&gameovercount2==0){
    score+=1;
    }
    if(s%2==0){
      background(#ff0000);
    }

  }else{
    gameovercount=1;
  }
}

void score(){
  textSize(30);
  text("score:"+score/3, width/10, height/10);
}

void timer(){
  s-=0.1;
  textSize(30);
  text("time:"+s/10, width*3/20, height*2/10);
  if(s==0){
    s+=0;
    gameovercount2=1;
    gameover2();
  }
}

void finishgame(){
   if(mouseClickCount==1){
    photo = loadImage("nonomura5.jpg");
    image(photo, 0, 0, width, height);
    fill(#800080);
    textSize(70);
    text("GAMEOVER!",width*1/2,ti);
    if(ti<height*2/5){
    ti +=50;
    }else{
    ti +=0;
    }   
   }else if(mouseClickCount>=2){
     last();
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
    photo = loadImage("nonomura2.jpg");
    image(photo, 0, 0, width, height);
    fill(#800080);
    textSize(70);
    text("FINISH!",width*1/2,ti);
    if(ti<height*2/5){
    ti +=50;
    }else{
    ti +=0;
    }   
    }
    else if(mouseClickCount>=2){
     last();
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
}