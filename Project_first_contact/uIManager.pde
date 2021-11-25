class UIManager {

  private ArrayList<TextObject> uITexts = new ArrayList<TextObject>();
  private ArrayList<ImageInScene> uIImages = new ArrayList<ImageInScene>();
  private boolean allOtherObjectivesComplete;

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
    if (!sceneManager.getCurrentScene().useUI) return;

    for (TextObject textObject : uITexts) {
      textSize(textObject.fontSize);
      fill(textObject.fontColor);
      text(textObject.text, textObject.xPos, textObject.yPos);
    }
    for (ImageInScene image : uIImages) {
      image.draw();
    }
  }

  boolean allObjectivesButFinalComplete() {
    boolean allObjectivesComplete = true;
    ArrayList<Objective> objectives = new ArrayList<Objective>();
    for (ImageInScene imageInScene : uIImages) {
      //Objective reference = imageInScene.get
      Objective referenceObjective= imageInScene.getMeIfObjective();
      if (referenceObjective != null) {
        objectives.add(referenceObjective);
      }
    }
    for (Objective objective : objectives) {
      if (!objective.isComplete && !objective.isFinalObjective) {
        allObjectivesComplete = false;
      }
    }

    return allObjectivesComplete;
  }
}
