class UIManager {

  private ArrayList<TextObject> uITexts = new ArrayList<TextObject>();
   private ArrayList<ImageInScene> uIImages = new ArrayList<ImageInScene>();

  void addToUI(TextObject object) {
    uITexts.add(object);
  }
    void addToUI(ImageInScene object) {
    uIImages.add(object);
  }
  
  void awake() {
    for (TextObject textObject : uITexts) {
      textObject.isActive = true;
    }
  }
  void draw() {
    if(!sceneManager.getCurrentScene().useUI) return;
    
    for (TextObject textObject : uITexts) {
      textSize(textObject.fontSize);
      fill(textObject.fontColor);
      text(textObject.text, textObject.xPos, textObject.yPos);
    }
    for(ImageInScene image : uIImages){
      image.draw();
    }
    
  }
}
