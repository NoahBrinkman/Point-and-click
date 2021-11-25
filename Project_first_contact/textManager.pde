class TextManager {

  private ArrayList<TextObject> textObjects;
  private ArrayList<TextObject> markedForDeathTextObjects;
  private TextObject currentTextObject;
  private boolean otherTextIsAlreadyActive;


  TextManager() {
    textObjects = new ArrayList<TextObject>();
    markedForDeathTextObjects = new ArrayList<TextObject>();
    currentTextObject = new TextObject();
  }
    boolean useArrow;
  void draw() {
    useArrow = true;
    if (currentTextObject.text != "") {
      otherTextIsAlreadyActive = true;
      if (currentTextObject.showRect) {
        stroke(255);
        strokeWeight(4);
        fill(0);
        rect(0, height - 200, width, 200, 8);
      } else {
        if (currentTextObject.textBoxImageName != "") image(currentTextObject.textBoxImage, currentTextObject.xPos, currentTextObject.yPos);
      }
      textSize(currentTextObject.fontSize);
      fill(currentTextObject.fontColor);
      text(currentTextObject.text, currentTextObject.xPos, currentTextObject.yPos);
    } else {
      otherTextIsAlreadyActive = false;
      for (TextObject textObject : textObjects) {
        if (textObject.isActive) {
          tryDisplayMyText(textObject);
        }
      }
    }
    if (!currentTextObject.isActive) {
      currentTextObject = new TextObject();
    }


    for (TextObject object : textObjects) {
      object.draw();
    }

    wipeMarkedForDeath();
    

    for (int i = 0; i < textObjects.size(); i ++) {
      if (textObjects.get(i).mouseIsHoveringOverButton && textObjects.get(i).useButton) {
        cursor(textObjects.get(i).cursorImage);
        useArrow = false;
        break;
      } else{
        useArrow = true;
      }
    }
    if(useArrow){
      cursor(ARROW);
    }
  }

  void awake() {
    for (TextObject object : textObjects) {
      object.awake();
      if (object.isActive) {
        break;
      }
    }
  }

  void wipeMarkedForDeath() {
    for (int i = 0; i < markedForDeathTextObjects.size(); i++) {
      if (textObjects.contains(markedForDeathTextObjects.get(i))) {
        markedForDeathTextObjects.get(i).isActive = false;
        textObjects.remove(textObjects.indexOf(markedForDeathTextObjects.get(i)));
      }
    }
    markedForDeathTextObjects = new ArrayList<TextObject>();
  }

  void mouseClicked() {
    for (TextObject object : textObjects) {
      object.mouseClicked();
    }
  }

  void mouseMoved() {
    for (TextObject object : textObjects) {
      object.mouseMoved();
    }
  }
  void tryDisplayMyText(TextObject textObject) {
    if (currentTextObject.text != "") {
      return;
    } else {
      if (textObjects.contains(textObject)) {
        currentTextObject = textObject;
      }
    }
  }
}
