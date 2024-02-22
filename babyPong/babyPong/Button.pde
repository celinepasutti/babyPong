class Button {
  float x, y, w, h;
  color butCol = gray;
  int referentMeasure = (displayWidth < displayHeight) ? displayWidth: displayHeight;
  
  Button(color butColParameter) {
    this.x = /*quitButtonXParameter =*/ referentMeasure*1.72;
    this.y = /*quitButtonYParameter =*/ referentMeasure*0;
    this.w = /*quitButtonWParameter =*/ referentMeasure*1.2/20;
    this.h = /*quitButtonHParameter =*/ referentMeasure*1/20;
    this.butCol = butColParameter;
    
  }
  
  void draw() {
    if(mouseX>=x && mouseX<=x+w && mouseY>=y && mouseY<=y+h) {
    noStroke();
    butCol = Button.butColParameter;
    fill (butCol);
    rect(x, y, w, h);
    fill (0);
   
    
  } else {
    noStroke();
    fill (butCol);
    rect(x, y, w, h);
    fill (0);
  }
 }
}
