class RequireObject extends TextObject {
  private Collectable collectable;
  private GameObject replaceWith;
  boolean unlocked; 
  
  
  RequireObject(String _text, int x, int y, String imageName, int _fontSize, color _fontColor
  , int buttonX, int buttonY, String buttonImageName, int buttonWidth, int buttonHeight, Collectable collectable, GameObject replaceWith) {
    super(_text, x, y, imageName, _fontSize, _fontColor, buttonX,buttonY,buttonImageName,buttonWidth,buttonHeight);
    this.collectable = collectable;
    this.replaceWith = replaceWith;
  }

  @Override
  public void mouseClicked() {
    if(super.mouseIsHoveringOverButton() && inventoryManager.containsCollectable(collectable)) {
      inventoryManager.removeCollectable(collectable);
      sceneManager.getCurrentScene().addGameObject(replaceWith);
      sceneManager.getCurrentScene().removeFromTextObjecs(this);
    } else {
      super.mouseClicked();
    }
  } 
}
