class Title {
  PImage wario, sumo;
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
    gameNumber = 1;
  }
  
  void draw(){
    background(200);
    text(gameTitle,150,200);
    tint(100, 100, 100, 50);
    image(wario, 0, 0 , width,height);
    noTint();
    
    fill(150);
    rect(posx_bar, posy_bar[gameNumber - 1], 80,30);
    
    fill(0, 0, 255);
    text(game0,posx_bar,posy_bar[0]+30);
    text(game1,posx_bar,posy_bar[1]+30);
    text(game2,posx_bar,posy_bar[2]+30);
  }
}