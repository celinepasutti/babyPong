//global vars
//// keyPressed --> draw(); encapsulate later on.

class Paddle {
  //class vars
  float netX, netY, netW, netH;
  float paddleX, paddleY, paddleW, paddleH, paddleHeightRef;
  //float butX, butY, butW, butH;
  //float menuX, menuY, menuW, menuH;
  float paddleSpeed;
  color paddleCol;
  //color butCol;
  boolean up = false, down = false;
  boolean paddle;

  float tableX = 0;
  float tableW = displayWidth;
  float tableH = displayHeight * 8/10;
  float tableY = displayHeight * 1/10;

  Paddle (float paddleStartParameter, float ballDiaParameter, color paddleColParameter) {
    paddle = true;
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

  /*Paddle (float menuXParameter, float menuYParameter, float menuWParameter, float menuHParameter) { //menu
    this.paddleCol = 255;
    paddle = false;
    this.menuX = menuXParameter;
    this.menuY = menuYParameter;
    this.menuW = menuWParameter;
    this.menuH = menuHParameter;
  }*/
  
  Paddle () { //table
    paddle = false;
  }

  void draw() {
   if (paddle == false) {
    fill(gray);
    rect(tableX, tableY, tableW, tableH);
    fill(0);
   }
    
    paddles();
    fill(0);
  }//end draw

  /*void setup() {
      fill(paddleCol);
      rect(menuX, menuY, menuW, menuH);
      fill(0);
  }*/

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
    } else {
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
