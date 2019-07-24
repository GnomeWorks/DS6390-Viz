// handles overall flow of game states
// static, because we don't instantiate this kind of thing

enum gameState
{
  NONE,
  START,
  PARTY_SELECT,
  COMBAT,
  VICTORY
}

static class State
{
  gameState curState = gameState.START;
  
  public void changeState(gameState g)
  {
    curState = g;
  }
  
  public gameState getState()
  {
    return curState;
  }
}
