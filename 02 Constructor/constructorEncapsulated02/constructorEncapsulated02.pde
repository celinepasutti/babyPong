//Global Vars and objects
Ball myBall; //both halves of the constructor.
  //Ball yourBall = new Ball(); 


void setup() {
  fullScreen();
  /*screenSizeChecker(); for landscape, portrait, square views.
  Updated automatically for screen rotation on android.
  */
  //population
  myBall = new Ball(); //both halves of the constructor.
}//endSetup


void draw() {
  myBall.draw();
}//endDraw

void keyPressed() {
}//endKeyPressed

void mousePressed() {
}//endMousePressed

//endDRIVER
