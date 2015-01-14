class Ball
{
  // avoid to use LETTERS as names unless you want to be MIB! ;)
  int delay;
  float x;
  float y;
  float xspeed; 
  float yspeed;
  int cor;
  int size;
  float duration;
  private float start;

  Ball (int iDelay, float posX, float posY, int colore, int iSize, float iDuration)
  {
    delay = iDelay;
    x = posX;
    y = posY;
    cor = colore;
    size = iSize;
    duration = iDuration * 1000;
    xspeed = random(-0.05, 0.05);
    yspeed = random(-0.5, 0.05);
  }


  void fade()
  {
     float elapsedTime = millis() - start;
    
    if (delay > 0)
        if (elapsedTime < delay)
            return;
        else
            elapsedTime -= delay;
    
    float amount = 250 * ( elapsedTime / (duration/2) );
    float fading = 0;
    if (elapsedTime < duration/2 )
    {
      fading = amount;
    } 
    else if (elapsedTime < duration)
    {
      fading = 510 - amount;
    }
    else return;
    
    
    fill(cor, fading);
    ellipse(x, y, size, size);
    //println(fading);
  }
  
  void move()
  {
    x += xspeed;
    y += yspeed;
    
    if (x > width+size || x < 0)
    {
      xspeed *=-1;
    }
    
    if (y < 0)
    {
      y = height;
    }
  }
}



