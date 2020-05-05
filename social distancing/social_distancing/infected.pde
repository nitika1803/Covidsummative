class infected
{
float size;
color c;
float x;
float y;
float ySpeed;

 
infected()
{
  x = random (0, 800);
  y= 0;
  size = random(50, 150);
  c = color(162,139,139);

  ySpeed = random (5,10);
}

infected(float X, float Y, float YSpeed, float Size, color C)
{
  x = X;
  y = Y;
  size = Size; 
  ySpeed = YSpeed;
  c = C;

}

infected(color _C)
{
  y= 0;
  size = random(50,200); 
  ySpeed = random(5,8);
  c = _C;

}

void Draw()
{
  //fill (c);
  //stroke (c);
    
 image(Infected,x, y, size, size);
  //ellipse (x, y, size, size);
  
}


void Move()
{
 
  y += ySpeed;
  if (y > 800)
  {
    y = 0;
    x = random (0,800);
    size = random (50,200);
    ySpeed = random (4,8);
     hud.points = hud.points + 1;
  }
 
 
}

   

void Update()
{
  Draw ();
  Move();   
  
}
}
