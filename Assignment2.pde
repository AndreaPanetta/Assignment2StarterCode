PImage backdrop, img1, img2;

ArrayList<Player> players = new ArrayList<Player>();
boolean[] keys = new boolean[526];

void setup()
{
  //img1=loadImage("splash.jpg");
  size(950, 533);
  //backdrop = loadImage("background.jpg");
  setUpPlayerControllers();
  //img2=loadImage("dead.jpg");
}

void draw()
{
  //background(backdrop);
  background(0);
  
  //BoxLines
  line(5,5,945,5); //Top Line
  line(5,5,5,525);//Left Line
  line(945,5,945,525);//Right Line
  line(5,525,945,525); //Bottom Line
  strokeWeight(5);
  
  //MazeLines and Obsticles 
  line(5,180,170,180); //line 1
  line(5,350,170,350);// line 2
  line(170,260,170,350); //line 3
  line(width/2,5,width/2,200); //line 4
  line(width/2,525,width/2,350); //line 5
  line(width/2,350,650,350); //line 6
  line(800,180,945,180); //line 7
  line(800,180,800,450); //line 8 
  line(600,450,800,450); //line 9
  line(400,50,width/2,50); //line 10
  line(150,525,150,420); //line 11
  line(700,5,700,70); //line 12
  line(400,200,550,200); //line 13
  line(250,5,250,100); //line 14
  
  fill(177,219,250);//square fill
  rect(90, 60, 55, 55); //square 1
  rect(220, 400, 200, 75); //square 2
  rect(620, 125, 100, 100); //square 3
  
  
  for(Player player:players)
  {
    player.update();
    player.display();
  }
}

void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}

boolean checkKey(char theKey)
{
  return keys[Character.toUpperCase(theKey)];
}

char buttonNameToKey(XML xml, String buttonName)
{
  String value =  xml.getChild(buttonName).getContent();
  if ("LEFT".equalsIgnoreCase(value))
  {
    return LEFT;
  }
  if ("RIGHT".equalsIgnoreCase(value))
  {
    return RIGHT;
  }
  if ("UP".equalsIgnoreCase(value))
  {
    return UP;
  }
  if ("DOWN".equalsIgnoreCase(value))
  {
    return DOWN;
  }
  //.. Others to follow
  return value.charAt(0);  
}

void setUpPlayerControllers()
{
  XML xml = loadXML("arcade.xml");
  XML[] children = xml.getChildren("player");
  int gap = width / (children.length + 1);
  
  for(int i = 0 ; i < children.length ; i ++)  
  {
    XML playerXML = children[i];
    Player p = new Player(
            i
            , color(random(0, 255), random(0, 255), random(0, 255))
            , playerXML);
    int x = (i + 1) * gap;
    p.pos.x = x;
    p.pos.y = 300;
   players.add(p);         
  }
}

/*void setUpEnemies()
{
  int gap = width / (children.length + 1);
  
  for(int i = 0 ; i < children.length ; i ++)  
  {
    Enemy e = new Enemy(i, color(random(0, 255), random(0, 255), random(0, 255));
    int x = (i + 1) * gap;
    p.pos.x = x;
    p.pos.y = 300;
   players.add(p);         
  }
}*/
