//Global Vars and objects

Ball myBall, movedBall;
Ball[] fireworks = new Ball[20];
Confetti[] confettis = new Confetti[500];
Paddle table, lPaddle, rPaddle;

color black=#000000, white=#FFFFFF, red=#951111, Lgreen=#27C149, gray=#CBCBCB;

//Button exit;

color tableColor = gray;//ERROR - move to table CLASSSSS!!!!!!! NOWWWW!!!!!! >:(

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
  movedBall = new Ball(displayWidth * -1, displayHeight * -1, myBall.ballDia, myBall.ballCol, myBall.xSpeed, myBall.ySpeed, myBall.xSpeedChange, myBall.ySpeedChange);
  //exit = new Button(red, displayWidth*19/20, displayHeight*0, displayWidth*1/20, displayHeight*1/25);

  rPaddle = new Paddle(0, myBall.ballDia, white);
  lPaddle = new Paddle(displayWidth, myBall.ballDia, white);
  table = new Paddle();

  myBall.tableUpdate(rPaddle.tableX, rPaddle.tableY, rPaddle.tableW, rPaddle.tableH);

  for (int i = 0; i < fireworks.length; i++) {
    fireworks[i] = new Ball(displayWidth * -1, displayHeight * -1, 0.5);
  }
}//endSetup

void draw() {
  background(0);
  partyMode();
  table.draw();

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

  if (myBall.disappear == false  && myBall.ballX < myBall.ballDia || myBall.ballX > (displayWidth - myBall.ballDia)) { //goal - firework execution is based on x value. triggers are left goal and right goal.
    myBall.netExplosion(myBall.ballX, myBall.ballY, 0.5);
    for (int i = 0; i < fireworks.length; i++) {
      fireworks[i].tableUpdate(rPaddle.tableX, rPaddle.tableY, rPaddle.tableW, rPaddle.tableH);
    }
  } else if (myBall.disappear == true && movedBall.ballX < movedBall.ballDia || movedBall.ballX > (displayWidth - movedBall.ballDia)) {
    movedBall.netExplosion(movedBall.ballX, movedBall.ballY, 0.5);
    for (int i = 0; i < fireworks.length; i++) {
      fireworks[i].tableUpdate(rPaddle.tableX, rPaddle.tableY, rPaddle.tableW, rPaddle.tableH);
    }
  }
  movedBall.draw();
  //println(movedBall.x);

  if (myBall.disappear == true) {
    movedBall.paddleUpdate(rPaddle.paddleX, lPaddle.paddleX, rPaddle.paddleY, lPaddle.paddleY, rPaddle.paddleW, lPaddle.paddleW, rPaddle.paddleH, lPaddle.paddleH);
  } else {
    myBall.paddleUpdate(rPaddle.paddleX, lPaddle.paddleX, rPaddle.paddleY, lPaddle.paddleY, rPaddle.paddleW, lPaddle.paddleW, rPaddle.paddleH, lPaddle.paddleH);
  }
  
  
}

void keyPressed() {
  if (key == 'p' || key == 'P') {
    if (partyMode == false) {
      partyMode = true;
      println("partyMode on!");
    } else {
      partyMode = false;
      println("partyMode off!");
      tableColor = 150;
    }
  }

  rPaddle.keyPressedWASD();
  lPaddle.keyPressedARROW();
}

void keyReleased() {
  rPaddle.keyReleasedWASD();
  lPaddle.keyReleasedARROW();
}

void mousePressed() {
  println("ball moved!");
  if (myBall.disappear == false) {
    movedBall = new Ball(mouseX, mouseY, myBall.ballDia, myBall.ballCol, myBall.xSpeed, myBall.ySpeed, myBall.xSpeedChange, myBall.ySpeedChange);
    movedBall.tableUpdate(rPaddle.tableX, rPaddle.tableY, rPaddle.tableW, rPaddle.tableH);
    myBall.disappear = true;
  } else {
    movedBall = new Ball(mouseX, mouseY, myBall.ballDia, myBall.ballCol, movedBall.xSpeed, movedBall.ySpeed, movedBall.xSpeedChange, movedBall.ySpeedChange);
    movedBall.tableUpdate(rPaddle.tableX, rPaddle.tableY, rPaddle.tableW, rPaddle.tableH);
    myBall.disappear = true;
  }

  /* if (mouseX>=exit.x && mouseX<=exit.x+exit.w && mouseY>=exit.y && mouseY<=exit.y+exit.h) {
   exit();
   }*/
}

//endDRIVER
