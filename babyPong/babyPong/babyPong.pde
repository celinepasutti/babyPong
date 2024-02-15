//Global Vars and objects
Ball myBall; //both halves of the constructor.
Ball[] fireworks = new Ball[25];
Ball movedBall;

color tableColor = 150; //ERROR - move to table CLASSSSS!!!!!!! NOWWWW!!!!!! >:(

void setup() {
  fullScreen();
  /*screenSizeChecker(); for landscape, portrait, square views.
  Updated automatically for screen rotation on android.
  */
  //population
  myBall = new Ball(); //both halves of the constructor.
    for (int i = 0; i < fireworks.length; i++) {
    fireworks[i] = new Ball(displayWidth * -1, displayHeight * -1, 0.5);
  }
  movedBall = new Ball(displayWidth * -1, displayHeight * -1);
}//endSetup


void draw() {
  background(tableColor); //day and night mode? ERROR - known in CLASS! NOT DRIVER!!!!!!11!!1
  
  //println(myBall.xDir, myBall.yDir);
  myBall.draw();
  for (int i = 0; i < fireworks.length; i++) {
    fireworks[i].draw();
    movedBall.draw();
  }
}//endDraw

void keyPressed() {
}//endKeyPressed

void mousePressed() {
  for (int i = 0; i < fireworks.length; i++) {
    fireworks[i] = new Ball(mouseX, mouseY, 0.5);
  }
  movedBall = new Ball(mouseX, mouseY, myBall.dia, myBall.ballCol);
}//endMousePressed

void ballCollisions() {
  /*change this code to instances
  if (x < 0+(dia/2) || x > displayWidth-(dia/2)) {
      xSpeed *=  -1;
    }
    if(y < 0+(dia/2) || y > displayHeight-(dia/2)) {
      ySpeed *= -1;*/
}//end ballCollisions
//endDRIVER
