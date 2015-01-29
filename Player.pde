class Player extends gameObject
{
  //float playerX=50;
  //f//loat playerY=50;
  char up;
  char down;
  char left;
  char right;
  char start;
  char button1;
  char button2;
  int index;
  color colour;
  float starts,stop;
  float rotation =0;

    
  Player()
  {
    pos = new PVector(width / 2, height / 2);
  }
  
  Player(int index, color colour, char up, char down, char left, char right, char start, char button1, char button2)
  {
    this();
    this.index = index;
    this.colour = colour;
    this.up = up;
    this.down = down;
    this.left = left;
    this.right = right;
    this.start = start;
    this.button1 = button1;
    this.button2 = button2;
  }
  
  Player(int index, color colour, XML xml)
  {
    this(index
        , colour
        , buttonNameToKey(xml, "up")
        , buttonNameToKey(xml, "down")
        , buttonNameToKey(xml, "left")
        , buttonNameToKey(xml, "right")
        , buttonNameToKey(xml, "start")
        , buttonNameToKey(xml, "button1")
        , buttonNameToKey(xml, "button2")
        );
  }
  
  void update()
  {
    /*float velocity1 = speed;
    //starts =rotation;
    //stop = (PI*2) - rotation; 
  
    color underPlayer2 = backdrop.get((int)pos.x+15, (int)pos.y-12);
      
    if(red(underPlayer1) >= 250.0 && green(underPlayer1) >= 250.0 && blue(underPlayer1) >= 250.0 || red(underPlayer2) >= 250.0 && green(underPlayer2) >= 250.0 && blue(underPlayer2) >= 250.0)
    {
      fill(0);
      stroke(0);
    }*/
    
    if (checkKey(up))
    {
      pos.y -= 1;
    }
    if (checkKey(down))
    {
      pos.y += 1;
    }
    if (checkKey(left))
    {
      pos.x -= 1;
    }    
    if (checkKey(right))
    {
      pos.x += 1;
    }
    if (checkKey(start))
    {
      println("Player " + index + " start");
    }
    if (checkKey(button1))
    {
      println("Player " + index + " button 1");
    }
    if (checkKey(button2))
    {
      println("Player " + index + " butt2");
    }    
  }
  
  void display()
  {    
    stroke(255,255,255);
    fill(colour);    
    rect(pos.x, pos.y, 20, 20);
  }  
}
