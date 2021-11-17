class multiFileText extends TextObject {
    String text2;
    boolean Text1isDisplayed;
    private boolean displayText2;
    
    multiFileText(String identifier, int x, int y, int owidth, int oheight, String gameObjectImageFile, String text, String text2) {
    super(identifier, x, y, owidth, oheight, gameObjectImageFile, text);
    this.text2 = text2;
    }
    @Override
  public void draw() {
    super.draw();
    if(super.displayText) {
      fill(255);
      rect(this.x, this.y, super.textWidth + 30, super.textHeight, 8);
      fill(0);
      text(super.text, this.x + 15, this.y + 15, super.textWidth, super.textHeight);
      Text1isDisplayed = true; 
    }
    if(displayText2) {
        fill(255);
        rect(this.x, this.y, super.textWidth + 30, super.textHeight, 8);
        fill(0);
        text(text2, this.x + 15, this.y + 15, super.textWidth, super.textHeight);
        Text1isDisplayed = false;
    }
    }
    @Override
    public void mouseClicked() {
        super.displayText = false;
        displayText2 = false;
        if(mouseIsHovering) { super.displayText = true; }
        if(Text1isDisplayed) {super.displayText = false; displayText2 = true;}
    }


}