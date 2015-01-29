class Enemy extends gameObject
{
  Enemy()
  {
    pos.x = random(width,2*width+60);
    pos.y = random(height);
  }

  void slide() 
  {
      pos.x -= 5;
      fill(0,10,200,180);
      rect(pos.x, pos.y, 20, 20);

     if(pos.x<0)
     {
       pos.x = width+30;
       pos.y = random(height);
     }
  }
}
