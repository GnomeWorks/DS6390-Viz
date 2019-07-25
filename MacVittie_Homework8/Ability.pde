class Ability
{
  String name;
  AbilityType type;
  int hpcost;
  int mpcost;
  int tpcost;
  int delay;
  
  int dmgMin;
  int dmgMax;
  DamageType dmgType;
  
  int healMin;
  int healMax;
  
  String target;
  String targetType;
  
  EffectType effect;
  
  int effectDur;
  
  public Ability(String n_, String t_, int hp_, int mp_, int tp_, int d_, int dm_, int dM_, String dT_, int hm_, int hM_, String tt_, String tT_, String e_, int eD_)
  {
    name = n_;
    hpcost = hp_;
    mpcost = mp_;
    tpcost = tp_;
    delay = d_;
    dmgMin = dm_;
    dmgMax = dM_;
    healMin = hm_;
    healMax = hM_;
    target = tt_;
    targetType = tT_;
    effectDur = eD_;
    
    // parse out ability type, damage type, effect type
    
    if(t_.equals("Blue Magic"))
    {
      type = AbilityType.BLUE_MAGIC;
    }
    if(t_.equals("Green Magic"))
    {
      type = AbilityType.GREEN_MAGIC;
    }
    if(t_.equals("Chivalry"))
    {
      type = AbilityType.CHIVALRY;
    }
    if(t_.equals("Gunplay"))
    {
      type = AbilityType.GUNPLAY;
    }
    
    if(dT_.equals("Slash"))
    {
      dmgType = DamageType.SLASH;
    }
    if(dT_.equals("Pierce"))
    {
      dmgType = DamageType.PIERCE;
    }
    if(dT_.equals("Bludge"))
    {
      dmgType = DamageType.BLUDGE;
    }
    if(dT_.equals("Wind"))
    {
      dmgType = DamageType.WIND;
    }
    
    if(e_.equals("Cover"))
    {
      effect = EffectType.COVER;
    }
    if(e_.equals("Lock"))
    {
      effect = EffectType.LOCK;
    }
    if(e_.equals("Tranq"))
    {
      effect = EffectType.TRANQ;
    }
    if(e_.equals("Blind"))
    {
      effect = EffectType.BLIND;
    }
    if(e_.equals("Protect"))
    {
      effect = EffectType.PROTECT;
    }
  }
}
