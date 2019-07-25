class Entity
{
  String name;
  
  int STR;
  int DEX;
  int CON;
  int INT;
  int WIS;
  int CHA;
  
  int curhp, maxhp;
  int curmp, maxmp;
  int curtp, maxtp;
  
  int Init;
  int AC;
  int DR;
  
  public void rollInit()
  {
    this.Init = rng.nextInt(20) + 1 + calcStatMod("Dex");
  }
  
  public int calcStatMod(String s_)
  {
    switch(s_)
    {
      case "STR":
        return (int)((int)Math.floor(getSTR() / 2) - 5);
      case "DEX":
        return (int)((int)Math.floor(getDEX() / 2) - 5);
      case "CON":
        return (int)((int)Math.floor(getCON() / 2) - 5);
      case "INT":
        return (int)((int)Math.floor(getINT() / 2) - 5);
      case "WIS":
        return (int)((int)Math.floor(getWIS() / 2) - 5);
      case "CHA":
        return (int)((int)Math.floor(getCHA() / 2) - 5);
      default:
        return -5;
    }
  }
  
  public int getSTR()
  {
    return STR;
  }
  
  public int getDEX()
  {
    return DEX;
  }
  
  public int getCON()
  {
    return CON;
  }
  
  public int getINT()
  {
    return INT;
  }
  
  public int getWIS()
  {
    return WIS;
  }
  
  public int getCHA()
  {
    return CHA;
  }
}
