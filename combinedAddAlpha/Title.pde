class Title {
  PImage wario, sumo, madeInAlpha;
  final String gameTitle = "メイド　イン　アルファ";
  final String game0 = "ムキムキ耐久ゲーーーム！！";
  final String game1 = "風船早割ゲーーーム！！";
  final String game2 = "耳掃除危機一髪ゲーーーム！！";
  final float posx_bar = 150;
  final float [] posy_bar = {250, 300, 350} ;
  int gameNumber;
  
  Title(){
    wario = loadImage("Wariot.jpg");
    sumo = loadImage("sumo.png");
    madeInAlpha = loadImage("madeInAlpha.png");
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
    
    fill(0, 0, 255);
    text(game0,posx_bar,posy_bar[0]+30);
    text(game1,posx_bar,posy_bar[1]+30);
    text(game2,posx_bar,posy_bar[2]+30);
    
    
    pushMatrix(); //(0, 0)を原点とする座標軸をスタックに格納
    translate(120, 128); // 座標軸を 右に40px, 下に30px移動
    rotate(-PI/13);
    rect(0, 0, 120,30);
    popMatrix(); //座標軸の位置をスタックから取り出すし設定する ... この場合(0, 0)
  }
}