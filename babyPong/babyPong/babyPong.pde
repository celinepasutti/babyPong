//Global Vars and objects
Ball myBall; //both halves of the constructor.
Ball yourBall;
color tableColor = 150; //ERROR - move to table CLASSSSS!!!!!!! NOWWWW!!!!!! >:(

void setup() {
  fullScreen();
  /*screenSizeChecker(); for landscape, portrait, square views.
  Updated automatically for screen rotation on android.
  */
  //population
  myBall = new Ball(); //both halves of the constructor.
  yourBall = new Ball();
}//endSetup


void draw() {
  background(tableColor); //day and night mode? ERROR: known in CLASS! NOT DRIVER!!!!!!11!!1
  myBall.draw();
  yourBall.draw();
  
  //println(myBall.xDir, myBall.yDir);
}//endDraw

void keyPressed() {
}//endKeyPressed

void mousePressed() {
}//endMousePressed

void ballCollisions() {
}//end ballCollisions
//endDRIVER
