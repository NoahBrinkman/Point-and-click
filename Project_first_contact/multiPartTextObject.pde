class MultiPartTextObject extends TextObject {

  String[] textParts;
  int currentIndex = -1;


  MultiPartTextObject(String identifier, int x, int y, int owidth, 
    int oheight, String gameObjectImageFile, String text) 
  {
    super(identifier, x, y, owidth, oheight, gameObjectImageFile, text);
    textParts = text.split("@");
    String longestString = textParts[0]; 
    for (int i = 0; i < textParts.length; i++) {
      if (textParts[i].length() > longestString.length()) {
        longestString = textParts[i];
      }
    }
    super.text = longestString;
    super.calculateTextArea();
  }

  @Override
    void draw() {
    super.draw();
    if (super.displayText) {
      fill(255);
      rect(this.x, this.y, super.textWidth + 30, super.textHeight, 8);
      fill(0);
      text(textParts[currentIndex], this.x + 15, this.y + 15, super.textWidth, super.textHeight);
    }
  }

  @Override
    public void mouseClicked() {
    if (mouseIsHovering) { 
      super.displayText = true;
      
    }
    if (currentIndex + 1 >= textParts.length) {
        super.displayText = false;
        currentIndex = -1;
      } else {
        currentIndex++;
      }
  }

  @Override
    void mouseMoved() {
    mouseIsHovering = false;
    if (super.displayText) {
      if (mouseX >= x && mouseX <= x + super.textWidth &&
        mouseY >= y && mouseY <= y + super.textHeight) {
        mouseIsHovering = true;
      }
    } else {
      if (mouseX >= x && mouseX <= x + owidth &&
        mouseY >= y && mouseY <= y + oheight) {
        mouseIsHovering = true;
      }
    }
  }
}
