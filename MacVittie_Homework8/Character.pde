class Character
{
  String name;
  Job job;
  JobType type;
  int level;
  int curhp, maxhp;
  int curmp, maxmp;
  int curtp, maxtp;
  
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
  }
  
  public void levelUp()
  {
    this.maxhp += this.job.growHP;
    this.maxmp += this.job.growMP;
    this.maxtp += this.job.growTP;
  }
}
