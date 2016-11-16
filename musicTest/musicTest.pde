import ddf.minim.*;

Minim minim;
AudioPlayer song;
 
void setup()
{
  minim = new Minim(this);
  song = minim.loadFile("moon_p.mp3");
  song.play();
}

void draw()
{
}

void keyPressed()
{
  if ( key == 'p' )
  {
    song.play();
  }
}
 
void stop()
{
  song.close();
  minim.stop();
  super.stop();
}