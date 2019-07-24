class Entry
{
  private String major; // name 
  private int total; // total students
  private float share_women; // how many women
  private String major_cat; // category
  
  public Entry(String m, int t, float s, String c)
  {
    major = m;
    total = t;
    share_women = s;
    major_cat = c;
  }
  
  public String getMajor()
  {
    return major;
  }
  
  public int getTotal()
  {
    return total;
  }
  
  public float getWomen()
  {
    return share_women;
  }
  
  public String getCat()
  {
    return major_cat;
  }
}
