class ScrollingTextObject extends TextObject {

  String displayedText = "";
  float secondsUntilNextChar = .01f;
  float timer = .01f;
  int currentCharIndex = -1;
  boolean isFinished = false;
  
  
  
  ScrollingTextObject(String identifier, int x, int y, int owidth, int oheight, String gameObjectImageFile, String text, float secondsBetweenCharacters) {
    super(identifier, x, y, owidth, oheight, gameObjectImageFile, text);
    secondsUntilNextChar = secondsBetweenCharacters;
    timer = secondsUntilNextChar;
  }

  @Override
    void draw() {
    super.draw();
    drawText();
    textSize(11);
    fill(0);
  }

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
    } else {
      displayedText = "";
      currentCharIndex = 0;
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
    } else {
      displayedText = "";
      currentCharIndex = 0;
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
    } else {
      displayedText = "";
      currentCharIndex = 0;
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
    } else {
      displayedText = "";
      currentCharIndex = 0;
    }
  }
  
  void addNextChar() {
    if ((currentCharIndex + 1) >= super.text.length()) {
      isFinished = true;
      return;
    }
    currentCharIndex++;
    displayedText += super.text.charAt(currentCharIndex);
  }
}
