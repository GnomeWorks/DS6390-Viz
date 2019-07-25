class Data
{
  private Table classData;
  private Table weapData;
  private Table armorData;
  
  private ArrayList<Job> jobs;
  
  public Data()
  {
    this.init();
  }
  
  private void init()
  {
    classData = loadTable("/data/classes.csv", "header");
    weapData = loadTable("/data/weapons.csv", "header");
    armorData = loadTable("/data/armor.csv", "header");
    
    doClasses();
    //doWeapons();
    //doArmor();
  }
  
  private void doClasses()
  {
    jobs = new ArrayList<Job>();
    
    for(TableRow t : classData.rows())
    {
      Job j = new Job(t.getString("NAME"),
                      t.getString("ABRV"),
                      t.getString("TYPE"),
                      t.getInt("STARTHP"),
                      t.getInt("STARTMP"),
                      t.getInt("STARTTP"),
                      t.getInt("STR"),
                      t.getInt("DEX"),
                      t.getInt("CON"),
                      t.getInt("INT"),
                      t.getInt("WIS"),
                      t.getInt("CHA"),
                      t.getInt("HPGROW"),
                      t.getInt("MPGROW"),
                      t.getInt("TPGROW"),
                      t.getString("WEAPONPROF"),
                      t.getString("ARMPROF"),
                      t.getString("IMAGE"));
      
      this.jobs.add(j);
    }
  }
}
