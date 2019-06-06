// code adapted from 
// https://github.com/CodingTrain/website/tree/master/CodingChallenges/CC_001_StarField/Processing/CC_001_StarField

class Star
{
  float x;
  float y;
  float z;
  float pz; // prev z
  float speed;
  float size;
  
  Star()
  {
    setVars();
  }
  
  void setVars()
  {
    z = random(width/2);
    x = random(-width/2, width/2);
    y = random(-height/2, height/2);
    speed = random(1, 32);
    size = random(-2, 24);
    pz = z;
  }
  
  void update()
  {
    z = z - speed;
    
    if(z < 1)
    {
      setVars();
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

Star[] stars = new Star[400];

void setup()
{
  size(1280, 1280);
  
  for(int i = 0; i < stars.length; i++)
  {
    stars[i] = new Star();
  }
}

void draw()
{
  background(0);
  
  translate(width/2, height/2);
  
  for(int i = 0; i < stars.length; i++)
  {
    stars[i].update();
    
    if(stars[i].size >= 1)
    {
       stars[i].show(); 
    }
  }
}
