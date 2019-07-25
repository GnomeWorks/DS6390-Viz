// handles overall flow of game states
// static, because we don't instantiate this kind of thing

abstract class State
{
  PImage bg;
  
  abstract public void drawState();
  
  abstract public gameState playerInput();
}
