Ball[] ball = new Ball[500];
color[] c = new color[500];
void setup()
{
  
  size(displayWidth, displayHeight);
  for(int i = 0; i < ball.length; i++)
  {
    
    c[i] = color(random(0,255),random(0,10),random(0,10));
    ball[i] = new Ball(int(random(1,1000000)), random(width), random(height), c[i], int(random(2,40)), random(3,300));
  }
  
  
  background(255, 255, 255);
  smooth();  
}
 
void draw()
{ 
  fill(0,10);
  rect(0,0,width,height);
  noStroke();
  for(int i = 0; i < ball.length; i++)
  {
    ball[i].fade();
    ball[i].move();
  } 
}

boolean sketchFullScreen()
{
  return true;
}




