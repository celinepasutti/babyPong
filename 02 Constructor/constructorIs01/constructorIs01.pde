//Global Vars


void setup() {
  fullScreen();
  //an object is see the CLASS
  Ball myBall = new Ball(); // half of the constructor
  int startBallX = displayWidth*1/2;
  int startBallY = displayHeight*1/2;
  int referentMeasure = (displayWidth < displayHeight) ? displayWidth: displayHeight; //review ternary operator
  //Population of obj vars = other half of constructor.
  
  myBall.ballX = startBallX; //spawn myBall in the middle of the display
  myBall.ballY = startBallY;
  myBall.ballDia = referentMeasure*1/20;
  myBall.ballCol = color (random(0, 255), random(0, 255), random(0, 255)) ; //random(255) also applicable. Casting from float to int.
  //code that uses object's vars. ^^
  
  fill(myBall.ballCol); //MUST reset the default.
  ellipse(myBall.ballX, myBall.ballY, myBall.ballDia, myBall.ballDia); //ball
  fill(0); //grayscale: 0 - 255 in shades of gray. RESET TO GRAYSCALE.s
  
 
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
