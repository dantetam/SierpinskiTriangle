int iter = 5;

public void setup()
{
  size(1000,1000);
  frameRate(20);
}

boolean pause = false; int frames = 0; //Manual recording of frame number
public void draw()
{
  if (pause) return;
  frames++;
  background(255);
  int len = 750 + (int)(500*sin(frames/15.0));
  fill(0);
  //noCursor();
  translate(mouseX, mouseY);
  rotate(atan2(mouseY - height/2, mouseX - width/2) - PI/4);
  translate(-mouseX, -mouseY);
  //translate(width/2, height/2);
  triangle(mouseX, mouseY - len*0.75, mouseX - len/2, mouseY + len*0.25, mouseX + len/2, mouseY + len*0.25);
  sierpinski(mouseX, mouseY, len/2, iter + int(sin(frames/15.0)*3));
  //noLoop();
}

public void mousePressed()
{
  /*
  if (mouseButton == LEFT)
    iter++;
  else
    iter--;
  */
  pause = !pause;
}

public void sierpinski(float x, float y, float len, int iter) 
{
  if (iter > 0)
  {
    makeTriangle(x, y, len, 255);
    sierpinski(x - len/2,y + len/4,len/2,iter-1);
    sierpinski(x + len/2,y + len/4,len/2,iter-1);
    sierpinski(x,y - len*3/4,len/2,iter-1);
  }
  else
    return;
}

//Always draws a triangle pointing down at x,y
public void makeTriangle(float x, float y, float len, float gray)
{
  fill(gray);
  triangle(x - len/2, y - len/2, x + len/2, y - len/2, x, y + len/2);
}
