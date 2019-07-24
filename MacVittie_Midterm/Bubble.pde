// code from:
// https://github.com/JakaCikac/BubbleChart/blob/master/Bubble.pde

class Bubble 
{
  // Define position and radius of the bubble.
  float x, y, radius, offsetx, offsety, radiusValue;
  // Define color
  color c;
  
  String name, initial;
  
  ArrayList<Entry> catEntries;
  
  private int catTotal = 0;
 
  Bubble(String name_, float x_, float y_, float radius_, float radiusValue_, color c_) 
  {
    // coordinates to draw the bubble
    x = x_;
    y = y_;
    // radius of the bubble
    //radius = radius_;
    radiusValue = radiusValue_;
    c = c_;
    
    // coordinates for correct data 
    //offsetx = offsetx_;
    //offsety = offsety_;
    
    // Name to display on bubble
    name = name_;
    initial = name.substring(0,1);
    initial = initial.toUpperCase();
    
    retrieveDataForPopup();
   
    radius = ((float)catTotal / (float)d.getTotal()) * 1000;
    
  }
  
  void display() 
  {
    
    // Check if there is a mouse over.
    if (dist(mouseX, mouseY, x, y) <= radius) 
    {
      // Color that the bubble takes on when hovering
      fill(green);
    } 
    else 
    {
      // If there is no mouse over leave the original color
      fill(c);
    }
    
    // display circle
    noStroke();
    ellipse(x, y, radius * 2, radius * 2);
    
    // display text on circle
    fill(0, 102, 153);
    textSize(10);
    text(name, x - textWidth(name)/2, y + textAscent()/2);
  }
  
  void displayLabel() 
  {
    textSize(12);
    
    if (dist(mouseX, mouseY, x, y) <= radius) 
    {
      int numRows = 0;
      String txt = "";
      
      for(Entry e : catEntries)
      {
        txt += e.getMajor() + ": " + e.getTotal() + "\n";
        numRows++;
      }
      
      fill(cyan);
      
      float labX = mouseX; //width/4;
      float labY = mouseY; //height/4;
      
      int len = 500;
      
      rect(labX, labY, len, numRows * 30);
      
      fill(teal);
      
      int cnt = 0;
      
      for(Entry e : catEntries)
      {
        fill(teal);
        rect(labX + 5, labY + 5 + (30 * cnt), len * ((float)e.getTotal() / (float)catTotal), 20);
        
               
        fill(0);
        text(e.getMajor() + " (" + 100 * ((float)e.getTotal() / (float)catTotal) + ")", labX + 5, labY + 20 + (30 * cnt));
        
        cnt++;
      }
    }
  }
  
  void showGender()
  {
    if (dist(mouseX, mouseY, x, y) <= radius)
    {
      fill(cyan);
      
      float labX = mouseX; //width/4;
      float labY = mouseY; //height/4;
      
      int len = 500;
      
      rect(labX, labY, 230, 280);      
      
      fill(0);
      textSize(16);
      text("% WOMEN", labX + 75, labY + 35); 
      
      float womanCount = 0;
      
      for(Entry e : catEntries)
      {
        womanCount += e.getWomen() * (float)e.getTotal();
      }           
    
      float womanPerc = womanCount / (float)catTotal;
      
      int womanAng = (int)(womanPerc * 360f);
      
      int[] angs = { womanAng, 360 - womanAng };
      
      println(womanAng);
      
      float lastAngle = 0;
      
      for(int i =  0; i < angs.length; i++)
      {
        if(lastAngle == 0)
        {
          fill(pink);
        }
        else
        {
          float gray = map(i, 0f, angs.length, 0, 255);
          fill(gray);
        }
        arc(labX + 115, labY + 165, 200f, 200f, (float)lastAngle, (float)lastAngle + radians(angs[i]));
        lastAngle += radians(angs[i]);
      }
    }
  }
  
  void retrieveDataForPopup()
  {
    catEntries = new ArrayList<Entry>();
    
    for(Entry ent : d.getEntries())
    {
      if(ent.getCat().equals(name))
      {
        catTotal += ent.getTotal();
        catEntries.add(ent);
      }
    }
  }
  
  public int getCatTotal()
  {
    return catTotal;
  }
  
}
