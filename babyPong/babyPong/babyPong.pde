//Global Vars and objects


Ball myBall, movedBall;
Ball[] fireworks = new Ball[20];
Confetti[] confettis = new Confetti[500];
Paddle table, exitBut, restartBut, oneBut, twoBut, screenSaverBut, lPaddle, rPaddle, rScoreB, lScoreB;

color black=#000000, white=#FFFFFF, red=#951111, Lgreen=#27C149, gray=#CBCBCB;

color tableColor = gray;//ERROR - move to table CLASSSSS!!!!!!! NOWWWW!!!!!! >:(

int rScore, lScore;
String rScoreTxt = str(rScore);
String lScoreTxt = str(lScore);

void setup() {
  println("intiated");
  noStroke();
  fullScreen();
  createConfetti();
  /*screenSizeChecker(); for landscape, portrait, square views.
   Updated automatically for screen rotation on android.
   */
  //String[] fontList = PFont.list();
  //printArray(fontList);

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
  exitBut = new Paddle ("X", 30, white, red, displayWidth*17/20, displayHeight*1/30, displayWidth/10, displayHeight/24);
  restartBut = new Paddle ("NEW", 20, white, Lgreen, displayWidth*1/20, displayHeight*1/30, displayWidth/10, displayHeight/24);
  oneBut = new Paddle ("ONE PLAYER", 20, white, tableColor, displayWidth*1/20, displayHeight*28/30, displayWidth/10, displayHeight/24);
  twoBut = new Paddle ("TWO PLAYERS", 20, white, tableColor, displayWidth*9/20, displayHeight*28/30, displayWidth/10, displayHeight/24);
  screenSaverBut = new Paddle ("SCREEN SAVER", 20, white, tableColor, displayWidth*17/20, displayHeight*28/30, displayWidth/10, displayHeight/24);




  myBall.tableUpdate(rPaddle.tableX, rPaddle.tableY, rPaddle.tableW, rPaddle.tableH);

  for (int i = 0; i < fireworks.length; i++) {
    fireworks[i] = new Ball(displayWidth * -1, displayHeight * -1, 0.5);
  }
}//endSetup

void rScoreUpdate() {
  rScore += 1;
  rScoreTxt = str(rScore);
}

void lScoreUpdate() {
  lScore += 1;
  lScoreTxt = str(lScore);
}

void draw() {
  background(0);
  partyMode();
  table.draw();

  rScoreB = new Paddle (rScoreTxt, 50, white, black, displayWidth*6/20, displayHeight*1/30, displayWidth/10, displayHeight/24);
  lScoreB = new Paddle (lScoreTxt, 50, white, black, displayWidth*12/20, displayHeight*1/30, displayWidth/10, displayHeight/24);

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

  if (myBall.disappear == false) { //goal - firework execution is based on x value. triggers are left goal and right goal.
    if (myBall.ballX < myBall.ballDia) {
      lScoreUpdate();
      myBall.netExplosion(myBall.ballX, myBall.ballY, 0.5);
    }
    if (myBall.ballX > (displayWidth - myBall.ballDia)) {
      rScoreUpdate();
      myBall.netExplosion(myBall.ballX, myBall.ballY, 0.5);
    }
    for (int i = 0; i < fireworks.length; i++) {
      fireworks[i].tableUpdate(rPaddle.tableX, rPaddle.tableY, rPaddle.tableW, rPaddle.tableH);
    }
  } else if (myBall.disappear == true) {
    if (movedBall.ballX < movedBall.ballDia) {
      lScoreUpdate();
      movedBall.netExplosion(movedBall.ballX, movedBall.ballY, 0.5);
    }
    if (movedBall.ballX > (displayWidth - movedBall.ballDia)) {
      rScoreUpdate();
      movedBall.netExplosion(movedBall.ballX, movedBall.ballY, 0.5);
    }
    for (int i = 0; i < fireworks.length; i++) {
      fireworks[i].tableUpdate(rPaddle.tableX, rPaddle.tableY, rPaddle.tableW, rPaddle.tableH);
    }
  }
  println("left score", lScore);
  println("right score", rScore);
  movedBall.draw();
  //println(movedBall.x);

  if (myBall.disappear == true) {
    movedBall.paddleUpdate(rPaddle.paddleX, lPaddle.paddleX, rPaddle.paddleY, lPaddle.paddleY, rPaddle.paddleW, lPaddle.paddleW, rPaddle.paddleH, lPaddle.paddleH);
  } else {
    myBall.paddleUpdate(rPaddle.paddleX, lPaddle.paddleX, rPaddle.paddleY, lPaddle.paddleY, rPaddle.paddleW, lPaddle.paddleW, rPaddle.paddleH, lPaddle.paddleH);
  }

  exitBut.draw();
  restartBut.draw();
  oneBut.draw();
  twoBut.draw();
  screenSaverBut.draw();
  rScoreB.draw();
  lScoreB.draw();
}

void keyPressed() {
  if (key == 'p' || key == 'P') {
    if (partyMode == false) {
      //secondClicked = second();
      //obj = secondClicked + 3;
      partyMode = true;
      println("partyMode on!");
    } else {
      partyMode = false;
      println("partyMode off!");
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
  if (mouseX > table.tableX && mouseX < (table.tableX + table.tableW) && mouseY > table.tableY && mouseY < (table.tableY + table.tableH)) { //movedBall error catch
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
  }
    if (mouseX >= exitBut.butX && mouseX <= (exitBut.butX + exitBut.butW) && mouseY >= exitBut.butY && mouseY <= (exitBut.butY + exitBut.butH)) {
      println("terminated");
      exit();
    }
  }


//endDRIVER
