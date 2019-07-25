enum JobType
{
  CASTER,
  MARTIAL
}

class Job
{
  String name;
  String abrev;
  JobType type;
  int startHP;
  int startMP;
  int startTP;
  int STR;
  int DEX;
  int CON;
  int INT;
  int WIS;
  int CHA;
  int growHP;
  int growMP;
  int growTP;
  String weapons;
  String armor;
  String select_img_name;
  
  PImage job_img;
  
  public Job(String n_, String a_, String t_, int sHP_, int sMP_, int sTP_, int str_, int dex_, int con_, int int_, int wis_, int cha_, int gHP_, int gMP_, int gTP_, String wep_, String arm_, String img_)
  {
    this.name = n_;
    this.abrev = a_;
    this.startHP = sHP_;
    this.startMP = sMP_;
    this.startTP = sTP_;
    this.STR = str_;
    this.DEX = dex_;
    this.CON = con_;
    this.INT = int_;
    this.WIS = wis_;
    this.CHA = cha_;
    this.growHP = gHP_;
    this.growMP = gMP_;
    this.growTP = gTP_;
    this.weapons = wep_;
    this.armor = arm_;
    this.select_img_name = "/images/" + this.abrev + "/" + img_;
    
    if(t_.equals("Caster"))
    {
      type = JobType.CASTER;
    }
    else if(t_.equals("Martial"))
    {
      type = JobType.MARTIAL;
    }
    
    this.job_img = loadImage(select_img_name);
  }
}
