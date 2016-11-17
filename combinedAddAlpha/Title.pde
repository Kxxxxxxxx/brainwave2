class Title {
<<<<<<< HEAD
<<<<<<< HEAD
  PImage wario, sumo, madeInAlpha;
=======
<<<<<<< HEAD
=======
>>>>>>> parent of eb113d8... 元に戻れ
  PImage wario, sumo, madeinalpha6, background1,nonoclean1_1,endurance2,balloon1;
=======
  //AudioPlayer bgmTitle;
  //Minim minim;
  PImage wario, sumo, madeinalpha5, background1;
>>>>>>> a8ba2d397c0e280573cab9af7734f41317f365aa
<<<<<<< HEAD
>>>>>>> parent of eb113d8... 元に戻れ
=======
>>>>>>> parent of eb113d8... 元に戻れ
  final String gameTitle = "メイド　イン　アルファ";
  final String game0 = "ムキムキ耐久ゲーーーム！！";
  final String game1 = "風船早割ゲーーーム！！";
  final String game2 = "耳掃除危機一髪ゲーーーム！！";
  final float posx_bar = 150;
  final float [] posy_bar = {250, 300, 350} ;
  int gameNumber;
<<<<<<< HEAD
  String bal;
<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
  Boolean isMusicStart;
>>>>>>> a8ba2d397c0e280573cab9af7734f41317f365aa
>>>>>>> parent of eb113d8... 元に戻れ
=======
=======
  Boolean isMusicStart;
>>>>>>> a8ba2d397c0e280573cab9af7734f41317f365aa
>>>>>>> parent of eb113d8... 元に戻れ
  
  Title(){
    wario = loadImage("Wariot.jpg");
    sumo = loadImage("sumo.png");
<<<<<<< HEAD
<<<<<<< HEAD
    madeInAlpha = loadImage("madeInAlpha.png");
=======
<<<<<<< HEAD
=======
>>>>>>> parent of eb113d8... 元に戻れ
    madeinalpha6 = loadImage("madeinalpha6.png");
    nonoclean1_1=loadImage("nonoclean1_1.png");
    endurance2=loadImage("endurance2.png");
    balloon1=loadImage("balloon1.png");
=======
    madeinalpha5 = loadImage("madeinalpha5.png");
>>>>>>> a8ba2d397c0e280573cab9af7734f41317f365aa
<<<<<<< HEAD
>>>>>>> parent of eb113d8... 元に戻れ
=======
>>>>>>> parent of eb113d8... 元に戻れ
    gameNumber = 1;
  }
  
  void draw(){
    background(200);
    text(gameTitle,150,200);
    image(madeInAlpha, 150, 200 , 150,30);
    tint(100, 100, 100, 50);
    image(wario, 0, 0 , width,height);
    noTint();
    
    fill(150);
    rect(posx_bar, posy_bar[gameNumber - 1], 80,30);
    
<<<<<<< HEAD
    bal = (game1 + "　最高得点　:　" + loadBalScore());
    
    fill(0, 0, 255);
    text(game0,posx_bar,posy_bar[0]+30);
    text(bal,posx_bar,posy_bar[1]+30);
    text(game2,posx_bar,posy_bar[2]+30);
<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> parent of eb113d8... 元に戻れ
=======
    fill(0, 0, 0);
    image(endurance2,posx_bar,posy_bar[0],160,40);
    //text(game0,posx_bar,posy_bar[0]+30);
    image(balloon1,posx_bar,posy_bar[1],160,40);
    //text(game1,posx_bar,posy_bar[1]+30);
    //text(game2,posx_bar,posy_bar[2]+30);
    image(nonoclean1_1,posx_bar,posy_bar[2]+0,160,30);
>>>>>>> 9312766e170d19f9b1f79efea779cc17394818d5
<<<<<<< HEAD
>>>>>>> parent of eb113d8... 元に戻れ
=======
>>>>>>> parent of eb113d8... 元に戻れ
    
    
    pushMatrix(); //(0, 0)を原点とする座標軸をスタックに格納
    translate(120, 128); // 座標軸を 右に40px, 下に30px移動
    rotate(-PI/13);
    rect(0, 0, 120,30);
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