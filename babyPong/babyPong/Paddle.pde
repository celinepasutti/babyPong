//global vars
//// keyPressed --> draw(); encapsulate later on.

class Paddle {
  //class vars
  float netX, netY, netW, netH;
  float paddleX, paddleY, paddleW, paddleH, paddleHeightRef;
  float butX, butY, butW, butH;
  //float menuX, menuY, menuW, menuH;
  float paddleSpeed;
  color paddleCol;
  boolean up = false, down = false;
  boolean paddle, button;

  float tableX = 0;
  float tableW = displayWidth;
  float tableH = displayHeight * 8/10;
  float tableY = displayHeight * 1/10;

  Paddle (float paddleStartParameter, float ballDiaParameter, color paddleColParameter) {
    paddle = true;
    button = false;
    netW = ballDiaParameter*2;
    paddleW = ballDiaParameter*1/2;
    paddleHeightRef = 0.25;
    if (paddleStartParameter ==  0) {
      netX = paddleStartParameter;
    }
    if (paddleStartParameter == displayWidth) {
      netX = paddleStartParameter - (netW*2 + paddleW);
    }
    this.paddleX = netX + netW; //caution: netX has two possible values -- ERROR.
    if (paddleStartParameter == displayWidth) {
      netX = paddleStartParameter - (netW*2 + paddleW);
    }
    this.paddleH = tableH * paddleHeightRef;
    this.paddleY = tableY + (tableH*1/2) - (paddleH*1/2);
    this.paddleCol = paddleColParameter;
    this.paddleSpeed = 9;
    this.up = false;
    this.down = false;
  }

  Paddle () { //table
    paddle = false;
  }

  Paddle (float butXParameter, float butYParameter, float butWParameter, float butHParameter, color butColParameter) { // button
    paddle = false;
    button = true;
    this.butX = butXParameter;
    this.butY = butYParameter;
    this.butW = butWParameter;
    this.butH = butHParameter;
    this.paddleCol = butColParameter;
  }

  void draw() {
    table();
    paddles();
    fill(0);
  }//end draw

  void table() {
    if (paddle == false && button == false) {
      fill(gray);
      rect(tableX, tableY, tableW, tableH);
      fill(0);
    }
  }
  
  void button() {
    if (button == true) {
      if (mouseX >= this.butX && mouseX <= (this.butX + this.butW) && mouseY >= this.butY && mouseY <= (this.butY + this.butH)) {
      noStroke();
      fill (paddleCol);
      rect(butX, butY, butW, butH);
      fill (0);
    } else {
      noStroke();
      fill (tableColor);
      rect(butX, butY, butW, butH);
      fill (0);
    }
    }
  }

  void paddles() {
    if (paddle == true) {
      fill (paddleCol);
      rect(paddleX, paddleY, paddleW, paddleH);
      if (up == true) {
        movePaddleUp();
      }
      if (down == true) {
        movePaddleDown();
      }
    }
  }

  void movePaddleUp() {
    paddleY -= paddleSpeed;
    if (paddleY < tableY) { //error catch
      paddleY = tableY;
    }
  }

  void movePaddleDown() {
    paddleY += paddleSpeed; //DOWN
    if ((paddleY + paddleH) > (tableY + tableH)) {
      paddleY = ((tableY + tableH) - paddleH);
    }
  }

  void keyPressedWASD() {
    if (key == 'w' || key == 'W') {
      down = false;
      up = true;
    }
    if ( key == 's' || key == 'S') {
      up = false;
      down = true;
    }
  }

  void keyPressedARROW() {
    if (key == CODED && keyCode == UP) {
      down = false;
      up = true;
    }
    if (key == CODED && keyCode == DOWN) {
      up = false;
      down = true;
    }
  }

  void keyReleasedWASD() {
    if (key == 'w' || key == 'W') {
      up = false;
    }
    if (key == 's' || key == 'S') {
      down = false;
    }
  }

  void keyReleasedARROW() {
    if (key == CODED && keyCode == UP) {
      up = false;
    }
    if (key == CODED && keyCode == DOWN) {
      down = false;
    }
  }
}// end class
