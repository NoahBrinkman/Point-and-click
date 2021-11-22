int wwidth = 800;
int wheight = 800;

final SceneManager sceneManager = new SceneManager();
final InventoryManager inventoryManager = new InventoryManager();

float deltaTime = 0.0f;

void settings()
{
  size(wwidth, wheight);
}

void setup()
{
  Collectable apple = new Collectable("apple", "back04_apple.png");
  MoveToSceneObject object7 = new MoveToSceneObject("goToScene04_scene01", 206, 461, 50, 50, "arrowUp.png", "scene04");
  
  Scene scene01 = new Scene("scene01", "back01.png");
  RequireObject loupe01 = new RequireObject("requiresApple_scene01", 206, 461, 50, 50, "zoom.png", "You need an Apple before getting here!", apple, object7);
  loupe01.setHoverImage("zoomIn.png");
  scene01.addGameObject(loupe01);
  MultiPartTextObject loupe02 = new MultiPartTextObject("smallText_scene01", 541, 445, 50, 50, "zoom.png", "This object @has a text!@I can split it@Without it crashing");
  loupe02.setHoverImage("zoomIn.png");
  scene01.addGameObject(loupe02);
  TextObject loupe03 = new TextObject("largeText_scene01", 46, 687, 50, 50, "zoom.png", "This object has a way longer text. It shows that the windows can be of varied size according to the text.");
  loupe03.setHoverImage("zoomIn.png");
  scene01.addGameObject(loupe03);
  MoveToSceneObject object2 = new MoveToSceneObject("goToScene02_scene01", 708, 445, 50, 50, "arrowRight.png", "scene02");
  scene01.addGameObject(object2);
  MoveToSceneObject restaurantSceneMoveTo = new MoveToSceneObject("goToScene06_scene01", 388, 440, 50, 50, "arrowUp.png", "scene05");
  scene01.addGameObject(restaurantSceneMoveTo);
  multiPartScrollingTextObject loupe04 = new multiPartScrollingTextObject("smallText_scene04", 300, 200, 50, 50, "zoom.png", " This object has a text! @ I can split it without it crashing. Now this is going to take some time to fix because it doesn't want to work apparently, how is it going? @ Idk, how's it going with you?", 0.01f);
  loupe04.setHoverImage("zoomIn.png");
  scene01.addGameObject(loupe04);

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
  NumberPuzzle puzzle = new NumberPuzzle("numberPuzzle01",100, height / 2, 100,100, "scene06",1013);
  scene05.gameObjects.add(puzzle);
  
  Scene scene06 = new Scene("scene06","back06.png");
  MoveToSceneObject object9 = new MoveToSceneObject("goBack_scene06", 350, 700, 50, 50, "arrowDown.png", true);
  scene06.addGameObject(object9);
  
  sceneManager.addScene(scene01);
  sceneManager.addScene(scene02);
  sceneManager.addScene(scene03);
  sceneManager.addScene(scene04);
  sceneManager.addScene(scene05);
  sceneManager.addScene(scene06);
}

void draw()
{
  deltaTime = 1 / frameRate;
  sceneManager.getCurrentScene().draw(wwidth, wheight);
  sceneManager.getCurrentScene().updateScene();
  inventoryManager.clearMarkedForDeathCollectables();
}

void mouseMoved() {
  sceneManager.getCurrentScene().mouseMoved();
}

void mouseClicked() {
  sceneManager.getCurrentScene().mouseClicked();
}
