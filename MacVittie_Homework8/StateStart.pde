class StateStart extends State
{
  PImage title;
  float speed = 6; 
  float value = 0.0;
  int MAX = 255;
  
  gameState type = gameState.START;
  
  public StateStart()
  {
    bg = loadImage("/images/title.png");
  }
  
  public void drawState()
  {
    background(255);
  
    imageMode(CORNER);
    image(bg, 200, 0);
    
    textSize(40);
    smooth(); 
    textAlign(CENTER);
    
    value += speed;
    
    float fade = MAX - abs(value % (2 * MAX) - MAX);
    fill(0, fade);
    
    textFont(ffont);
    text("PRESS ANY KEY", width/2, height - (height/5));
  }
  
  public gameState playerInput()
  {
    return gameState.PARTY_SELECT;
  }
}
