class Data
{
  private Table classData;
  private Table weapData;
  private Table armorData;
  private Table abilityData;
  
  private ArrayList<Job> jobs;
  private ArrayList<ItemWeapon> weapons;
  private ArrayList<Ability> abilities;
  
  private ArrayList<Character> chars;
  
  public Data()
  {
    this.init();
  }
  
  private void init()
  {
    classData = loadTable("/data/classes.csv", "header");
    weapData = loadTable("/data/weapons.csv", "header");
    armorData = loadTable("/data/armor.csv", "header");
    abilityData = loadTable("/data/abilities.csv", "header");
    
    doClasses();
    doWeapons();
    //doArmor();
    doAbilities();
    
    chars = new ArrayList<Character>();
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
                      t.getString("IMAGE"),
                      t.getString("ABILITY"));
      
      this.jobs.add(j);
    }
  }
  
  private void doWeapons()
  {
    weapons = new ArrayList<ItemWeapon>();
    
    for(TableRow t : weapData.rows())
    {
      ItemWeapon w = new ItemWeapon(t.getString("NAME"),
                            t.getString("TYPE"),
                            t.getInt("VALUE"),
                            t.getInt("ACC"),
                            t.getInt("DMGLOW"),
                            t.getInt("DMGHIGH"),
                            t.getString("DMGTYPE"),
                            t.getString("EFFECT"));
                            
      this.weapons.add(w);
    }
  }
  
  private void doAbilities()
  {
    abilities = new ArrayList<Ability>();
    
    for(TableRow t : abilityData.rows())
    {
      Ability a = new Ability(t.getString("NAME"),
                              t.getString("TYPE"),
                              t.getInt("HPCOST"),
                              t.getInt("MPCOST"),
                              t.getInt("TPCOST"),
                              t.getInt("DELAY"),
                              t.getInt("DMGMIN"),
                              t.getInt("DMGMAX"),
                              t.getString("DMGTYPE"),
                              t.getInt("HEALMIN"),
                              t.getInt("HEALMAX"),
                              t.getString("TARGET"),
                              t.getString("TARGETTYPE"),
                              t.getString("EFFECT"),
                              t.getInt("EFFECTDUR"));
                              
      this.abilities.add(a);
    }
    
  }
  
  public void setCharacters(ArrayList<Character> list)
  {
    this.chars = list;
    
    for(Character c : chars)
    {
      // random weapon
      ArrayList<ItemWeapon> wList = new ArrayList<ItemWeapon>();
      
      for(ItemWeapon w : weapons) //<>//
      {
        if(c.job.wepProf.contains(w.weapType))
        {
          wList.add(w);
        }
      }
      
      if(wList.size() > 0)
      {
        ItemWeapon w = wList.get(rng.nextInt(wList.size()));
      
        c.equipWeapon(w);
      }
    }
  }
  
  public ArrayList<Character> getCharacters()
  {
    return this.chars;
  }
  
  public ArrayList<Ability> getAbilities()
  {
    return this.abilities;
  }
}
