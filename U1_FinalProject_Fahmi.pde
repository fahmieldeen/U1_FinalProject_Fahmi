/*
This is an interactive art/game called - CODID (Cats Only Dance In the Dark)
- created by Fahmi Eldeen 
It holds a fairly simple idea. The cat is seen dancing when the light is off with the 
music playing, but once you turn the lights on, the music stops and the cat looks 
surprised (and really funny). 
I think a way I could improve my game is by making the cat dance to the beat of the music
rather than dancing at a random pace. 
*/

//minim file, for music/sound
import ddf.minim.*; 
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
AudioPlayer player;
Minim minim;

//Stating that all these are images
PImage Left;
PImage Right;
PImage Middle;

// for the different screens (on and off)
int screen = 0;

// for the pace of the kitty cat dancing (how fast the images switch)
int s = second();
int number = 1;

void setup()
{
  fullScreen();
  background(0);
  minim = new Minim(this);
  // setting up all needed images and sounds for the art/game
  player = minim.loadFile("DJ Snake - Middle (Audio) ft. Bipolar Sunshine.mp3");
  Left = loadImage("left cat.png");
  Right = loadImage("right cat.png");
  Middle = loadImage("middle cat.png");
}

void draw()
{
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
  
  switch(number) // switches between every 1 case 
  {
   case 1: // first case ( left cat ) 
   
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
   
   case 2: // second case (right cat) 
   
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
   
   default: // default allows to repeat back to case 1 
   number = 1;

  } 
  delay(s*20); // delays the speed of images changing 
}

void mousePressed()
{
  // For the light switch, if the screen is 0, then it will switch to 1 and vice versa 
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