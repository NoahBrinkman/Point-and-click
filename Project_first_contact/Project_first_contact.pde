int wwidth = 800;
int wheight = 800;

final SceneManager sceneManager = new SceneManager();
final InventoryManager inventoryManager = new InventoryManager();

float deltaTime = 0.0f;

private UIManager uIManager = new UIManager();

void settings()
{
  size(wwidth, wheight);
}

void setup()
{

  NewTextObject objectives = new NewTextObject("Objectives:\n0/1 Pet your dog\n0/1Collect a family pitcure\n0/1Say goodbye.", width - 225, 50, "", 15, color(255));
  uIManager.addToUI(objectives);
  Collectable apple = new Collectable("apple", "back04_apple.png");
  MoveToSceneObject object7 = new MoveToSceneObject("goToScene04_scene01", 206, 461, 50, 50, "arrowUp.png", "scene04");

  Scene scene01 = new Scene("scene01", "back01.png");
  RequireObject loupe01 = new RequireObject("You need an apple to get in here",  width / 2 - (int)textWidth("You need an apple to get in here") / 2, height - 100, "", 12, color(0),  206, 461,"zoom.png", 50, 50, apple, object7);
  loupe01.setHoverImage("zoomIn.png");
  scene01.addTextObjecs(loupe01);
  MultiPartTextObject loupe02 = new MultiPartTextObject("smallText_scene01", 541, 445, 50, 50, "zoom.png", "This object @has a text!@I can split it@Without it crashing");
  loupe02.setHoverImage("zoomIn.png");
  scene01.addGameObject(loupe02);
  NewMultiPartTextObject loupe03 = new NewMultiPartTextObject("This is a test@I can split it@Without it crashing", width / 2 - (int)textWidth("This is a test") / 2, height - 100, "", 12, color(0), 46, 687, "zoom.png", 50, 50);

  scene01.addTextObjecs(loupe03);
  NewMultiPartScrollingTextObject loupe04 = new NewMultiPartScrollingTextObject("This is also a test@I should be able@ To split it while it scrolls", width / 2 - (int)textWidth("This is also a test") / 2, height - 100, "", 12, color(0), 46, 487, "zoom.png", 50, 50, 0.01f);
  scene01.addTextObjecs(loupe04);
  loupe04.loadOnAwake();
  MoveToSceneObject object2 = new MoveToSceneObject("goToScene02_scene01", 708, 445, 50, 50, "arrowRight.png", "scene02");
  scene01.addGameObject(object2);
  MoveToSceneObject restaurantSceneMoveTo = new MoveToSceneObject("goToScene06_scene01", 388, 440, 50, 50, "arrowUp.png", "scene05");
  scene01.addGameObject(restaurantSceneMoveTo);

  Scene scene02 = new Scene("scene02", "back02.png");
  MoveToSceneObject object3 = new MoveToSceneObject("goBack_scene02", 350, 700, 50, 50, "arrowDown.png", true);
  scene02.addGameObject(object3);
  MoveToSceneObject object4 = new MoveToSceneObject("goToScene03_scene02", 441, 494, 50, 50, "arrowUp.png", "scene03");
  scene02.addGameObject(object4);

  Scene scene03 = new Scene("scene03", "back04.png");
  MoveToSceneObject object5 = new MoveToSceneObject("goBack_scene03", 203, 673, 50, 50, "arrowDown.png", true);
  scene03.addGameObject(object5);
  CollectableObject object6 = new CollectableObject("apple_scene03", 325, 366, 123, 101, apple);
  scene03.addGameObject(object6);

  Scene scene04 = new Scene("scene04", "back03.png");
  ScrollingTextObject endGame = new ScrollingTextObject("smallText_scene04", 430, 590, 50, 50, "medal1.png", "'This is a filler text to find out how big we can get a singular string \n I am also testing how line breaks work \n and now im checking if it works multiple times \n even if i use a lot of them wnt think we're going to be using a literal buttload of characters i wanna see if the textarea will want to perish'", 0.01f);
  scene04.addGameObject(endGame);

  Scene scene05 = new Scene("scene05", "back05.png");
  NumberPuzzle puzzle = new NumberPuzzle("numberPuzzle01", 100, height / 2, 100, 100, "scene06", 1013);
  scene05.gameObjects.add(puzzle);

  Scene scene06 = new Scene("scene06", "back06.png");
  MoveToSceneObject object9 = new MoveToSceneObject("goBack_scene06", 350, 700, 50, 50, "arrowDown.png", true);
  scene06.addGameObject(object9);

  sceneManager.addScene(scene01);
  sceneManager.addScene(scene02);
  sceneManager.addScene(scene03);
  sceneManager.addScene(scene04);
  sceneManager.addScene(scene05);
  sceneManager.addScene(scene06);
  sceneManager.getCurrentScene().awake();
  uIManager.awake();
}

void draw()
{
  deltaTime = 1 / frameRate;
  sceneManager.getCurrentScene().draw(wwidth, wheight);
  sceneManager.getCurrentScene().updateScene();
  inventoryManager.clearMarkedForDeathCollectables();
  uIManager.draw();
}

void mouseMoved() {
  sceneManager.getCurrentScene().mouseMoved();
}

void mouseClicked() {
  sceneManager.getCurrentScene().mouseClicked();
}
