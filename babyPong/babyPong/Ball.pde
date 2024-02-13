/*known ERRORS:
night mode - ball color is full blue*/
class Ball {
  //Ball Global Vars
  float x, y, dia;
  color ballCol;
  float xSpeed, ySpeed;
  float xSpeedChange, ySpeedChange;
  
  
  //constructor
  Ball () {
    //local vars
    int startx = displayWidth*1/2;
    int starty = displayHeight*1/2;
    int referentMeasure = (displayWidth < displayHeight) ? displayWidth: displayHeight; //review ternary operator
    
    //object vars
    x = startx;
    y = starty;
    dia = referentMeasure*1/20;
    ballCol = color (random(0, 255), random(0, 255), random(0, 255)); //random(255) also applicable. Casting from float to int.
    xSpeed = 3*xSpeedChange();
    ySpeed = 3*ySpeedChange();
    xSpeedChange = 1;
    ySpeedChange = 1;
  } //end constructor
  
  float xSpeedChange() {
    float xSpeedChange = int (random(-2, 2));
    while (xSpeedChange == 0) {
      xSpeedChange = int (random(-2, 2)); //variable must be populated FIRST!
    }
    return xSpeedChange;
  }//end xSpeedChange
  
  float ySpeedChange() {
    float ySpeedChange = int (random(-2, 2)); //THIS IS THE CODE FOR CHANGING THE SPEED!!!!!!!!!!!11111!!!!!!1!11!!
    while (ySpeedChange == 0) {
      ySpeedChange = int (random(-2, 2));
    }
    return ySpeedChange;
  }// end ySpeedChange
  
  void draw() {
    fill(ballCol);
    ellipse(x, y, dia, dia); //easter egg at bounce - diameter will change to create the effect of a "squish".
    fill(0);
    
    
    step();
  }//endBallDraw
  
  void step() {
    bounce();
    x += xSpeed;
    y += ySpeed;
  }//endBallStep
  
  void bounce() {
    if (x < 0+(dia/2) || x > displayWidth-(dia/2)) {
      xSpeed *=  -1;
    }
    if(y < 0+(dia/2) || y > displayHeight-(dia/2)) {
      ySpeed *= -1;
    }
  }//end ballBounce
}//end Ball

  
  
