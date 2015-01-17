class Agent {
  PVector p, pOld;
  float noiseZ, noiseZVelocity = 0.01;
  float stepSize, angle;

  
  Agent() 
  {
      p = new PVector(random(width),random(height));
      pOld = new PVector(p.x,p.y);
      stepSize = random(1,5);
      // init noiseZ
      setNoiseZRange(0.4);
  }
  
  void update1()
  {
    //Timer & Slider
    float millisecond = millis();
    float second = millisecond/1000;
    float slider = second/10;
    
    //Tweaking values over time
    strokeWidth = slider/20;
    noiseScale = slider*100;
    noiseStrength = slider/10;
    
    
    
    angle = noise(p.x/noiseScale, p.y/noiseScale, noiseZ) * noiseStrength;
    
    p.x += cos(angle) * stepSize;
    p.y += sin(angle) * stepSize;
    
    // offscreen wrap
    if (p.x<-10) p.x=pOld.x=width+10;
    if (p.x>width+10) p.x=pOld.x=-10;
    if (p.y<-10) p.y=pOld.y=height+10;
    if (p.y>height+10) p.y=pOld.y=-10;
    
    
    strokeWeight(strokeWidth*stepSize);
    int colorSelector = int(random(1,10));
    if (colorSelector < 8)
    {
      stroke(200, 8, 10, 70);
    }
    else
    {
      stroke(255,100,3,70);
    }
    
    line(pOld.x,pOld.y, p.x,p.y);

    pOld.set(p);
    noiseZ += noiseZVelocity;
  }
  
  
  void setNoiseZRange(float theNoiseZRange) 
  {
  // small values will increase grouping of the agents
    noiseZ = random(theNoiseZRange);
  }
  
  
}
