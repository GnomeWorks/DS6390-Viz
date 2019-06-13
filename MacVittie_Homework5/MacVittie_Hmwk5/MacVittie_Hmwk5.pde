PImage img;
Table pubdata;

int numEntries;

int totalPubs = 0;

int ctr = 0;

class Entry
{
  int year;
  int numPubs;
}

Entry[] entries;

void setup()
{
  size(860, 1694);
  
  img = loadImage("golgi.jpg");
  
  pubdata = loadTable("timeline.csv", "header");
  
  //println(pubdata.getRowCount() + " total rows in table.");
  
  numEntries = pubdata.getRowCount();
  
  entries = new Entry[numEntries];
  
  int i = 0;
  
  for(TableRow row : pubdata.rows())
  {
    entries[i] = new Entry();
    
    entries[i].year = row.getInt("year");
    entries[i].numPubs = row.getInt("count");
    
    totalPubs += entries[i].numPubs;
    
    //println(entries[i].year + ": " + entries[i].numPubs);
    
    i++;
  }
  
  ctr = numEntries - 1;
}

void draw()
{
  background(0);
  
  Entry e = entries[ctr];
  
  int con = 10000;
  
  println(con * ((float)e.numPubs / (float)totalPubs));
  
  image(img, 
          0, 0, width, height,
          width/2 - (int)(con * ((float)e.numPubs / (float)totalPubs)), height/2 - (int)(con * ((float)e.numPubs / (float)totalPubs)),
          width/2 + (int)(con * ((float)e.numPubs / (float)totalPubs)), height/2 + (int)(con * ((float)e.numPubs / (float)totalPubs)));
  
  ctr--;
  
  if(ctr < 0)
  {
    ctr = numEntries - 1;
  }
  
  delay(1000);
}
