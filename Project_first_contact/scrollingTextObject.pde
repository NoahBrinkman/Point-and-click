class ScrollingTextObject extends TextObject {
  
  String displayedText = "";
  float secondsUntilNextChar = .01f;
  float timer = .01f;
  int currentCharIndex = -1;
  
  ScrollingTextObject(String identifier, int x, int y, int owidth, int oheight, String gameObjectImageFile, String text, float secondsBetweenCharacters) {
    super(identifier, x, y, owidth, oheight, gameObjectImageFile, text);
    secondsUntilNextChar = secondsBetweenCharacters;
    timer = secondsUntilNextChar;
  }
  
  @Override
  void draw(){
    super.draw();
    if(super.displayText){
      fill(255);
      rect(this.x, this.y, super.textWidth + 30, super.textHeight, 8);
      fill(0);
      text(displayedText, this.x + 15, this.y + 15, super.textWidth, super.textHeight); 
      timer -= deltaTime;
      if(timer <= 0){
        addNextChar();
        timer = secondsUntilNextChar;
      }
    }else {
        displayedText = "";
        currentCharIndex = 0;
      }
  }
  
  void addNextChar(){
    if((currentCharIndex + 1) >= super.text.length()){
      return;
    }
    currentCharIndex++;
    displayedText += super.text.charAt(currentCharIndex);
  }
  
}
