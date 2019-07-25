import java.util.*;

static color red;
static color green;
static color cyan;
static color teal;
static color pink;
static color yellow;

Control controller;
Data data;

Random rng;

PFont ffont;

void setup()
{
  red = color(255, 102, 102, 150);
  green = color(102, 255, 102, 150);
  cyan = color(224, 255, 255, 255);
  teal = color(95, 158, 160, 255);
  pink = color(255, 192, 203, 150);
  yellow = color(255, 255, 153, 150);
  
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
}
