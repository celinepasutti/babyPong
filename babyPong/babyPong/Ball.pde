/*known ERRORS:
night mode - ball color is full blue*/
class Ball {
  //Ball Global Vars
  float x, y, dia;
  color ballCol;
  float xSpeed, ySpeed;
  float xDir, yDir;
  
  
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
    xSpeed = displayWidth/displayWidth;
    ySpeed = displayHeight/displayHeight;
    xDir = xDir();
    yDir = yDir();
  } //end constructor
  
  float xDir() {
    float xDir = int (random(-2, 2));
    while (xDir == 0) {
      xDir = int (random(-2, 2)); //variable must be populated FIRST!
    }
    return xDir;
  }//end xDir
  
  float yDir() {
    float yDir = int (random(-2, 2));
    while (yDir == 0) {
      yDir = int (random(-2, 2));
    }
    return yDir;
  }// end yDir
  
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
      xSpeed *=  xDir;
    }
    if(y < 0+(dia/2) || y > displayHeight-(dia/2)) {
      ySpeed *= yDir;
    }
  }//end ballBounce
}//end Ball

  
  
