import java.util.*;

Control controller;
Data data;

Random rng;

PFont ffont;

void setup()
{
  rng = new Random();
  ffont = createFont("/fonts/ff.ttf", 64);
}

void settings()
{
  size(1200, 800);
  
  controller = new Control();
  
  data = new Data();
}

void draw()
{
  controller.drawState();
}

void keyPressed()
{
  controller.handleInput();
  
  /*
  if(controller.getState() == gameState.START)
  {
    println("LOLWUT!");
  }
  */
}
