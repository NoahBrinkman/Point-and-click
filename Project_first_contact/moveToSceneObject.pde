class MoveToSceneObject extends GameObject {

  private String nextSceneIdentifier;
  private boolean moveBack;
  private boolean quitGameInstead;

  public MoveToSceneObject(String identifier, int x, int y, int owidth, int oheight, boolean moveBack) {
    this(identifier, x, y, owidth, oheight, "", moveBack);
  }

  public MoveToSceneObject(String identifier, int x, int y, int owidth, int oheight, boolean moveBack, boolean quitGame) {
    this(identifier, x, y, owidth, oheight, "", moveBack);
    quitGameInstead = quitGame;
  }

  public MoveToSceneObject(String identifier, int x, int y, int owidth, int oheight, String gameObjectImageFile, boolean moveBack) {
    super(identifier, x, y, owidth, oheight, gameObjectImageFile);
    this.moveBack = moveBack;
  }
  public MoveToSceneObject(String identifier, int x, int y, int owidth, int oheight, String gameObjectImageFile, boolean moveBack, boolean quitGame) {
    super(identifier, x, y, owidth, oheight, gameObjectImageFile);
    this.moveBack = moveBack;
    quitGameInstead = quitGame;
  }

  public MoveToSceneObject(String identifier, int x, int y, int owidth, int oheight, String nextSceneIdentifier) {
    this(identifier, x, y, owidth, oheight, "", nextSceneIdentifier);
  }

  public MoveToSceneObject(String identifier, int x, int y, int owidth, int oheight, String gameObjectImageFile, String nextSceneIdentifier) {
    super(identifier, x, y, owidth, oheight, gameObjectImageFile);
    this.nextSceneIdentifier = nextSceneIdentifier;
    this.moveBack = false;
  }

  @Override
    public void mouseClicked() {
    super.mouseClicked();
    if (super.shouldReturnMouseClick) {
      super.shouldReturnMouseClick = false;
      return;
    }
    if (mouseIsHovering) {
      if (quitGameInstead) {
        exit();
        return;
      }
      soundManager.playSound(soundManager.doorOpenSFX);
      if (moveBack) {
        sceneManager.goToPreviousScene();
      } else {
        try {
          sceneManager.goToScene(nextSceneIdentifier);
        } 
        catch(Exception e) { 
          println(e.getMessage());
        }
      }
    }
  }
}
