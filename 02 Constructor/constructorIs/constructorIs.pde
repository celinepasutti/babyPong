//Global Vars


void setup() {
  fullScreen();
  //an object is see the CLASS
  Ball myBall = new Ball(); // half of the constructor
  int startBallX = displayWidth*1/2;
  int startBallY = displayHeight*1/2;
  int referentMeasures = (displayWidth < displayHeight) ? displayWidth: displayHeight; //review ternary operator
  myBall.ballX = startBallX; //spawn myBall in the middle of the display
  myBall.ballY = startBallY;
  myBall.ballDia = 
  
  //ellipse(x, y, dia, dia); //ball
  //Ball yourBall = new Ball();
  //yourBall.ballX = 
  /*screenSizeChecker(); for landscape, portrait, square views.
  Updated automatically for screen rotation on android.
  */
}//endSetup


void draw() {
  //emptyLoop - always needed, but not required to do anything.
}//endDraw

void keyPressed() {
}//endKeyPressed

void mousePressed() {
}//endMousePressed

//endDRIVER
