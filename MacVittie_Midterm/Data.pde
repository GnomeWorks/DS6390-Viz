import java.util.*;

class Data
{
  private Table pubdata;
  private int numEntries;
  private Entry[] entries;
  
  private Set<String> maj_cats_set;
  
  private int totalCount = 0;
  
  public Data()
  {
    pubdata = loadTable("recent-grads.csv", "header");
    numEntries = pubdata.getRowCount();
    
    maj_cats_set = new HashSet<String>();
    
    entries = new Entry[numEntries];
    
    int i = 0;
    
    for(TableRow row : pubdata.rows())
    {
      // Entry(String m, int t, float s, Major_Cat c)
      entries[i] = new Entry(row.getString("Major"), 
                              row.getInt("Total"), 
                              row.getFloat("ShareWomen"), 
                              row.getString("Major_category"));
      
      totalCount += row.getInt("Total");
                              
      i++;
    }
 
    for(Entry e : entries)
    {
      maj_cats_set.add(e.getCat());
    }
  }
  
  public Table getTable()
  {
    return pubdata;
  }
  
  public Entry[] getEntries()
  {
    return entries;
  }
  
  public int getTotal()
  {
    return totalCount;
  }
  
  public ArrayList<String> getCats()
  {
    ArrayList<String> ret = new ArrayList<String>();
    
    for(String s : maj_cats_set)
    {
      ret.add(s);
    }
    
    return ret;
  }
}
