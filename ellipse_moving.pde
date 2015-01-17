import controlP5.*;

// Timer
int millisecond = millis();
int second = millisecond/1000;
int minute = second/60;

// Agents
Agent[] agents = new Agent[2000];
float noiseScale = 100, noiseStrength = 10, noiseZRange = 0.4;
float overlayAlpha = 10, agentsAlpha = 90, strokeWidth = 0.3;
int drawMode = 1;


// Balls
Ball[] ball = new Ball[2000];
color[] c = new color[2000];


void setup()
{
  // Timer
  int millisecond = millis();
  int second = millisecond/1000;
  int minute = second/60;

  size(displayWidth, displayHeight);

  // Agents 
  for (int i = 0; i < agents.length; i++)
  {
    agents[i] = new Agent();
  }

  // Balls
  for (int i = 0; i < ball.length; i++)
  {
      int colorSelector = int(random(0,10));
      if(colorSelector < 7)
      {
        c[i] = color(random(155,255), random(0,100), random(0,10), random(0,200));
      }
      else
      {
        c[i] = color(255, random(155,255), random(90,255), random(0,200));
      }
    
      ball[i] = new Ball(int(random(1, 10000)), random(width), random(height), c[i], int(random(1, 5)), random(4,30));
  }
  
  background(255, 255, 255);
  smooth();
}

void draw()
{ 
  //Overlay
  fill(0, 40);
  rect(0, 0, width, height);

  // Timer
  int millisecond = millis();
  int second = millisecond/1000;
  int minute = second/60;

// Agents Entrance
  if (second > 60)
  {

    for (int i = 0; i < agents.length; i++)
    {
      
      agents[i].update1();
    }
  }
  // BALLS

  noStroke();
  for (int i = 0; i < ball.length; i++)
  {
    ball[i].fade();
    ball[i].move(); 
  }
}

boolean sketchFullScreen()
{
  return true;
}



