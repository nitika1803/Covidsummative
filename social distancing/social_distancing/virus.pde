class virus
{
  float size;
  color c;
  float ySpeed;
  float[] virusX = new float [60];
  float[] virusY = new float [60];

  virus ()
  {
    size = 20;
    c = color(255, 255, 191);
    ySpeed += 0.1;
    for (int i=0; i<60; i++)
    {
      virusX[i] = (float) random (0, 800);
      virusY[i] = (float) random (0, 800);
    }
  }

  void Draw ()
  {
   //stroke (c);
    //fill (c);
    for (int i=0; i<60; i++)
    {
   // ellipse (starsX[i], starsY[i], size, size);
   image(Virus,virusX[i], virusY[i], size, size);
    }
  }

  void Move()
  {
    for (int i=0; i<60; i++)
    {
    virusY[i] += ySpeed;
    if (y > 800)
    {
      virusY[i] = 0;
      virusX[i] = random (0, 800);
    }
    }
  }
  
  void Update ()
  {
    Draw();
    Move();
  }
}
