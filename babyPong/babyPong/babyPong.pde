//Global Vars and objects

//KNOWN BUG = BALL WILL PHASE THROUGH EXIT BUTTON.

Ball myBall; //both halves of the constructor.
Ball[] fireworks = new Ball[25];
Ball movedBall;

color black=#000000, white=#FFFFFF, red=#951111, Lgreen=#27C149, gray=#CBCBCB;

Button exit;

color tableColor = 150; //ERROR - move to table CLASSSSS!!!!!!! NOWWWW!!!!!! >:(

void setup() {
  fullScreen();  
  //font = createFont("Roboto", 55);
  /*screenSizeChecker(); for landscape, portrait, square views.
  Updated automatically for screen rotation on android.
  */
  //population
  myBall = new Ball(); //both halves of the constructor.
    for (int i = 0; i < fireworks.length; i++) {
    fireworks[i] = new Ball(displayWidth * -1, displayHeight * -1, 0.5);
  }
  movedBall = new Ball(displayWidth * -1, displayHeight * -1, myBall.dia, myBall.ballCol, myBall.xSpeed, myBall.ySpeed, myBall.xSpeedChange, myBall.ySpeedChange);
  //exit = new Button(red, referentMeasure*1.72, referentMeasure*0, referentMeasure*1.2/20, referentMeasure*1/20);
}//endSetup


void draw() {
  background(tableColor); //day and night mode? ERROR - known in CLASS! NOT DRIVER!!!!!!11!!1
  if (myBall.disappear == true) {
    //empty IF
  } else {
    myBall.draw();
  }
  
  //ERROR - ball instance still bounces.
  
  if(myBall.x < (myBall.dia * 2) || myBall.x > ( displayWidth - (myBall.dia * 2)) || movedBall.x < (movedBall.dia * 2) || movedBall.x > ( displayWidth - (movedBall.dia * 2))) { //goal - firework execution is based on x value. triggers are left goal and right goal.
    if(myBall.disappear == false) {
      myBall.netExplosion(myBall.x, myBall.y);
    } else /*if(myBall.disappear == true)*/ {
      movedBall.netExplosion(movedBall.x, movedBall.y);
    }
  }
  
  for (int i = 0; i < fireworks.length; i++) {
    fireworks[i].draw();
  }
  movedBall.draw();
  //exit.draw();
}//endDraw

void keyPressed() {
}//endKeyPressed

void mousePressed() {
  movedBall = new Ball(mouseX, mouseY, myBall.dia, myBall.ballCol, myBall.xSpeed, myBall.ySpeed, myBall.xSpeedChange, myBall.ySpeedChange);
  myBall.disappear = true;
  
  /*if (mouseX>=exit.x && mouseX<=exit.x+exit.w && mouseY>=exit.y && mouseY<=exit.y+exit.h) {
    exit();
  }*/
}//endMousePressed

//endDRIVER
