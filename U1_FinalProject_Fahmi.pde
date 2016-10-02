int numFrames = 3;
int screen = 0;
int value = 0;

PImage [] image = new PImage[numFrames];

void setup()
{
  fullScreen();
  background(value); 
  for (int i=0; i<numFrames; i++)
  {
    image[0] = loadImage("left cat.png");
    image[1] = loadImage("middle cat.png");
    image[2] = loadImage("right cat.png");
  }
}

void draw()
{
  rect(150, 300, 200, 400);
  fill(144);
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
  value = 255;
}

void LightOff()
{
  value = 0;
}

void mousePressed()
{
  if (screen == 0)
  {
    screen = 1;
  }
  if (screen == 1)
  {
    screen = 0;
  }
}