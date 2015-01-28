class Enemy
{ 
  
  PVector pos;
  PVector go;
    
    Enemy()
    {
      pos.x = (int)random(width, 2*width+1000);
      pos.y = height - 10;
      
      go.x = -3.5;
      go.y = 0;
    }
  
  void slide()
  {
    
    pos.add(go);
     fill(0,10,200,180);
     rect(pos.x, pos.y, 20, 20);

     if(pos.x<0)
     {
       pos.x = width+30;
       pos.y = height - 10;
     }
     
     
  }
} 
