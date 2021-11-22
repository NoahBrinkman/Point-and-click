class TextManager {

  ArrayList<NewTextObject> textObjects;

  NewTextObject currentTextObject;

  TextManager() {
    textObjects = new ArrayList<NewTextObject>();
    currentTextObject = new NewTextObject();
  }

  void draw() {
    if (currentTextObject.text != "") {
      if (currentTextObject.showRect) {
        strokeWeight(4);
        fill(255);
        rect(0, height - 200, width, 200);
      } else {
        image(currentTextObject.textBoxImage, currentTextObject.xPos, currentTextObject.yPos);
      }
      textSize(currentTextObject.fontSize);
      fill(currentTextObject.fontColor);
      text(currentTextObject.text, currentTextObject.xPos, currentTextObject.yPos);
    } else {
      for (NewTextObject textObject : textObjects) {
        if (textObject.isActive) {
          tryDisplayMyText(textObject);
        }
      }
    }
    if (!currentTextObject.isActive) {
      currentTextObject = new NewTextObject();
    }

    for (NewTextObject object : textObjects) {
      object.draw();
    }
  }

  void awake() {
    for (NewTextObject object : textObjects) {
      object.awake();
      if(object.isActive){
        break;
      }
    } 
  }


  void mouseClicked() {
    for (NewTextObject object : textObjects) {
      object.mouseClicked();
    }
  }

  void mouseMoved() {
    for (NewTextObject object : textObjects) {
      object.mouseMoved();
    }
  }
  void tryDisplayMyText(NewTextObject textObject) {
    if (currentTextObject.text != "") {
      return;
    } else {
      if (textObjects.contains(textObject)) {
        currentTextObject = textObject;
      }
    }
  }
}
