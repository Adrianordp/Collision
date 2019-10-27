// Screen
int maxX = 1300;
int maxY = 700;

// Circle 1
int radius1 = 45;
float circle1X=radius1+400, circle1Y=radius1+1, velocity1 = 3, inc1X = velocity1, inc1Y = velocity1;

// Circle 2
int radius2 = 30;
float circle2X=radius2+1, circle2Y=radius2+1, velocity2 = 6, inc2X = velocity2, inc2Y = velocity2;

void setup()
{ 
  //Window size
  size(1300, 700);
}

void draw()
{
  //Backgound color
  background(#000000);

  stroke(#30c9f3);
  fill(#f3bf30);
  circle(circle2X, circle2Y, radius2*2);

  stroke(#f33030);
  fill(#30a8f3);
  circle(circle1X, circle1Y, radius1*2);

  checkHit();
  moveCircle();
  moveEllipse();
}
void checkHit()
{
  float distX = circle1X-circle2X, distY = circle1Y-circle2Y;
  if (sqrt(sq(distX)+sq(distY)) < 70)
  {
    float theta = atan(distY/distX);
    float vrX = inc1X - inc2X;
    float vrY = inc1Y - inc2Y;
    
    float dx = vrX*sq(cos(theta)) + vrY*sin(theta)*cos(theta);
    float dy = vrX*cos(theta)*sin(theta) + vrY*sq(sin(theta))

    inc1X = inc1X + dx;
    inc1Y = inc1Y + dy;
    inc2X = inc2X - dx;
    inc2Y = inc2Y - dy;

    //inc1X = inc1X + (inc1X-inc2X)*cos(theta)/2;
    //inc1Y = inc1Y + (inc1X-inc2X)*sin(theta)/2;
    
    //inc2X = inc2X + (inc2X-inc1X)*cos(theta)/2;
    //inc2Y = inc2Y + (inc2X-inc1X)*sin(theta)/2;
    //background(#111111);
  }
}

void moveCircle()
{ 
  if (circle1X>=maxX-radius1 || circle1X<=radius1)
  {
    inc1X = -inc1X;
  }

  if (circle1Y>=maxY-radius1 || circle1Y<=radius1)
  {
    inc1Y = -inc1Y;
  }

  circle1X = circle1X+inc1X;
  circle1Y = circle1Y+inc1Y;
}

void moveEllipse()
{ 
  if (circle2X>=maxX-radius2 || circle2X<=radius2)
  {
    inc2X = -inc2X;
  }

  if (circle2Y>=maxY-radius2 || circle2Y<=radius2)
  {
    inc2Y = -inc2Y;
  }

  circle2X = circle2X+inc2X;
  circle2Y = circle2Y+inc2Y;
}
