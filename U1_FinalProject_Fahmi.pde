import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

PImage Left;
PImage Right;
PImage Middle;
int numFrames = 3;
int screen = 0;
int value = 0;

float image[];

void setup()
{
  fullScreen();
  background(value);
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
  if (screen == 0);
  {
    LightOff();
  }
  
  if (screen == 1);
  {
    LightOn();
  }
}

void LightOn()
{
  image(Middle, 720, 450, 300, 300);
  value = 255;
}

void LightOff()
{
  image(Left, 720, 450, 300, 300);
  value = 0;
}

void mouseReleased()
{
  if (screen == 0 && mouseX>255 && mouseX<275 && mouseY>500 && mouseY<600)
  {
    screen = 1;
  }
  if (screen == 1 && mouseX>255 && mouseX<275 && mouseY>500 && mouseY<600)
  {
    screen = 0;
  }
}