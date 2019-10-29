// Screen
int maxX = 700;
int maxY = 700;

// Circle 1
int radius1 = 95;
float circle1X=radius1+300, circle1Y=radius1+50, inc1X = 0, inc1Y = +1;

// Circle 2
int radius2 = 95;
float circle2X=radius2+330, circle2Y=radius2+400, inc2X = 0, inc2Y = -1;

void setup()
{ 
  //Window size
  size(680, 700);
  frameRate(10000);
  surface.setLocation(690, 0);
}

void draw()
{
  //Backgound color
  background(#000000);

  stroke(#ff0000);
  fill(#ffffff);
  circle(circle1X, circle1Y, radius1*2);

  stroke(#30c9f3);
  fill(#0000FF);
  circle(circle2X, circle2Y, radius2*2);

  checkHit();
  moveCircle();
  moveEllipse();
}
void checkHit()
{
  float distX = circle2X-circle1X, distY = -(circle2Y-circle1Y);
  float dist = sqrt(sq(distX)+sq(distY)); 
  if ( dist <= radius1+radius2)
  {
    float theta = abs(atan(distY/distX));
    //if (distX < 0)
    //{
    //  theta = theta + PI;
    //}
    float buff1 = inc1X;
    float buff2 = inc1Y; //<>//
    //inc1X = -inc2Y*sin(theta);
    //inc1Y =  inc2Y*cos(theta);
    //inc2X = -buff2*sin(theta);
    //inc2Y =  buff2*cos(theta);
    //inc1X =  inc2X*cos(theta);
    //inc1Y = -inc2X*sin(theta);
    //inc2X =  buff1*cos(theta);
    //inc2Y = -buff1*sin(theta);
    //inc1X =  inc2X*cos(theta)+inc2Y*sin(theta);
    //inc1Y = -inc2X*sin(theta)-inc2Y*cos(theta);
    //inc2X =  buff1*cos(theta)+buff2*sin(theta);
    //inc2Y = -buff1*sin(theta)-buff2*cos(theta);
    inc1X =  inc2X*sin(theta)+inc2Y*cos(theta);
    inc1Y =  -inc2X*cos(theta)+inc2Y*sin(theta);
    inc2X =  buff1*sin(theta)+buff2*cos(theta);
    inc2Y =  -buff1*cos(theta)+buff2*sin(theta);
    
    //inc1X = inc1X + dx;
    //inc1Y = inc1Y + dy;
    //inc2X = inc2X - dx;
    //inc2Y = inc2Y - dy;

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
