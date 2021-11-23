class UIManager {

  private ArrayList<TextObject> uIElements = new ArrayList<TextObject>();


  void addToUI(TextObject object) {
    uIElements.add(object);
  }

  void awake() {
    for (TextObject textObject : uIElements) {
      textObject.isActive = true;
    }
  }
  void draw() {
    for (TextObject textObject : uIElements) {
      textSize(textObject.fontSize);
      fill(textObject.fontColor);
      text(textObject.text, textObject.xPos, textObject.yPos);
    }
  }
}
