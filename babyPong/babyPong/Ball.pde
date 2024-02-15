/*known ERRORS:
night mode - ball color is full blue*/
class Ball {
  //Ball Global Vars
  float x, y, dia;
  color ballCol;
  float xSpeed, ySpeed;
  float xSpeedChange = 1.0, ySpeedChange = 1.0;
  float gravity = 0.0;
  //static int count = 25
  
  
  //ball constructor
  Ball () {
    //local vars
    int startx = displayWidth*1/2;
    int starty = displayHeight*1/2;
    int referentMeasure = (displayWidth < displayHeight) ? displayWidth: displayHeight; //review ternary operator
    
    //object vars
    this.x = startx;
    this.y = starty;
    this.dia = referentMeasure*1/20;
    this.ballCol = color (random(0, 255), random(0, 255), random(0, 255)); //random(255) also applicable. Casting from float to int.
    this.xSpeed = 3*xSpeedChange();
    this.ySpeed = 3*ySpeedChange();
    this.xSpeedChange = 1.0; //break bounce physics - change speed
    this.ySpeedChange = 1.0;
  } //end ball constructor
  
  //firework constructor - multiple constructors by identifying different parameters.
  Ball(float xParameter, float yParameter, float gravityParameter) {
    //Ball(); //placeholder
    this.x = xParameter; //ERROR: trigger when the Ball enters goal area
    this.y = yParameter; //ERROR: trigger when the Ball enters goal area
    this.ballCol = color (random(0, 255), random(255), random(255)) ; //random(), random()-shortcut, casting from float to intin color var
    this.dia = random(width*1/50); //returns unseen diamters
    this.xSpeed = random(-5, 5); //Can return 0
    this.ySpeed = random(-5, 5); //Can return 0
    gravity = gravityParameter;
  }//end firework constructor 
  
  //movedBall constructor -- must look like old ball instance ( same color, same size ) and make old ball instance disappear.
  Ball(float xParameter, float yParameter, float diaParameter, float colParameter, ) {
    this.x = xParameter;
    this.y = yParameter;
    this.dia = diaParameter;
    this.ballCol = colParameter;
    
    //old ball instance = new ball instance.
    this.xSpeed = 3*xSpeedChange();
    this.ySpeed = 3*ySpeedChange();
    this.xSpeedChange = 1.0; //break bounce physics - change speed
    this.ySpeedChange = 1.0;
  }//end movedBall constructor
  
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
    
    step(); //manipulating the variables.
  }//endBallDraw
  
  void step() {
    bounce();
    ySpeed += gravity; //Ball() is not affected - thus, the pong ball has no gravity.
    x += xSpeed * xSpeedChange;
    y += ySpeed * ySpeedChange;
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

  
  
