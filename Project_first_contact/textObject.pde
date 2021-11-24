class TextObject {

  String text;
  int xPos;
  int yPos;
  PImage textBoxImage;
  String textBoxImageName;
  int fontSize;
  color fontColor;
  boolean showRect;
  boolean isActive = false;
  boolean hasBeenCompletedOnce;


  boolean useButton;
  int buttonPosX;
  int buttonPosY;
  PImage cursorImage;
  int buttonImageWidth;
  int buttonImageHeight;
  boolean useHoverButton;
  PImage hoverButtonImage;
  boolean mouseIsHoveringOverButton;

  private boolean startOnAwake;
  private boolean loadNewSceneOnFinish;
  private String sceneName;

  TextObject() {
    text = "";
  }

  TextObject(String _text, int x, int y, String imageName, int _fontSize, color _fontColor) {
    this();
    text = _text;
    xPos = x;
    yPos = y;
    if (imageName != "") { 
      textBoxImage = loadImage(imageName);
    }
    textBoxImageName = imageName;
    showRect = imageName == "";
    fontSize = _fontSize;
    fontColor = _fontColor;
  }
  TextObject(String _text, int x, int y, String imageName, int _fontSize, color _fontColor, int buttonX, int buttonY, String cursorImageName, int buttonWidth, int buttonHeight) {
    this();
    text = _text;
    xPos = x;
    yPos = y;
    if (imageName != "") { 
      textBoxImage = loadImage(imageName);
    }
    showRect = imageName == "";
    fontSize = _fontSize;
    fontColor = _fontColor;

    useButton = cursorImageName != "";
    if (useButton) { 
      buttonPosX = buttonX;
      buttonPosY = buttonY;
      cursorImage = loadImage(cursorImageName);
      buttonImageWidth = buttonWidth;
      buttonImageHeight = buttonHeight;
    }
  }

  public void loadOnAwake() {
    startOnAwake = true;
  }

  public void dontshowRect() {
    showRect = false;
  }

  public void loadSceneOnComplete(String sceneID) {
    loadNewSceneOnFinish = true;
    sceneName = sceneID;
  }

  void setHoverImage(String hoverButtonImageName) {
    if (hoverButtonImageName != "") { 
      hoverButtonImage = loadImage(hoverButtonImageName);
      useHoverButton = true;
    }
  }

  void awake() {
    if (startOnAwake) {
      isActive = true;
      startOnAwake = false;
    }
  }

  void draw() {
  }

  void mouseClicked() {

    if (isActive) {
      isActive = false;
      hasBeenCompletedOnce = true;
      if (loadNewSceneOnFinish) {
        try {
          sceneManager.goToScene(sceneName);
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

  void mouseMoved() {
    mouseIsHoveringOverButton = mouseIsHoveringOverButton();
  }

  boolean mouseIsHoveringOverButton() {
    return (mouseX >= buttonPosX - 10 && mouseX <= buttonPosX + buttonImageWidth + 10) && (mouseY >= buttonPosY - 10 && mouseY <= buttonPosY + buttonImageHeight + 10);
  }
}
