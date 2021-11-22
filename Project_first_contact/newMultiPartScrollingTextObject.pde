class NewMultiPartScrollingTextObject extends NewTextObject {

  String[] textParts;
  int currentIndex = -1;

  String heldText = ".";
  String currentString;
  float secondsUntilNextChar = .01f;
  float timer = .01f;
  int currentCharIndex = -1;
  boolean isFinished = false;

  NewMultiPartScrollingTextObject() {
    super();
  }
  NewMultiPartScrollingTextObject(String _text, int x, int y, String imageName, int _fontSize, color _fontColor, float timeBetweenCharacters) {
    super(".", x, y, imageName, _fontSize, _fontColor);
    textParts = _text.split("@");
    currentIndex = -1;
    heldText = "";
    currentCharIndex = -1;
    secondsUntilNextChar = timeBetweenCharacters;
    currentString = textParts[0];
  }
  NewMultiPartScrollingTextObject(String _text, int x, int y, String imageName, int _fontSize, color _fontColor, int buttonX, int buttonY, String buttonImageName, int buttonWidth, int buttonHeight, float timeBetweenCharacters) {
    super(".", x, y, imageName, _fontSize, _fontColor, buttonX, buttonY, buttonImageName, buttonWidth, buttonHeight);
    textParts = _text.split("@");
    currentIndex = 0;
    heldText = "";
    currentCharIndex = -1;
    secondsUntilNextChar = timeBetweenCharacters;
    currentString = textParts[0];
  }


  @Override
    void draw() {
    super.draw();

    super.text = heldText;
    if (super.isActive && !isFinished) {
      timer -= deltaTime;
      if (timer <= 0.0f) {
        addChar();
        timer = secondsUntilNextChar;
      }
    }
  }

  @Override
    public void mouseClicked() {    
    if (isActive) {
      if (currentIndex + 1 >= textParts.length) {
        currentString = textParts[0];
        heldText = "";
        currentIndex = -1;
        isActive = false;
        isFinished = false;
        if (super.loadNewSceneOnFinish) {
          try {
            sceneManager.goToScene(super.sceneName);
          } 
          catch(Exception e) { 
            println(e.getMessage());
          }
        }
      } else if (isFinished) {
        currentIndex++;
        currentString = textParts[currentIndex];
        isFinished = false;
        currentCharIndex = -1;
        heldText = "";
      }
    }
    if (useButton && mouseIsHoveringOverButton()) {
      isActive = true;
    }
  }


  void addChar() {
    if (currentCharIndex + 1 >= currentString.length()) {
      isFinished = true;
    } else {
      currentCharIndex++;
      heldText = heldText + currentString.charAt(currentCharIndex);
      isFinished = false;
    }
  }
}