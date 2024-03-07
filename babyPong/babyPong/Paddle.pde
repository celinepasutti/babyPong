class Paddle {
 //class vars
 float tableX, tableY, tableW, tableH;
 float netX, netY, netW, netH;
 float paddleX, paddleY, paddleW, paddleH;
 color paddleCol;
 
 Paddle (float paddleStartParameter, float ballDiaParameter) {
   netW = ballDiaParameter*2;
   tableH = displayHeight * 8/10;
   tableY = displayHeight*1/10;
   paddleW = ballDiaParameter*1/2;
   paddleH = tableH*1/4;
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
   this.paddleY = tableY + (tableH*1/2) - (paddleH*1/2);
   this.paddleCol = 255;
   
   
 }
 
 void draw() {
  fill (paddleCol);
  rect(paddleX, paddleY, paddleW, paddleH);
  fill(0);
 }//end draw
 
 void movePaddleDown() {
  paddleY += paddleTravelSpeed; //DOWN
 }
 
 void movePaddleUp() {
  paddleY -= paddleTravelSpeed; 
 }
}// end class
