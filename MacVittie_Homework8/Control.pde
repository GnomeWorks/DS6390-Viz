// handles overall flow of game states
class Control
{
  State curState;
  
  gameState curStateType = gameState.START;
  
  public Control()
  {
    this.init();
  }
  
  public void init()
  {
    curStateType = gameState.START;
    curState = new StateStart();
  }
  
  public void changeState(gameState g)
  {
    curStateType = g;
  }
  
  public gameState getState()
  {
    return curStateType;
  }
  
  public void drawState()
  {
    curState.drawState();
  }
  
  public void handleInput()
  {
    gameState newStateType = curState.playerInput();
    
    if(newStateType != curStateType)
    {
      switch(newStateType)
      {
        case START:
          curState = new StateStart();
          curStateType = gameState.START;
          break;
        case PARTY_SELECT:
          curState = new StateCharacterSelect();
          curStateType = gameState.PARTY_SELECT;
          break;
        case COMBAT:
          curState = new StateCombat();
          curStateType = gameState.COMBAT;
        default:        
          break;
      }
    }
  }
}
