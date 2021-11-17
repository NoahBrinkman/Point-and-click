class multiFileText extends TextObject {
    boolean Text1isDisplayed;
    private boolean displayText2;
    int textNumber = -1;
    private float textWidth;
    private float textHeight;
    ArrayList<String> textList = new ArrayList<String>();
    
    multiFileText(String identifier, int x, int y, int owidth, int oheight, String gameObjectImageFile, String[] pTextArray) {
    super(identifier, x, y, owidth, oheight, gameObjectImageFile, pTextArray[0]);
    for(int i = 0; i < pTextArray.length; i++){
      textList.add(pTextArray[i]);
    }
  }
        
    @Override
    public void draw() {
    super.draw();
    if(super.displayText) {
      fill(255);
      rect(this.x, this.y, this.textWidth + 30, this.textHeight, 8);
      fill(0);
      text(textList.get(textNumber), this.x + 15, this.y + 15, this.textWidth, this.textHeight);
      Text1isDisplayed = true;
    }
    if(displayText2) {
        fill(255);
        rect(this.x, this.y, this.textWidth + 30, this.textHeight, 8);
        fill(0);
        text(textList.get(textNumber), this.x + 15, this.y + 15, this.textWidth, this.textHeight);
        Text1isDisplayed = false;
    }
    }
    @Override
    public void mouseClicked() {
        super.displayText = false;
        displayText2 = false;
        if(textNumber == textList.size()-1) {textNumber = -1;}
        else if(Text1isDisplayed) {displayText2 = true; textNumber++; this.calculateTextArea(textList.get(textNumber));}
        else if(mouseIsHovering) { super.displayText = true; textNumber++; this.calculateTextArea(textList.get(textNumber));}
    }
      public void calculateTextArea(String text) {
        textWidth = textWidth(text);
        textHeight = 50;
    float remaining = textWidth - 300;
    textWidth = (textWidth > 300) ? 300 : textWidth;
    textHeight = 50;
    while(remaining > 300)
    {
      textHeight += 30;
      remaining -= 300;
    }
  }
}