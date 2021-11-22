class Scene {
  private String sceneName;
  private PImage backgroundImage;
  private ArrayList<GameObject> gameObjects;

  private ArrayList<GameObject> recentlyAddedGameObjects;
  private ArrayList<GameObject> markedForDeathGameObjects;

  private TextManager textManager;
  
  public boolean useUI;
  
  public Scene(String sceneName, String backgroundImageFile) {
    useUI = true;
    this.sceneName = sceneName;
    this.backgroundImage = loadImage(backgroundImageFile);
    gameObjects = new ArrayList<GameObject>();
    markedForDeathGameObjects = new ArrayList<GameObject>();
    recentlyAddedGameObjects = new ArrayList<GameObject>();
    textManager = new TextManager();
  }

  public void addTextObjecs(NewTextObject object) {
    textManager.textObjects.add(object);
  }
  
    public void removeFromTextObjecs(NewTextObject object) {
    textManager.markedForDeathTextObjects.add(object);
  }
  
  public void addGameObject(GameObject object) {
    recentlyAddedGameObjects.add(object);
  }

  public void removeGameObject(GameObject object) {
    markedForDeathGameObjects.add(object);
  }

  public void awake() {
    for (GameObject object : recentlyAddedGameObjects) { 
      object.awake();
    }
    textManager.awake();
  }
  public void updateScene() {
    if (markedForDeathGameObjects.size() > 0) {
      for (GameObject object : markedForDeathGameObjects) {
        gameObjects.remove(object);
      }
      markedForDeathGameObjects  = new ArrayList<GameObject>();
    }
    if (recentlyAddedGameObjects.size() > 0) {
      for (GameObject object : recentlyAddedGameObjects) {
        gameObjects.add(object);
      }
      recentlyAddedGameObjects  = new ArrayList<GameObject>();
    }
  }

  public void draw(int wwidth, int wheight) {
    image(backgroundImage, 0, 0, wwidth, wheight);
    for (GameObject object : gameObjects) {
      object.draw();
    }
    textManager.draw();
  }

  public void mouseMoved() {
    for (GameObject object : gameObjects) {
      object.mouseMoved();
    }
     textManager.mouseMoved();
  }

  public void mouseClicked() {
    for (GameObject object : gameObjects) {
      object.mouseClicked();
    }
    textManager.mouseClicked();
  }

  public String getSceneName() {
    return this.sceneName;
  }
}
