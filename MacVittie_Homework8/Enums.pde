enum ItemType
{
  WEAPON,
  ARMOR
}

enum WeaponType
{
  SWORD,
  ROD,
  GUN,
  HAMMER
}

enum ArmorType
{
  LIGHT,
  HEAVY
}

enum DamageType
{
  SLASH,
  PIERCE,
  BLUDGE,
  WIND,
  HOLY,
  LIGHTNING
}

enum gameState
{
  NONE,
  START,
  PARTY_SELECT,
  COMBAT,
  VICTORY
}

enum JobType
{
  CASTER,
  MARTIAL
}

enum EffectType
{
  COVER,
  LOCK,
  TRANQ,
  BLIND,
  PROTECT,
  STOP
}

enum AbilityType
{
  BLUE_MAGIC,
  GREEN_MAGIC,
  CHIVALRY,
  GUNPLAY
}

public String AbilityToString(AbilityType a)
{
  if(a == AbilityType.BLUE_MAGIC)
  {
    return "Blue Magic";
  }
  else if(a == AbilityType.GREEN_MAGIC)
  {
    return "Green Magic";
  }
  else if(a == AbilityType.CHIVALRY)
  {
    return "Chivalry";
  }
  else if(a == AbilityType.GUNPLAY)
  {
    return "Gunplay";
  }
  
  return null;
}
