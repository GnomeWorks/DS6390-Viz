class StateCombat extends State
{
  gameState type = gameState.COMBAT;
  
  public void drawState()
  {
    background(0);
  }
  
  public gameState playerInput()
  {
    return this.type;
  }
}
