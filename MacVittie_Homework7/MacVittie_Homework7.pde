// code adapted from 
// https://github.com/CodingTrain/website/tree/master/CodingChallenges/CC_001_StarField/Processing/CC_001_StarField

class Star
{
  float x;
  float y;
  float z;
  float pz; // prev z
  float speed;
  float origSpeed;
  float size;
  
  float relSpeed;
  
  Star()
  {
    relSpeed = 0;
    setVars();
  }
  
  void setVars()
  {
    z = random(width/2);
    x = random(-width/2, width/2);
    y = random(-height/2, height/2);
    speed = random(1, 32);
    
    origSpeed = speed;
    
    if(relSpeed > 0)
    {
      for(int i = 0; i < relSpeed; i++)
      {
        speed *= 1.1;
      }
    }
    else if(relSpeed < 0)
    {
      for(int i = 0; i > relSpeed; i--)
      {
        speed *= .9;
      }
    }
    
    size = random(-2, 24);
    pz = z;
  }
  
  void changeSpeed(int d)
  {
    if(d < 0)
    {
      speed *= .9;
      relSpeed--;
    }
    else if(d > 0)
    {
      speed *= 1.1;
      relSpeed++;
    }
    else if(d == 0)
    {
      speed = origSpeed;
      relSpeed = 0;
    }
  }
  
  void update()
  {
    z = z - speed;
    
    if(z < 1)
    {
      setVars();
    }
    
    if(size >= 1)
    {
      show();
    }
  }
  
  void show()
  {
    fill(255);
    noStroke();
    
    float sx = map(x/z, 0, 1, 0, width/2);
    float sy = map(y/z, 0, 1, 0, height/2);
    
    float r = map(z, 0, width/2, size, 0);
    ellipse(sx, sy, r, r);
    
    pz = z;
  }
}

class StarField
{
  Star[] stars;
  int numStars;
  
  StarField(int i)
  {
    numStars = i;
    stars = new Star[i];
    
    init();
  }
  
  void init()
  {
    for(int i = 0; i < numStars; i++)
    {
      stars[i] = new Star();
    }
  }
  
  void update()
  {
    for(int i = 0; i < numStars; i++)
    {
      stars[i].update();
    }
  }
  
  void changeSpeed(int d)
  {
    println(stars[0].speed);
    
    for(int i = 0; i < numStars; i++)
    {
      stars[i].changeSpeed(d);
    }
  }
}

StarField field;

void setup()
{
  size(1280, 1280);
  
  field = new StarField((int)random(300, 600));
}

void draw()
{
  background(0);
  
  translate(mouseX, mouseY);
  
  field.update();
}

void mousePressed() 
{
  field = new StarField((int)random(300, 600));
}

void keyPressed()
{
  if(key == CODED)
  {
    if(keyCode == UP)
    {
      field.changeSpeed(1);
    }
    else if(keyCode == DOWN)
    {
      field.changeSpeed(-1);
    }
  }
  else if(key == ENTER)
  {
    field.changeSpeed(0);
  }
}
