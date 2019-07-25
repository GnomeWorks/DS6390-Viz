class StateCombat extends State
{
  gameState type = gameState.COMBAT;
  
  ArrayList<PImage> backgrounds;
  
  public StateCombat()
  {
    String path = sketchPath();
    
    path += "/images/btl_bgs/";
    
    backgrounds = new ArrayList<PImage>();
    
    String[] filenames = listFileNames(path);
     
    for(String s : filenames) //<>//
    {
      String img_path = path + s;
      
      PImage img = loadImage(img_path);
      
      backgrounds.add(img);
    }
    
    bg = backgrounds.get(rng.nextInt(backgrounds.size()));
  }
  
  public void drawState()
  {
    background(0);
    
    image(bg, 0, 0, width, height * 2/3);
  }
  
  public gameState playerInput()
  {
    bg = backgrounds.get(rng.nextInt(backgrounds.size()));
    
    return this.type;
  }
  
  String[] listFileNames(String dir) 
  {
    File file = new File(dir);
    
    if (file.isDirectory()) 
    {
      String names[] = file.list();
      return names;
    } 
    else 
    {
      // If it's not a directory
      return null;
    }
  }
}
