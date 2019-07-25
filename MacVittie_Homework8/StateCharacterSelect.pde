import java.awt.event.KeyEvent;

enum selMode
{
  JOB,
  NAME
}

class JobSelector
{
  PImage img;
  Job curJob;
  int posX;
  int posY;
  String jobName;
  String charName;
  
  int jobNameX;
  int jobNameY;
  
  int charNameX;
  int charNameY;
  
  float speed = 3; 
  float value = 0.0;
  int MAX = 120;
  int MIN = 120;
  
  public boolean sel = false;
  
  public JobSelector(Job j_, int x_, int y_)
  {
    curJob = j_;
    posX = x_;
    posY = y_;
    
    img = curJob.job_img;
    jobName = curJob.name;
    charName = "";
    
    jobNameX = posX + 40;
    jobNameY = posY - 30;
    
    charNameX = posX + 40;
    charNameY = posY + 170;
    
    //charName = "D00D";
  }
  
  public void cycleJobRight()
  {
    for(int i = 0; i < data.jobs.size(); i++)
    {
      if(curJob.name.equals(data.jobs.get(i).name))
      {
        if(i < data.jobs.size() - 1)
        {
          curJob = data.jobs.get(i + 1);
        }
        else
        {
          curJob = data.jobs.get(0);
        }
        
        break;
      }
    }
    
    img = curJob.job_img;
    jobName = curJob.name;
  }
  
  public void cycleJobLeft()
  {
    for(int i = data.jobs.size() - 1; i > -1; i--)
    {
      if(curJob.name.equals(data.jobs.get(i).name))
      {
        if(i > 0)
        {
          curJob = data.jobs.get(i - 1);
        }
        else
        {
          curJob = data.jobs.get(data.jobs.size() - 1);
        }
        
        break;
      }
    }
    
    img = curJob.job_img;
    jobName = curJob.name;
  }
  
  public void doodle()
  {
    if(sel == true)
    {
      value += speed;
      
      //float fade = MAX - abs(value % (2 * MAX) - MAX);
      float fade = MIN + abs(value % (2 * MIN) - MIN);
      tint(255, fade);
      image(img, posX, posY);
      noTint();
    }
    else
    {
      value = 0;
      image(img, posX, posY);
    }
    
    textSize(40);
    smooth(); 
    textAlign(CENTER);
    fill(255, 255);
    
    textFont(ffont);
    text(jobName, jobNameX, jobNameY);
    text(charName, charNameX, charNameY);
  }
}

class StateCharacterSelect extends State
{
  //ArrayList<Character> chars;
  ArrayList<JobSelector> chars;
  
  PImage selector;
  PImage lind;
  PImage rind;
  
  int[] xvals = { 343, 782, 343, 782 };
  int[] yvals = { 155, 155, 526, 526 };
  
  Job[] jobArray = { data.jobs.get(rng.nextInt(data.jobs.size())), data.jobs.get(rng.nextInt(data.jobs.size())), data.jobs.get(rng.nextInt(data.jobs.size())), data.jobs.get(rng.nextInt(data.jobs.size())) };
  
  gameState type = gameState.PARTY_SELECT;
  
  // stuff for handling... actual selections?
  selMode mode = selMode.JOB;
  int charSel = 0;
  
  public StateCharacterSelect()
  {
    bg = loadImage("/images/char_select.png");
    selector = loadImage("/images/char_selector.png");
    lind = loadImage("/images/left_ind.png");
    rind = loadImage("/images/right_ind.png");
    
    chars = new ArrayList<JobSelector>();
    
    for(int i = 0; i < 4; i++)
    {
      JobSelector j = new JobSelector(data.jobs.get(rng.nextInt(data.jobs.size())), xvals[i], yvals[i]);
      
      chars.add(j);
    }
  }
  
  public void drawState()
  {
    background(0);
    
    imageMode(CORNER);
    image(bg, 0, 0);
    
    for(JobSelector j : chars)
    {
      j.doodle();
    }
    
    for(int i = 0; i < chars.size(); i++)
    {
      if(charSel == i)
      {
        chars.get(i).sel = true;
      }
    }
    
    //image(selector, selX, selY);
    
    if(mode == selMode.JOB)
    {
      for(int i = 0; i < chars.size(); i++)
      {
        if(chars.get(i).sel == true)
        {
          image(rind, chars.get(i).posX + 80 + 20, chars.get(i).posY + 45);
          image(lind, chars.get(i).posX - 24 - 20, chars.get(i).posY + 45);
          
          break;
        }
      }
    }
  }
  
  public gameState playerInput()
  {
    if(key == CODED) //<>//
    {
      if(mode == selMode.JOB)
      {
        if(keyCode == LEFT || keyCode == RIGHT)
        {
          JobSelector job = null;
      
          for(JobSelector j : chars)
          {
            if(j.sel == true)
            {
              job = j;
              break;
            }
          }
          
          if(job != null)
          {
            if(keyCode == RIGHT)
            {
              job.cycleJobRight();
            }
            
            if(keyCode == LEFT)
            {
              job.cycleJobLeft();
            }
          }
        }
        // end checking for job change
      }
      
      if(mode == selMode.NAME)
      {
        JobSelector job = null;
      
        for(JobSelector j : chars)
        {
          if(j.sel == true)
          {
            job = j;
            break;
          }
        }
        
        if(job != null)
        {
          job.charName = job.charName + key;
          
          if(keyCode == BACKSPACE)
          {
            job.charName = job.charName.substring(0, max(0, job.charName.length() - 1));            
          }
        }
      }
    }
    else
    {
      if(mode == selMode.JOB)
      {
        if(key == ENTER) // enter key
        {
          mode = selMode.NAME;
        }
      }
      else if(mode == selMode.NAME)
      {
        if(key == 9) // tab key!!!!
        {
          mode = selMode.JOB;
        }
        else
        {
          JobSelector job = null;
      
          for(JobSelector j : chars)
          {
            if(j.sel == true)
            {
              job = j;
              break;
            }
          }
          
          if(job != null)
          {
            if(key == BACKSPACE)
            {
              job.charName = job.charName.substring(0, max(0, job.charName.length() - 1));
            }
            else if(key != ENTER && job.charName.length() < 12)
            {
              job.charName = job.charName + key;
            }
            else if(key == ENTER)
            {
              /* okay, now we need to do one of two things:
                  (1) progress to next char in sequence, or
                  (2) exit the char selection screen */
                  
              if(charSel == chars.size() - 1)
              {
                // oh boy!
                // translate our job selector array list into actual characters, please, kthx
                ArrayList<Character> list = new ArrayList<Character>();
                
                for(JobSelector j : chars)
                {
                  Character c = new Character(j.charName, j.curJob);
                  list.add(c);
                }
                
                data.setCharacters(list);
                
                return gameState.COMBAT;
              }
              else
              {
                charSel++;
                
                for(int i = 0; i < chars.size(); i++)
                {
                  if(i == charSel)
                  {
                    chars.get(i).sel = true;
                  }
                  else
                  {
                    chars.get(i).sel = false;
                  }
                }
                
                mode = selMode.JOB;
              }
            }
          }
        }
      }
    }
    
    return this.type;
  }
}
