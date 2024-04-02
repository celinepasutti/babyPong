boolean partyMode = false;
//int secondClicked, secondCurrent, obj;

void partyMode() {
  if (partyMode == true) {
    tableColor = color (random(255), random(255), random(255));
    //myBall.ballCol = color (random(255), random(255), random(255));
    
    //if(second = 

    for (int i = 0; i < confettis.length; i++) {
      confettis[i].draw();
    }
  }
  tableColor = 150;
}

class Confetti {
  float x, y, wh;
  float stepSpeed;
  color confettiCol;

  Confetti(float xParameter, float yParameter, float whParameter) {
    this.x = xParameter;
    this.y = yParameter;
    this.wh = whParameter;
    this.confettiCol = color (int(random(255)), int(random(255)), int(random(255)));
    this.stepSpeed = random(2, 4);
  }

  void draw() {
    step();
    fill(confettiCol);
    rect(x, y, wh, wh);
    fill(0);
  }

  void step() {
    y += stepSpeed;
    if (y > displayHeight) {
      y = 0;
    }
  }
}

void createConfetti() {
  for (int i=0; i<confettis.length; i++) {
    float whRandom = random(width*1/200, width*1/100);
    float xRandom = random(whRandom*1/2, width-whRandom*1/2);
    float yRandom = random(whRandom*1/2, height-whRandom*1/2);
    confettis[i] = new Confetti(xRandom, yRandom, whRandom);
    int j=i;

    while (j>=0) {
      if (xRandom-whRandom*1/2 > confettis[j].x && xRandom+whRandom*1/2 < confettis[j].x) {
        xRandom = random(whRandom*1/2, width-whRandom*1/2);
        // println("X Rechoose run");
      }
      //println("First j", j);
      j--;
    }

    while (j>=0) {
      if (yRandom-whRandom*1/2 > confettis[j].y && yRandom+whRandom*1/2 < confettis[j].y) {
        yRandom = random(whRandom*1/2, height-whRandom*1/2);
        //println("Y Rechoose run");
      }
      //println("Second j", j);
      j--;
    }

    confettis[i] = new Confetti(xRandom, yRandom, whRandom);
  }
}
