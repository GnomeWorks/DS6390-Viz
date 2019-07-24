static Data d;

ArrayList<Bubble> major_cat_bubbles;

static color red;
static color green;
static color cyan;
static color teal;
static color pink;

boolean showGender = false;

void setup()
{
  size(800, 800);
  
  red = color(255, 102, 102, 150);
  green = color(102, 255, 102, 150);
  cyan = color(224, 255, 255, 255);
  teal = color(95, 158, 160, 255);
  pink = color(255, 192, 203, 150);
  
  d = new Data();
  
  major_cat_bubbles = new ArrayList<Bubble>();
  
  ArrayList<String> cats = d.getCats();
  
  int posx = width/8;
  int posy = width/8;
  
  for(String s : cats)
  {
    Bubble b = new Bubble(s, posx, posy, 50, 50, red);
    
    major_cat_bubbles.add(b);
    
    /* set next bubbles */
    posx += width/4;
    
    if(posx > width)
    {
      posx = width/8;
      posy += width/4;
    }
  }
}

void draw()
{  
    background(255);
 
    for(Bubble b : major_cat_bubbles)
    {
      b.display();
      if(showGender)
      {
        b.showGender();
      }
      else
      {
        b.displayLabel();
      }
    }
}

void mousePressed()
{
  if(showGender)
  {
    showGender = false;
  }
  else
  {
    showGender = true;
  }
}
