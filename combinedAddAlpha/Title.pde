
class Title {
  //AudioPlayer bgmTitle;
  //Minim minim;
  PImage wario, sumo, madeinalpha5, background1,enduranceTitle, balloonTitle, nonomuraTitle;
  final String gameTitle = "メイド　イン　アルファ";
  final String game0 = "ENDURANCE SMILE";
  final String game1 = "BALLOON GUNNER";
  final String game2 = "NONO CLEAN";
  final float posx_bar = 80;
  final float [] posy_bar = {240, 290, 340} ;
  int gameNumber;
<<<<<<< HEAD
  String bal;
=======
  Boolean isMusicStart;
>>>>>>> d39e0aac66669cff1955929adc790ac1c9a20dc4
  
  Title(){
    //minim = new Minim(this);
    //bgmTitle = minim.loadFile("Little_March.mp3");
    
    isMusicStart = true;
    wario = loadImage("Wariot.jpg");
    sumo = loadImage("sumo.png");
    madeinalpha5 = loadImage("madeinalpha5.png");
    enduranceTitle = loadImage("enduranceTitle.png");
    balloonTitle = loadImage("balloonTitle.png");
    nonomuraTitle = loadImage("nonomuraTitle.png");
    gameNumber = 1;
  }
  
  void draw(){
    
    //if(isMusicStart){
    //  isMusicStart = false;
    //  bgmTitle.play();
    //}
    background(200);
    
    background1 = loadImage("background1.jpg");
    image(background1, 0, 0, width, height);
    //text(gameTitle,150,200);
    image(madeinalpha5, width*2/14,height/6 , 300,150);
    tint(100, 100, 100, 50);
    image(wario, 0, 0 , width,height);
    noTint();
    
    fill(255);
    noStroke();
    rect(posx_bar, posy_bar[gameNumber - 1] + 35, 300,30);
    
<<<<<<< HEAD
    bal = (game1 + "　最高得点　:　" + loadBalScore());
    
    fill(0, 0, 255);
    text(game0,posx_bar,posy_bar[0]+30);
    text(bal,posx_bar,posy_bar[1]+30);
    text(game2,posx_bar,posy_bar[2]+30);
    
    
    pushMatrix(); //(0, 0)を原点とする座標軸をスタックに格納
    translate(120, 128); // 座標軸を 右に40px, 下に30px移動
    rotate(-PI/13);
    rect(0, 0, 120,30);
    popMatrix(); //座標軸の位置をスタックから取り出すし設定する ... この場合(0, 0)
=======
    fill(0, 255, 0);
    image(enduranceTitle,posx_bar,posy_bar[0]+30);
    image(balloonTitle,posx_bar,posy_bar[1]+30);
    image(nonomuraTitle,posx_bar,posy_bar[2]+30);
  
    //pushMatrix(); //(0, 0)を原点とする座標軸をスタックに格納
    //translate(120, 128); // 座標軸を 右に40px, 下に30px移動
    //rotate(-PI/13);
    //rect(0, 0, 120,30);
    //popMatrix(); //座標軸の位置をスタックから取り出すし設定する ... この場合(0, 0)
>>>>>>> d39e0aac66669cff1955929adc790ac1c9a20dc4
  }
}

int loadBalScore(){
  String Highscore[] = loadStrings("balloonhighscore.txt");
  String sLinedata[] = null;
  String sScore;
  sLinedata = Highscore;
  if(sLinedata != null){
    sScore = sLinedata[0];
  }else{
    sScore = "0";
  }
  return(Integer.parseInt(sScore));
}