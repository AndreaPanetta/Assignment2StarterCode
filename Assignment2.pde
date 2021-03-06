import ddf.minim.*;

PImage backdrop, img1, img2,img3, prize;

ArrayList<Player> players = new ArrayList<Player>();
boolean[] keys = new boolean[526];
int menuchange =0;
float speed = 9.6;

float centX = 50;
float centY = 200;
int numEnemies = 10;
boolean image = true;
boolean image2 = false;

boolean devMode = false;
boolean sketchFullScreen()
{
  return ! devMode;
}

Enemy[] sliders = new Enemy[numEnemies];


//Audio Content
AudioPlayer song;
Minim minim;

void setup()
{
  img1=loadImage("splash.jpg");
  img3 = loadImage("instruct.jpg");
  //makeEnemies();
  minim = new Minim(this);
  song = minim.loadFile("sounds.mp3");
  song.play();

  setUpPlayerControllers();
  //img2=loadImage("dead.jpg");
  
  for (int i = 0; i < sliders.length; i++) 
  {
    sliders[i] = new Enemy(); // Create each object
  }
  
  if (devMode)
  {
    size(950, 533);
  }
  else
  {
    size(displayWidth, displayHeight);
  }
}

void draw()
{
  //background(backdrop);
  background(0);
  if( image == true)
  {
    image(img1,0,0,width,height);
    if(image2 == true)
    {
      image(img3,0,0,width,height);
    }
  }
  else
  {

  //Collision();
  
  //Enemy for loop
  for (int i = 0; i < sliders.length; i++) 
  {
    sliders[i].slide();
  }
  
  //BoxLines
  line(5,5,1362,5); //Top Line
  line(5,5,5,760);//Left Line
  line(1363,5,1363,758);//Right Line
  line(5,760,1362,760); //Bottom Line
  strokeWeight(5);
  
  //MazeLines and Obsticles 
  line(5,280,250,280); //line 1
  line(5,500,250,500);// line 2
  line(170,360,170,500); //line 3
  line(width/2,5,width/2,390); //line 4
  line(width/2,600,width/2,760); //line 5
  line(width/2,600,1000,600); //line 6
  line(1154,250,1362,250); //line 7
  line(1154,250,1154,650); //line 8 
  line(900,650,1154,650); //line 9
  line(400,50,width/2,50); //line 10
  line(250,760,250,570); //line 11
  line(950,5,950,150); //line 12
  line(500,390,800,390); //line 13
  line(300,5,300,150); //line 14
  
  //Square blockades
  fill(177,219,250);//square fill
  rect(110, 100, 75, 75); //square 1
  rect(360, 600, 200, 75); //square 2
  rect(900, 250, 100, 100); //square 3
  rect(375, 200, 100, 100); //square 4
  
  //Prizes
 fill(255,255,255);
 ellipse(660, 25, 20, 20); //Prize 1
 ellipse(1345, 268, 20, 20); //Prize 2
 ellipse(25, 740, 20, 20); //Prize 3
 ellipse(190, 480, 20, 20); //Prize 4
 ellipse(25, 25, 20, 20); //Prize 5
 ellipse(700, 370, 20, 20); //Prize 6
 ellipse(980, 25, 20, 20); //Prize 7
 ellipse(650, 740, 20, 20); //Prize 8 
  
  for(Player player:players)
  {
    player.update();
    player.display();
  }
  
  if(menuchange==0)
  {
    image(img1,0,0);
  }
  
  
}
}

void keyPressed()
{
  keys[keyCode] = true;
  
  if(key == 'p')
  {
    image = false;
    menuchange++;
  }
  if(key == '5')
  {
    image2 =! image2;
  }
  if(key == 'g')
  {
    exit();
  }
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

/*void hitWalls()
{
  if(
}*/
