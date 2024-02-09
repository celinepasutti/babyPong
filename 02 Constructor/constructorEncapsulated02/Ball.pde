class Ball {
  //Ball Global Vars
  float ballX, ballY, ballDia;
  color ballCol;
  
  //constructor
  Ball () {
    //local vars
    int startBallX = displayWidth*1/2;
    int startBallY = displayHeight*1/2;
    int referentMeasure = (displayWidth < displayHeight) ? displayWidth: displayHeight; //review ternary operator
    
    //object vars
    ballX = startBallX;
    ballY = startBallY;
    ballDia = referentMeasure*1/20;
    ballCol = color (random(0, 255), random(0, 255), random(0, 255)) ; //random(255) also applicable. Casting from float to int.
  } //end constructor
  
  void draw() {
    fill(ballCol);
    ellipse(ballX, ballY, ballDia, ballDia); //ball
    fill(0);
  }//endBallDraw
}//end Ball

  
  
