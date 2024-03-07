//global vars
//// keyPressed --> draw(); encapsulate later on.

class Paddle {
 //class vars
 float tableX, tableY, tableW, tableH;
 float netX, netY, netW, netH;
 float paddleX, paddleY, paddleW, paddleH, paddleHeightRef;
 float paddleSpeed;
 color paddleCol;
 Boolean up = false, down = false;
 
 Paddle (float paddleStartParameter, float ballDiaParameter) {
   netW = ballDiaParameter*2;
   tableH = displayHeight * 8/10;
   tableY = displayHeight * 1/10;
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
   this.paddleCol = 255;
   this.paddleSpeed = 9;
   this.up = false;
   this.down = false;
 }
 
 void draw() {
  fill (paddleCol);
  paddles();
  fill(0);
 }//end draw
 
 void paddles() {
  rect(paddleX, paddleY, paddleW, paddleH);
  if (up == true) {
   movePaddleUp(); 
  }
  if (down == true) {
   movePaddleDown(); 
  }
 }
 
 void movePaddleUp() {
  paddleY -= paddleSpeed; 
  if (paddleY < tableY) { //error catch
    paddleY = tableY;
  }
  up = false;
 }
 
  void movePaddleDown() {
  paddleY += paddleSpeed; //DOWN
  if ((paddleY + paddleH) > (tableY + tableH)) {
    paddleY = ((tableY + tableH) - paddleH);
  }
  down = false;
 }
 
}// end class
