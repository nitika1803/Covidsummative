PImage startscreen;
PImage human; 
PImage Infected;
PImage Virus;
int stage;
boolean state=true;
float x = 400;
float y = 550;
virus Covid = new virus();
infected firstInfected = new infected ();
infected secondInfected = new infected (random(0,800), 0, random(2,8), random(50,200), color(129,111,111));
infected thirdInfected = new infected (color(147,117,117));
HUD hud = new HUD ();
import ddf.minim.*;
Minim minim;
AudioPlayer player;
//AudioPlayer punch;

void setup()
{
  
 stage = 1;
  size(800,800);
 human = loadImage ("human.png");
 startscreen = loadImage ("startscreen.png");
 Infected = loadImage("infected.png");
 Virus =  loadImage("virus.png");
 minim = new Minim(this);
 player = minim.loadFile("wiisound.mp3");
 //punch = minim.loadFile("punch.mp3");

}

void draw()
{ 
  
if (stage ==1)
  {
stage=stage1();
  }

 if (stage ==2)
  {
stage=stage2();
  }

if(stage==3)
  {
    stage3();
    if (keyPressed == true)
   { if(key == 'r' || key == 'R' ){
     hud.health = 5;
     hud.points=0;
      stage1();   }
      if(key=='e' || key == 'E')
      {  exit(); 
      }
    }
  }
    }
        


void keyPressed()
{
 if (keyCode == LEFT)
 {
   x = x-20;
 }
 if (keyCode == RIGHT)
 {
   x = x+20;
 }
}

void checkCollision(float value,infected a)
{ if (value < 40 + 40) 
      {
          hud.health = hud.health - 1;
          a.y = 0;
          a.x = random (0,800);
          fill(255, 0, 0, 100);
          rect(0, 0, 800, 800);
      }
}


int stage1()
{ background (startscreen);
    textSize(40);
    text("SOCIAL DISTANCE", 250, 350);
    textSize(15);
    text("Use your arrow keys to move the player and avoid the infected people", 180, 440);
    text("... or else you lose!", 350, 460);
    textSize(20);
    text("PRESS ANY KEY TO BEGIN", 300, 550);
   player.play();
    if (keyPressed == true)
    {
     stage = 2;
    } 
    return stage;
}
int stage2()
{
  background (0);
 Covid.Update();
 firstInfected.Update();
 secondInfected.Update();
 thirdInfected.Update();
 hud.Draw();
 
image (human, x, y, 150, 170);
  
  float d= dist(x, y, firstInfected.x , firstInfected.y);
  checkCollision(d,firstInfected);
     
   float e= dist(x, y, secondInfected.x , secondInfected.y);
   checkCollision(e,secondInfected);
     
   float f= dist(x, y, thirdInfected.x , thirdInfected.y);
    checkCollision(f,thirdInfected);
     
      
  if (hud.health == 0)
      {
       stage = 3;
     }
         return stage;
 }
 void stage3()
 {
       background(startscreen);
       textSize(40);
       fill (255,255,255);
       text("YOU GOT INFECTED", 230, 350);
    textSize(20);
    text("YOUR SCORE: "+ hud.points,350,400);
    text("PRESS 'R' TO RESTART THE GAME", 250, 450);
    text("OR 'E' TO EXIT THE GAME", 280, 500);
       
 }
