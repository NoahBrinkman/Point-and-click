class MultiPartScrollingTextObject extends TextObject {

  private String[] textParts;
  private int currentIndex = -1;

  private String heldText = ".";
  private String currentString;
  private float secondsUntilNextChar = .01f;
  private float timer = .01f;
  private int currentCharIndex = -1;
  private boolean isFinished = false;
  private String buttonImageName;
  private boolean linkedToFinalObjective;
  private boolean quitGameOnFinish;

  MultiPartScrollingTextObject() {
    super();
  }
  MultiPartScrollingTextObject(String _text, int x, int y, String imageName, int _fontSize, color _fontColor, float timeBetweenCharacters) {
    super(".", x, y, imageName, _fontSize, _fontColor);
    textParts = _text.split("@");
    currentIndex = -1;
    heldText = "";
    currentCharIndex = -1;
    secondsUntilNextChar = timeBetweenCharacters;
    currentString = textParts[0];
  }
  MultiPartScrollingTextObject(String _text, int x, int y, String imageName, int _fontSize, color _fontColor, int buttonX, int buttonY, String buttonImageName, int buttonWidth, int buttonHeight, float timeBetweenCharacters) {
    super(".", x, y, imageName, _fontSize, _fontColor, buttonX, buttonY, buttonImageName, buttonWidth, buttonHeight);
    textParts = _text.split("@");
    currentIndex = 0;
    heldText = "";
    currentCharIndex = -1;
    secondsUntilNextChar = timeBetweenCharacters;
    currentString = textParts[0];
  }
  MultiPartScrollingTextObject(String _text, int x, int y, String imageName, int _fontSize, color _fontColor, int buttonX, int buttonY, String buttonImageName, int buttonWidth, int buttonHeight, float timeBetweenCharacters, boolean linkToFinalObjective) {
    super(".", x, y, imageName, _fontSize, _fontColor, buttonX, buttonY, buttonImageName, buttonWidth, buttonHeight);
    textParts = _text.split("@");
    currentIndex = 0;
    heldText = "";
    currentCharIndex = -1;
    secondsUntilNextChar = timeBetweenCharacters;
    currentString = textParts[0];
    linkedToFinalObjective = linkToFinalObjective;
    this.buttonImageName = buttonImageName;
  }

  void quitGameOnFinish() {
    quitGameOnFinish = true;
  }

  @Override
    void awake() {
    if (super.startOnAwake) {
      currentIndex  = 0;
      isActive = true;
      super.startOnAwake = false;
    }
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
    if (currentIndex >=0) {
      super.xPos = width / 2 - (int)textWidth(textParts[currentIndex]) / 2;
    }
  }

  @Override
    public void mouseClicked() {    
    if (isActive) {
      if (currentIndex + 1 >= textParts.length && isFinished) {
        currentString = textParts[0];
        heldText = "";
        currentIndex = 0;
        isActive = false;
        super.hasBeenCompletedOnce = true;
        isFinished = false;
        if (super.loadNewSceneOnFinish) {
          try {
            sceneManager.goToScene(super.sceneName);
          } 
          catch(Exception e) { 
            println(e.getMessage());
          }
        }
        if (quitGameOnFinish) {
          exit();
          return;
        }
      } else if (isFinished) {
        currentIndex++;
        currentString = textParts[currentIndex];
        isFinished = false;
        currentCharIndex = -1;
        heldText = ".";
      } else {
        isFinished = true;
        heldText = currentString;
        currentCharIndex = -1;
      }
    }
    if (sceneManager.getCurrentScene().textManager.otherTextIsAlreadyActive) {
      return;
    }
    if (useButton && mouseIsHoveringOverButton()) {
      if (linkedToFinalObjective && uIManager.allObjectivesButFinalComplete()) {
        println("hi");
        try {
          sceneManager.goToScene("finalScene");
        }
        catch(Exception e) {
          println(e);
        }
      }
      isActive = true;
    }
  }


  void addChar() {
    if (currentCharIndex + 1 >= currentString.length()) {
      isFinished = true;
    } else {
      currentCharIndex++;
      if (currentCharIndex == 0) {
        heldText = "";
      }
      heldText = heldText + currentString.charAt(currentCharIndex);
      isFinished = false;
    }
  }
}
