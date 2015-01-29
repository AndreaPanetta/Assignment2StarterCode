// If Player hits either the edges,boxes or other player, collision is detected and the player dies   
void Collision()
{
  for(int i = 0; i < sliders.length; i++)
  {
    if((sliders[i].pos.x < 50 + 40))
    {
      if(sliders[i].pos.y < (players.get(i).pos.y + 40) && sliders[i].pos.y > players.get(i).pos.y || sliders[i].pos.y + 20 < (players.get(i).pos.y + 40) && sliders[i].pos.y + 20 > players.get(i).pos.y )
      {
        println(i);
        sliders[i].pos.x = width;
        println("Hit");
        fill(0);
        stroke(0); //Player disappears if in contact with enemy
        }
      }
    }
  }




