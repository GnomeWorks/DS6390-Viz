int check = 0;

void settings()
{
  size(800, 800);
}

void draw()
{
  background(0);
  
  if(check == 0)
  {
    rect(100, 100, 100, 100);
  }
  else
  {
    rect(200, 200, 200, 200);
  }
}

void keyPressed()
{
  check++;
  redraw();
}
