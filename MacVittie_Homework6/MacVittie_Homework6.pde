/* code adapted from here:
  https://forum.processing.org/one/topic/array-line-graph.html
  https://www.processing.org/tutorials/curves/
*/

int[] values = { 250, 250, 250, 150, 350, 200, 250 };
int[] values2 = { 111, 222, 240, 12 };
int[] values3;
int[] values4;
 
void setup() 
{
  size(800, 800);
  strokeWeight(6);
  noFill();
  smooth();
  
  recalc();
}
 
void doValues(int c, int[] v)
{
  stroke(c);
  
  float lineWidth = (float)width / (v.length - 1);
  
  beginShape();
  for(int i = 0; i < v.length; i++)
  {
      curveVertex(i * lineWidth, v[i]);
      
      /* need to repeat the bit for first and last points */
      if(i == 0 || i == (v.length - 1))
      {
        curveVertex(i * lineWidth, v[i]);
      }
  }
  endShape();
}

void draw() 
{
  background(255);

  stroke(#000000);
  
  doValues(#000000, values);
  
  doValues(#EE0000, values2);
  
  doValues(#00EE00, values3);
  
  doValues(#0000EE, values4);
}
 
void mousePressed() 
{
  recalc();
}

void recalc()
{
  values = new int[(int)random(2, 12)];
  values2 = new int[(int)random(4, 8)];
  values3 = new int[(int)random(2, 10)];
  values4 = new int[(int)random(3, 9)];
  
  randomize(values);
  randomize(values2);
  randomize(values3);
  randomize(values4);
}

void randomize(int[] v)
{
  for (int i = 0; i < v.length; i++) 
  {
    v[i] = (int)(height/2 + random(-(height/2) + 1, height/2) - 1);
  }
}
