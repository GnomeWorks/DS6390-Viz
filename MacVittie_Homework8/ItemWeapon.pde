class ItemWeapon extends Item
{
  int dmgMin, dmgMax;
  int acc;
  
  WeaponType weapType;
  DamageType dmgType;
  
  // handles default weapon type, which is PUNCHING DUDES
  public ItemWeapon()
  {
    dmgMin = 0;
    dmgMax = 2;
    dmgType = DamageType.BLUDGE;
  }
  
  public ItemWeapon(String n_, String t_, int v_, int a_, int dm_, int dM_, String dT_, String e_)
  {
    name = n_;
    value = v_;
    dmgMin = dm_;
    dmgMax = dM_;
    acc = a_;
    effect = e_;
    
    type = ItemType.WEAPON;
    
    if(t_.equals("Sword"))
    {
      weapType = WeaponType.SWORD;
    }
    else if(t_.equals("Hammer"))
    {
      weapType = WeaponType.HAMMER;
    }
    else if(t_.equals("Gun"))
    {
      weapType = WeaponType.GUN;
    }
    else if(t_.equals("Rod"))
    {
      weapType = WeaponType.ROD;
    }
    
    if(dT_.equals("Slash"))
    {
      dmgType = DamageType.SLASH;
    }
    else if(dT_.equals("Bludge"))
    {
      dmgType = DamageType.BLUDGE;
    }
    else if(dT_.equals("Pierce"))
    {
      dmgType = DamageType.PIERCE;
    }
  }
}
