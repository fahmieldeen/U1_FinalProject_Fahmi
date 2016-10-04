import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
AudioPlayer player;
Minim minim;

PImage Left;
PImage Right;
PImage Middle;
int screen = 0;
int startTime = 0;
int s = second();
int number = 1;

void setup()
{
  fullScreen();
  background(0);
  minim = new Minim(this);
  player = minim.loadFile("DJ Snake - Middle (Audio) ft. Bipolar Sunshine.mp3");
  Left = loadImage("left cat.png");
  Right = loadImage("right cat.png");
  Middle = loadImage("middle cat.png");
}

void draw()
{
  rect(150, 300, 200, 400);
  fill(144);
  rect(225, 500, 50, 100);
  fill(200);
  if (screen == 0)
  {
    LightOff();
  }  
  if (screen == 1)
  {
    LightOn();
  }
}

void LightOn()
{
  background (255);
  image(Middle, 720, 450, 300, 300);
  player.pause();
    rect(150, 300, 200, 400);
  fill(144);
  rect(225, 500, 50, 100);
  fill(200);
    textSize(32);
  text("Lights: ON", 155, 290);
  fill(255, 0, 0);
}

void LightOff()
{
  background (0);
  image(Left, 720, 450, 300, 300);
  player.play(); 
  rect(150, 300, 200, 400);
  fill(144);
  rect(225, 500, 50, 100);
  fill(200); 
  textSize(32);
  text("Lights: OFF", 155, 290);
  fill(255, 0, 0);
  
  switch(number)
  {
   case 1:
   background (0);
  image(Left, 720, 450, 300, 300);
  player.play(); 
  rect(150, 300, 200, 400);
  fill(144);
  rect(225, 500, 50, 100);
  fill(200); 
  textSize(32);
  text("Lights: OFF", 155, 290);
  fill(255, 0, 0);
   number++;
   break;
   case 2:
   background (0);
  image(Right, 720, 450, 300, 300);
  player.play(); 
  rect(150, 300, 200, 400);
  fill(144);
  rect(225, 500, 50, 100);
  fill(200); 
  textSize(32);
  text("Lights: OFF", 155, 290);
  fill(255, 0, 0);
   number++;
   break;
   default:
   number = 1;

  } 
  delay(s*5);
}

void mousePressed()
{
  if (screen == 0 && mouseX>=220 && mouseX<=275 && mouseY>=500 && mouseY<=600)
  {
    screen = 1;
  }
  else
  if (screen == 1 && mouseX>=220 && mouseX<=275 && mouseY>=500 && mouseY<=600)
  {
    screen = 0;
  }
}

void stop() //stops playing music when player quits 
{
  player.close();
  minim.stop();
  super.stop();
}