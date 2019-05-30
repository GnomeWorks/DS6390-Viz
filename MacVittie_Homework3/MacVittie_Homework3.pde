/* MACVITTIE - HOMEWORK 3 */

/* code adapted from:
  https://forum.processing.org/one/topic/elliptical-orbit.html
  */

float sunDia = 80;

/* color, dia, orbRad, ang, angRot, id, numMoons, parent */ 
float[] venus = {#9b875F, 24, 120, 0, .008, 1, 0, 0};
float[] earth = {#4040FF, 30, 200, 0, .005, 2, 1, 0};
float[] luna = {#C0C0B4, 6, 26, 0, .02, 3, 0, 2};
float[] mars = {#FF4500, 20, 320, 0, .002, 4, 2, 0};
float[] phobos = {#FFA07A, 4, 26, 0, .05, 5, 0, 4};
float[] deimos = {#ABA172, 5, 32, 0, .035, 6, 0, 4};

float[][] planets = {venus, earth, luna, mars, phobos, deimos};

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
  
  noStroke();
  
  fill(#FFC840);
  
  ellipse(0, 0, sunDia, sunDia);
  
  doPlanet(venus);
  doPlanet(earth);
  doPlanet(mars);
  
  for(int i = 0; i < planets.length; i++)
  {
    planets[i][3] += planets[i][4];
  }
}
