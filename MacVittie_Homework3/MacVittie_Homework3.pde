/* MACVITTIE - HOMEWORK 3 */

/* code adapted from:
  https://forum.processing.org/one/topic/elliptical-orbit.html
  */

float sunDia = 80;

float earthYearLen = .05;

float zoom = 1.0;

/* color, dia, orbRad, ang, angRot, id, numMoons, parent, earthYearLen multiplier */ 
float[] venus = {#9b875F, 24, 144, 0, earthYearLen * 1.63, 1, 0, 0, 1.63};
float[] earth = {#4040FF, 30, 200, 0, earthYearLen, 2, 1, 0, 2, 1};
float[] luna = {#C0C0B4, 6, 26, 0, earthYearLen * 13, 3, 0, 2, 13};
float[] mars = {#FF4500, 20, 304, 0, earthYearLen / 1.88, 4, 2, 0, -1.88};
float[] phobos = {#FFA07A, 4, 26, 0, mars[4] * (687 * 3), 5, 0, 4, 2061};
float[] deimos = {#ABA172, 5, 32, 0, mars[4] * ((687) / 30.3), 6, 0, 4, 22.67};
float[] jupiter = {#A68064, 70, 1040, 0, earthYearLen / 12, 7, 0, 0, -12};

float[][] planets = {venus, earth, luna, mars, phobos, deimos, jupiter};

void doPlanet(float[] planet)
{
  pushMatrix();
  
  rotate(planet[3]);
  
  translate(planet[2], 0);
  
  fill((int)planet[0]);
  ellipse(0, 0, planet[1], planet[1]);

  if(planet[6] > 0) /* if has moons */
  {
    for(int j = 0; j < planets.length; j++)
    {
      /* if parent of checked planet equals current planet's id */
      if(planets[j][7] == planet[5])
      {
        doPlanet(planets[j]);
      }
    }
  }
  
  popMatrix();
}

void setup()
{
  size(1024, 768);
  
  frameRate(30);
}

void draw()
{
  background(#000000);
  
  translate(width/2, height/2);
  scale(zoom);
  
  noStroke();
  
  fill(#FFC840);
  
  ellipse(0, 0, sunDia, sunDia);
  
  for(int i = 0; i < planets.length; i++)
  {
    if(planets[i][7] == 0)
    {
      doPlanet(planets[i]);
    }
    
    planets[i][3] += planets[i][4];
  }
  
  /* handle zooming */
  if(mousePressed)
  {
    if(mouseButton == LEFT)
    {
      zoom += .1;
      
      if(zoom > 2.0)
      {
        zoom = 2.0;
      }
    }
    else if(mouseButton == RIGHT)
    {
      zoom -= .1;
      
      if(zoom < .1)
      {
        zoom = .1;
      }
    }
    else if(mouseButton == CENTER)
    {
      zoom = 1.0;
    }
  }
}

void mouseWheel(MouseEvent event)
{
  float e = event.getCount();
  
  if(e > 0)
  {
    earthYearLen /= 2;
  }
  else if(e < 0)
  {
    earthYearLen *= 2;
  }
  
  /* update planets */
  for(int i = 0; i < planets.length; i++)
  {
    if(planets[i][8] > 0) /* multiply */
    {
      planets[i][4] = earthYearLen * planets[i][8];
    }
    else /* divide */
    {
      planets[i][4] = earthYearLen / (-1 * planets[i][8]);
    }
  }
}
