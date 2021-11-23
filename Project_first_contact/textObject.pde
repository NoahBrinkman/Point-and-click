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

  boolean useButton;
  int buttonPosX;
  int buttonPosY;
  PImage buttonImage;
  int buttonImageWidth;
  int buttonImageHeight;
  boolean useHoverButton;
  PImage hoverButtonImage;


  private boolean startOnAwake;
  private boolean loadNewSceneOnFinish;
  private String sceneName;

  TextObject() {
    text = "";
  }

  TextObject(String _text, int x, int y, String imageName, int _fontSize, color _fontColor) {
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
  TextObject(String _text, int x, int y, String imageName, int _fontSize, color _fontColor, int buttonX, int buttonY, String buttonImageName, int buttonWidth, int buttonHeight) {
    text = _text;
    xPos = x;
    yPos = y;
    if (imageName != "") { 
      textBoxImage = loadImage(imageName);
    }
    showRect = imageName == "";
    fontSize = _fontSize;
    fontColor = _fontColor;

    useButton = buttonImageName != "";
    if (useButton) { 
      buttonPosX = buttonX;
      buttonPosY = buttonY;
      buttonImage = loadImage(buttonImageName);
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
    if (useButton) {
      if (useHoverButton && mouseIsHoveringOverButton()) {
        image(hoverButtonImage, buttonPosX, buttonPosY, buttonImageWidth, buttonImageHeight);
      } else {
        image(buttonImage, buttonPosX, buttonPosY, buttonImageWidth, buttonImageHeight);
      }
    }
  }

  void mouseClicked() {

    if (isActive) {
      isActive = false;
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
  }

  boolean mouseIsHoveringOverButton() {
    return (mouseX >= buttonPosX && mouseX <= buttonPosX + buttonImageWidth) && (mouseY >= buttonPosY && mouseY <= buttonPosY + buttonImageHeight);
  }
}
