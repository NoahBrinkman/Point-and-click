class ScrollingTextObject extends TextObject {

  String heldText = ".";
  float secondsUntilNextChar = .01f;
  float timer = .01f;
  int currentCharIndex = -1;
  boolean isFinished = false;


  ScrollingTextObject() {
    super();
  }
  ScrollingTextObject(String _text, int x, int y, String imageName, int _fontSize, color _fontColor, float timeBetweenCharacters) {
    super(".", x, y, imageName, _fontSize, _fontColor);
    heldText = _text;
    currentCharIndex = -1;
    secondsUntilNextChar = timeBetweenCharacters;
  }

  ScrollingTextObject(String _text, int x, int y, String imageName, int _fontSize, color _fontColor, int buttonX, int buttonY, String buttonImageName, int buttonWidth, int buttonHeight, float timeBetweenCharacters) {
    super(".", x, y, imageName, _fontSize, _fontColor, buttonX, buttonY, buttonImageName, buttonWidth, buttonHeight);
    heldText = _text;
    currentCharIndex = -1;
    secondsUntilNextChar = timeBetweenCharacters;
  }

  @Override
    void draw() {
    super.draw();
    if (super.isActive && !isFinished) {
      timer -= deltaTime;
      if (timer <= 0.0f) {
        addChar();
      }
    }
  }

  @Override
    void mouseClicked() {
    if (isActive) {
      currentCharIndex = -1;
      timer = secondsUntilNextChar;
      isFinished = false;
      super.text = ".";
      isActive = false;
      if (super.loadNewSceneOnFinish) {
        try {
          sceneManager.goToScene(super.sceneName);
        } 
        catch(Exception e) { 
          println(e.getMessage());
        }
      }
    }
    if (sceneManager.getCurrentScene().textManager.otherTextIsAlreadyActive) {
      return;
    }
    if (useButton && mouseIsHoveringOverButton()) {
      isActive = true;
    }
  }

  void addChar() {
    if (currentCharIndex + 1 >= heldText.length()) {
      isFinished = true;
    } else {

      currentCharIndex++;
      super.text = super.text + heldText.charAt(currentCharIndex);
    }
  }
}
