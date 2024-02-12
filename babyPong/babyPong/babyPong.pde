//Global Vars and objects
Ball myBall; //both halves of the constructor.
color tableColor = 150; //ERROR - move to table CLASSSSS!!!!!!! NOWWWW!!!!!! >:(

void setup() {
  fullScreen();
  /*screenSizeChecker(); for landscape, portrait, square views.
  Updated automatically for screen rotation on android.
  */
  //population
  myBall = new Ball(); //both halves of the constructor.
}//endSetup


void draw() {
  background(tableColor); //day and night mode? ERROR: known in CLASS! NOT DRIVER!!!!!!11!!1
  myBall.draw();
}//endDraw

void keyPressed() {
}//endKeyPressed

void mousePressed() {
}//endMousePressed

//endDRIVER
