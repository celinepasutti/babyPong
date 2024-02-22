class Button {
  float x, y, w, h;
  color butCol;
  int referentMeasure = (displayWidth < displayHeight) ? displayWidth: displayHeight;
  
  Button(/*float quitButtonXParameter, float quitButtonYParameter, float quitButtonWParameter, float quitButtonHParameter*/) {
    this.x = /*quitButtonXParameter =*/ referentMeasure*1.72;
    this.y = /*quitButtonYParameter =*/ referentMeasure*0;
    this.w = /*quitButtonWParameter =*/ referentMeasure*1.2/20;
    this.h = /*quitButtonHParameter =*/ referentMeasure*1/20;
    
    
  }
  
  void draw() {
    if(mouseX>=x && mouseX<=x+w && mouseY>=y && mouseY<=y+h) {
    noStroke();
    this.butCol = red;
    fill (butCol);
    rect(x, y, w, h);
    fill (0);
   
    
  } else {
    noStroke();
    this.butCol = gray;
    fill (butCol);
    rect(x, y, w, h);
    fill (0);
  }
 }
}
