int iter = 5;

public void setup()
{
  size(1000,1000);
}

public void draw()
{
  background(255);
  float len = 600;
  fill(0);
  //noCursor();
  translate(mouseX, mouseY);
  rotate(atan2(mouseY - height/2, mouseX - width/2) - PI/4);
  translate(-mouseX, -mouseY);
  //translate(width/2, height/2);
  triangle(mouseX, mouseY - len*0.75, mouseX - len/2, mouseY + len*0.25, mouseX + len/2, mouseY + len*0.25);
  sierpinski(mouseX, mouseY, len/2, iter);
}

public void mousePressed()
{
  if (mouseButton == LEFT)
    iter++;   
  else
    iter--;
  if (iter < 0) iter = 0;
  else if (iter > 10) iter = 10;
}

public void sierpinski(float x, float y, float len, float iter) 
{
  if (iter > 0)
  {
    triangle(x, y, len, 255);
    sierpinski(x - len/2,y + len/4,len/2,iter-1);
    sierpinski(x + len/2,y + len/4,len/2,iter-1);
    sierpinski(x,y - len*3/4,len/2,iter-1);
  }
  else
    return;
}

//Always draws a triangle pointing down at x,y
public void triangle(float x, float y, float len, float gray)
{
  fill(gray);
  triangle(x - len/2, y - len/2, x + len/2, y - len/2, x, y + len/2);
}
