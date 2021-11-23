class TextManager {

  ArrayList<TextObject> textObjects;
  ArrayList<TextObject> markedForDeathTextObjects;
  TextObject currentTextObject;
  boolean otherTextIsAlreadyActive;
  
  
  TextManager() {
    textObjects = new ArrayList<TextObject>();
    markedForDeathTextObjects = new ArrayList<TextObject>();
    currentTextObject = new TextObject();
  }

  void draw() {
    if (currentTextObject.text != "") {
      otherTextIsAlreadyActive = true;
      if (currentTextObject.showRect) {
        strokeWeight(4);
        fill(255);
        rect(0, height - 200, width, 200);
      } else {
        if(currentTextObject.textBoxImageName != "") image(currentTextObject.textBoxImage, currentTextObject.xPos, currentTextObject.yPos);
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
    for(int i = 0; i < markedForDeathTextObjects.size(); i++){
      if(textObjects.contains(markedForDeathTextObjects.get(i))){
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
