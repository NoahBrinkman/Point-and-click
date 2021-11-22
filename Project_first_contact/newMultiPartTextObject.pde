class NewMultiPartTextObject extends NewTextObject {

  String[] textParts;
  int currentIndex = -1;

  NewMultiPartTextObject() {
    super();
  }
  NewMultiPartTextObject(String _text, int x, int y, String imageName, int _fontSize, color _fontColor) {
    super(".", x, y, imageName, _fontSize, _fontColor);
    textParts = _text.split("@");
    currentIndex = -1;
    super.text = textParts[0];
  }
  NewMultiPartTextObject(String _text, int x, int y, String imageName, int _fontSize, color _fontColor, int buttonX, int buttonY, String buttonImageName, int buttonWidth, int buttonHeight) {
    super(".", x, y, imageName, _fontSize, _fontColor, buttonX, buttonY, buttonImageName, buttonWidth, buttonHeight);
    textParts = _text.split("@");
    currentIndex = -1;
    super.text = textParts[0];
  }


  @Override
    public void mouseClicked() {    
    if (isActive) {
      if (currentIndex + 1 >= textParts.length) {
        super.text = textParts[0];
        currentIndex = -1;
        isActive = false;
        if (super.loadNewSceneOnFinish) {
          try {
            sceneManager.goToScene(super.sceneName);
          } 
          catch(Exception e) { 
            println(e.getMessage());
          }
        }
      } else {
        currentIndex++;
        super.text = textParts[currentIndex];
      }
    }
    if (sceneManager.getCurrentScene().textManager.otherTextIsAlreadyActive) {
      return;
    }
    if (useButton && mouseIsHoveringOverButton()) {
      isActive = true;
    }
  }
}
