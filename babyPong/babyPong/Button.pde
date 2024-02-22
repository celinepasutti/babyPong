class Button {
  float x, y, w, h;
  color butCol = gray;
  int referentMeasure = (displayWidth < displayHeight) ? displayWidth: displayHeight;
  
  Button(color butColParameter, float butXParameter, float butYParameter, float butWParameter, float butHParameter) {
    this.x = butXParameter;
    this.y = butYParameter;
    this.w = butWParameter;
    this.h = butHParameter;
    this.butCol = butColParameter;
    
  }
  
  void draw() {
    if(mouseX>=x && mouseX<=x+w && mouseY>=y && mouseY<=y+h) {
    noStroke();
    fill (butCol);
    rect(x, y, w, h);
    fill (0);
   
    
  } else {
    noStroke();
    fill (tableColor);
    rect(x, y, w, h);
    fill (0);
    }
  }
}
