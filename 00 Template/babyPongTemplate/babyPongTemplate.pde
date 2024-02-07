//Global Vars


void setup() {
  fullScreen();
  //an object is see the CLASS
  Ball myBall = new Ball(); // myBall = instance of Ball
  //Ball yourBall = new Ball();
  //ellipse(x, y, dia, dia); //ball
  /*screenSizeChecker(); for landscape, portrait, square views.
  Updated automatically for screen rotation on android.
  */
  println("Exciting ... not Exciting");
  exit(); //mimics garbage collection of all local vars.
}//endSetup
//garbage collection happens here.

void draw() {
  //emptyLoop - always needed, but not required to do anything.
}//endDraw

void keyPressed() {
}//endKeyPressed

void mousePressed() {
}//endMousePressed

//endDRIVER
