
class Title {
  PImage wario, sumo, madeinalpha6, background1,nonoclean1_1,endurance2,balloon1;
  //AudioPlayer bgmTitle;
  //Minim minim;
  PImage wario, sumo, madeinalpha5, background1;
  final String gameTitle = "メイド　イン　アルファ";
  final String game0 = "ENDURANCE SMILE";
  final String game1 = "BALLOON GUNNER";
  final String game2 = "NONO CLEAN";
  final float posx_bar = 120;
  final float [] posy_bar = {250, 300, 350} ;
  int gameNumber;
  String bal;
  Boolean isMusicStart;
  
  Title(){
    //minim = new Minim(this);
    //bgmTitle = minim.loadFile("Little_March.mp3");
    
    isMusicStart = true;
    wario = loadImage("Wariot.jpg");
    sumo = loadImage("sumo.png");
    madeinalpha6 = loadImage("madeinalpha6.png");
    nonoclean1_1=loadImage("nonoclean1_1.png");
    endurance2=loadImage("endurance2.png");
    balloon1=loadImage("balloon1.png");
    madeinalpha5 = loadImage("madeinalpha5.png");
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
    image(madeinalpha6, width*2/14,height/6 , 300,150);
    tint(100, 100, 100, 50);
    image(wario, 0, 0 , width,height);
    noTint();
    
    fill(255);
    rect(posx_bar, posy_bar[gameNumber - 1], 160,30);
    
    bal = (game1 + "　最高得点　:　" + loadBalScore());
    
    fill(0, 0, 255);
    text(game0,posx_bar,posy_bar[0]+30);
    text(bal,posx_bar,posy_bar[1]+30);
    text(game2,posx_bar,posy_bar[2]+30);
    fill(0, 0, 0);
    image(endurance2,posx_bar,posy_bar[0],160,40);
    //text(game0,posx_bar,posy_bar[0]+30);
    image(balloon1,posx_bar,posy_bar[1],160,40);
    //text(game1,posx_bar,posy_bar[1]+30);
    //text(game2,posx_bar,posy_bar[2]+30);
    image(nonoclean1_1,posx_bar,posy_bar[2]+0,160,30);
    
    
    pushMatrix(); //(0, 0)を原点とする座標軸をスタックに格納
    translate(120, 128); // 座標軸を 右に40px, 下に30px移動
    rotate(-PI/13);
    //rect(0, 0, 120,30);
    popMatrix(); //座標軸の位置をスタックから取り出すし設定する ... この場合(0, 0)
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