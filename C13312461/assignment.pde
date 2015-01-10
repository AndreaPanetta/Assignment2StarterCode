PImage backdrop;

void setup()
{
  size(950, 533);
  backdrop = loadImage("background.jpg");
  smooth();
  noStroke();
}

void draw()
{
  background(backdrop);
}
