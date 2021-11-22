class UIManager {

  private ArrayList<NewTextObject> uIElements = new ArrayList<NewTextObject>();


  void addToUI(NewTextObject object) {
    uIElements.add(object);
  }

  void awake() {
    for (NewTextObject textObject : uIElements) {
      textObject.isActive = true;
    }
  }
  void draw() {
    for (NewTextObject textObject : uIElements) {
      textSize(textObject.fontSize);
      fill(textObject.fontColor);
      text(textObject.text, textObject.xPos, textObject.yPos);
    }
  }
}
