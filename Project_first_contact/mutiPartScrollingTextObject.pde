class multiPartScrollingTextObject extends TextObject {
    String displayedText = "";
    float secondsUntilNextChar = .01f;
    float timer = .01f;
    int currentCharIndex = -1;
    boolean isFinished = false;
    String[] textParts;
    int currentIndex = -1;
  
  
  
  multiPartScrollingTextObject(String identifier, int x, int y, int owidth, int oheight, String gameObjectImageFile, String text, float secondsBetweenCharacters) {
    super(identifier, x, y, owidth, oheight, gameObjectImageFile, text);
    secondsUntilNextChar = secondsBetweenCharacters;
    timer = secondsUntilNextChar;
    textParts = text.split("@");
    String longestString = textParts[0];
    for(int i = 0; i < textParts.length; i++){
      if(textParts[i].length() > longestString.length()){
        longestString = textParts[i];
      }
    }
    super.text = longestString;
    super.calculateTextArea();
  }
    
     
    


  @Override
    void draw() {
    super.draw();
    drawText();
    textSize(11);
    fill(0);}

  @Override
    void drawText() {
    textSize(11);
    if (super.displayText) {
      fill(255);
      rect(this.x, this.y, super.textWidth + 30, super.textHeight, 8);
      fill(0);
      text(displayedText, this.x + 15, this.y + 15, super.textWidth, super.textHeight); 
      timer -= deltaTime;
      if (timer <= 0) {
        addNextChar();
        timer = secondsUntilNextChar;
      }
    }
  }

  @Override
    void drawText(boolean showRect) {
    textSize(11);
    if (super.displayText) {
      if (showRect) {
        fill(255);
        rect(this.x, this.y, super.textWidth + 30, super.textHeight, 8);
      }
      fill(0);
      text(displayedText, this.x + 15, this.y + 15, super.textWidth, super.textHeight); 
      timer -= deltaTime;
      if (timer <= 0) {
        addNextChar();
        timer = secondsUntilNextChar;
      }
    }
  }
  @Override
    void drawText(boolean showRect, boolean changeFontSize, int fontSize) {
    textSize(changeFontSize ? fontSize : 11);

    if (super.displayText) {
      if (showRect) {
        fill(255);
        rect(this.x, this.y, super.textWidth + 30, super.textHeight, 8);
      }
      fill(0);
      text(displayedText, this.x + 15, this.y + 15, super.textWidth, super.textHeight); 
      timer -= deltaTime;
      if (timer <= 0) {
        addNextChar();
        timer = secondsUntilNextChar;
      }
    }
  }
  
    @Override
    void drawText(boolean showRect, boolean changeFontSize, int fontSize, boolean changeFontColor, color fontColor) {
    textSize(changeFontSize ? fontSize : 11);

    if (super.displayText) {
      if (showRect) {
        fill(255);
        rect(this.x, this.y, super.textWidth + 30, super.textHeight, 8);
      }
      fill(changeFontColor ? fontColor : 0);
      text(displayedText, this.x + 15, this.y + 15, super.textWidth, super.textHeight); 
      timer -= deltaTime;
      if (timer <= 0) {
        addNextChar();
        timer = secondsUntilNextChar;
      }
    }
  }
  
  void addNextChar() {
    if ((currentCharIndex + 1) >= textParts[currentIndex].length()) {
      isFinished = true;
      return;
    }
    currentCharIndex++;
    displayedText += textParts[currentIndex].charAt(currentCharIndex);
  }
  @Override
    public void mouseClicked() {
    super.displayText = false;
    if (mouseIsHovering || this.displayText) { 
      this.displayText = true;
      if (currentIndex + 1 >= textParts.length) {
        super.displayText = false;
        currentIndex = -1;
      } else {
        currentIndex++;
        displayedText = "";
        currentCharIndex = 0;
      }
    } else {
      currentIndex = -1;
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
