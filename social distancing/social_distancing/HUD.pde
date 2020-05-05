class HUD
{
 int points;
 int health;
float xP;
float yP;
float xH;
float yH;
  


HUD()
{
  points = 0;
  health = 5;
  xP = 100;
  yP = 100;
  xH= 650;
  yH = 100;
}

void Draw()
{
  
  fill (255,255,255);
  textSize (20);
  text("Points:" + points, xP, yP);
  text("Health:" + health, xH, yH);
  
}


}
