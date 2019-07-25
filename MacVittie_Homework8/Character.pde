class Character extends Entity
{
  Job job;
  JobType type;
  int level;
  
  int xp;
  
  ItemWeapon eWeapon;
  
  ArrayList<Ability> abilityList;
  
  ArrayList<String> commands;
  
  public Character(String n_, Job j_)
  {
    this.name = n_;
    this.job = j_;
    
    this.level = 1;
    
    this.maxhp = this.job.startHP;
    this.curhp = this.maxhp;
    
    this.maxmp = this.job.startMP;
    this.curmp = this.maxmp;
    
    this.maxtp = this.job.startTP;
    this.curtp = this.maxtp;
    
    this.type = this.job.type;
    
    this.STR = j_.STR;
    this.DEX = j_.DEX;
    this.CON = j_.CON;
    this.INT = j_.INT;
    this.WIS = j_.WIS;
    this.CHA = j_.CHA;
    
    this.xp = 0;
    
    this.eWeapon = null;
    
    this.setAbilities();
    
    commands = new ArrayList<String>();
    
    commands.add("Fight");
    commands.add(AbilityToString(this.job.ability));
  }
  
  public void levelUp()
  {
    this.level++;
    
    this.maxhp += this.job.growHP;
    this.maxmp += this.job.growMP;
    this.maxtp += this.job.growTP;
  }
  
  public void applyXP(int x_)
  {
    this.xp += x_;
    
    if(this.xp > (this.level * 100))
    {
      this.levelUp();
      
      this.xp -= ((this.level - 1) * 100);
    }
  }
  
  public void equipWeapon(ItemWeapon w)
  {
    this.eWeapon = w;
  }
  
  public ItemWeapon getWeapon()
  {
    if(this.eWeapon == null) // barehanded, for some reason?
    {
      return new ItemWeapon();
    }
    else
    {
      return this.eWeapon;
    }
  }
  
  public void setAbilities()
  {
    this.abilityList = new ArrayList<Ability>();
    
    for(Ability a : data.getAbilities())
    {
      if(a.type == this.job.ability)
      {
        this.abilityList.add(a);
      }
    }
  }
}
