//Global Vars and objects

Ball myBall, movedBall;
Ball[] fireworks = new Ball[30];
Confetti[] confettis = new Confetti[500];
Paddle lPaddle, rPaddle;

color black=#000000, white=#FFFFFF, red=#951111, Lgreen=#27C149, gray=#CBCBCB;

//Button exit;

color tableColor = 150; //ERROR - move to table CLASSSSS!!!!!!! NOWWWW!!!!!! >:(

void setup() {
  noStroke();
  fullScreen();
  createConfetti();
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
  //exit = new Button(red, displayWidth*19/20, displayHeight*0, displayWidth*1/20, displayHeight*1/25);

  rPaddle = new Paddle(0, myBall.dia);
  lPaddle = new Paddle(displayWidth, myBall.dia);
}//endSetup

void draw() {
  background(tableColor);
  partyMode();
  
  for (int i = 0; i < fireworks.length; i++) {
    fireworks[i].draw();
  }
  
  lPaddle.draw();
  rPaddle.draw();

  if (myBall.disappear == true) {
    //empty IF
  } else {
    myBall.draw();
  }

  if (myBall.x < myBall.dia || myBall.x > ( displayWidth - myBall.dia) && myBall.disappear == false ) { //goal - firework execution is based on x value. triggers are left goal and right goal.
    myBall.netExplosion(myBall.x, myBall.y, 0.5);
  } else if (myBall.disappear == true && movedBall.x < movedBall.dia || movedBall.x > ( displayWidth - movedBall.dia)) {
    movedBall.netExplosion(movedBall.x, movedBall.y, 0.5);
  }
  movedBall.draw();
  //exit.draw();
}

void keyPressed() {
  if (key == 'p' || key == 'P') {
    if (partyMode == false) {
      partyMode = true;
      println(partyMode);
    } else {
      partyMode = false;
      tableColor = 150;
    }
  }
  
  if (key == 'w' || key == 'W') {
    rPaddle.down = false;
    rPaddle.up = true;
  }
  if ( key == 's' || key == 'S') {
    rPaddle.up = false;
    rPaddle.down = true;
  }
  if (key == CODED && keyCode == UP) {
    lPaddle.down = false;
    lPaddle.up = true;
  }
  if (key == CODED && keyCode == DOWN) {
    lPaddle.up = false;
    lPaddle.down = true;
  }
}

void mousePressed() {
  if (myBall.disappear == false) {
    movedBall = new Ball(mouseX, mouseY, myBall.dia, myBall.ballCol, myBall.xSpeed, myBall.ySpeed, myBall.xSpeedChange, myBall.ySpeedChange);
    myBall.disappear = true;
  } else {
    movedBall = new Ball(mouseX, mouseY, myBall.dia, myBall.ballCol, movedBall.xSpeed, movedBall.ySpeed, movedBall.xSpeedChange, movedBall.ySpeedChange);
    myBall.disappear = true;
  }

  /* if (mouseX>=exit.x && mouseX<=exit.x+exit.w && mouseY>=exit.y && mouseY<=exit.y+exit.h) {
   exit();
   }*/
}

//endDRIVER
