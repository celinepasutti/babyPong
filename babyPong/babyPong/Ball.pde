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
    xDir = -1; //hard code !!!will change.
    yDir = -1; //hard code !!!will change.
  } //end constructor
  
  void draw() {
    fill(ballCol);
    ellipse(x, y, dia, dia); //ball
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
  }//endBallBounce
}//end Ball

  
  
