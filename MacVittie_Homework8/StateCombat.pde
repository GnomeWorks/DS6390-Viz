class StateCombat extends State
{
  gameState type = gameState.COMBAT;
  
  PImage btl_info;
  
  ArrayList<PImage> backgrounds;
  
  ArrayList<Character> players;
  
  int charPosXBase = 600;
  int charPosYBase = (height * 2/3) + 75;
  
  int[] charPosX = { charPosXBase, charPosXBase, charPosXBase, charPosXBase };
  int[] charPosY = { charPosYBase, charPosYBase + 50, charPosYBase + 100, charPosYBase + 150 }; 
  
  int charHPXBase = 905;
  int charMPXBase = 1035;
  int charTPXBase = 1140;
  
  int[] charHPXPos = { charHPXBase, charHPXBase, charHPXBase, charHPXBase };
  int[] charMPXPos = { charMPXBase, charMPXBase, charMPXBase, charMPXBase };
  int[] charTPXPos = { charTPXBase, charTPXBase, charTPXBase, charTPXBase };
  
  int[] partyImgXVals = { 1050, 1050, 1050, 1050 };
  int[] partyImgYVals = { 100, 200, 300, 400 };
  
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
    
    players = data.getCharacters();
    
    bg = backgrounds.get(rng.nextInt(backgrounds.size()));
    btl_info = loadImage("/images/battle_info_min.png");
  }
  
  public void drawState()
  {
    background(0);
    
    image(btl_info, 0, height * 2/3, width, height * 1/3);
    
    image(bg, 0, 0, width, height * 2/3);
    
    textFont(ffont);
    
    for(int i = 0; i < players.size(); i++)
    {
      textAlign(LEFT);
      text(players.get(i).name, charPosX[i], charPosY[i]);
      
      textAlign(RIGHT);
      colorizeCombatValues(players.get(i).curhp, players.get(i).maxhp);
      text(players.get(i).curhp, charHPXPos[i], charPosY[i]);      
      colorizeCombatValues(players.get(i).curmp, players.get(i).maxmp);
      text(players.get(i).curmp, charMPXPos[i], charPosY[i]);
      colorizeCombatValues(players.get(i).curtp, players.get(i).maxtp);
      text(players.get(i).curtp, charTPXPos[i], charPosY[i]);
      
      fill(255);
    }
    
    for(int i = 0; i < players.size(); i++)
    {
      image(players.get(i).job.job_img, partyImgXVals[i], partyImgYVals[i], 60, 90); 
    }
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
  
  public void colorizeCombatValues(int c_, int m_)
  {
    if(c_ == 0 && m_ > 0)
      {
        fill(red);
      }
      else if(c_ < (m_ / 4))
      {
        fill(yellow);
      }
      else if(c_ == m_ && c_ > 0)
      {
        fill(green);
      }
      else
      {
        fill(255);
      }
  }
}
