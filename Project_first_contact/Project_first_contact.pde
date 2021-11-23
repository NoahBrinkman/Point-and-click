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
  Scene startScene = new Scene("startScene", "blackground.png");
  startScene.useUI = false;
  
  MultiPartScrollingTextObject scrollingObjectForStart = new MultiPartScrollingTextObject("*There is nothing. Only a warm darkness and this deep feeling of regret*@*An inordinate amount of time passes as you still feel nothing*@*Suddenly, an awareness creeps up on you*", 
    width / 2 - 250, height / 2, "", 15, color(255), 0.03f);
  scrollingObjectForStart.loadOnAwake();
  scrollingObjectForStart.loadSceneOnComplete("bedRoom");
  scrollingObjectForStart.dontshowRect();
  startScene.addTextObjecs(scrollingObjectForStart);

  Scene bedRoomScene = new Scene("bedRoom", "bedRoom.png");
  MultiPartScrollingTextObject roomIntro = new MultiPartScrollingTextObject("*As you open your eyes you find yourself in a nostalgic place.\nSomewhere where you’ve once felt love, hate, fear, disgust, anger\nand, most importantly, regret*@*While you look around trying to recognize this place, you see a body. Lying in bed. Lifeless*", 
    width / 2 - 250, height -120, "", 15, color(0), 0.02f);
  roomIntro.loadOnAwake();

  MultiPartScrollingTextObject bodyInteraction = new MultiPartScrollingTextObject("*Moving closer to the body you start recognizing its sad appearance.\nIts curly grey hair, the lifeless blue eyes looking at the void and its moustache.\nIts burly moustache.*@“Is that me?”\n“Am I…\nDEAD?!”@*You keep looking at the body, searching for any signs of life*@*Now it only looks like a lifeless blob to you*@“I’m not ready.\nI don’t want to go.\nNot without saying goodbye.”@*You move away from the body. As if you’re scared of it. Scared of yourself*", 
    width / 2 - 250, height -110, "", 15, color(0), 150, 520, "zoom.png", 100, 75, 0.01f);
  bedRoomScene.addTextObjecs(bodyInteraction);
  MultiPartScrollingTextObject nightStandInteraction = new MultiPartScrollingTextObject("*On top of your nightstand you see a photo of two people*\n(Lead To nightstandScene remove this line when its implemented)", width / 2 - 250, height -110, "", 15, color(0), 550, 450, "zoom.png", 100, 70, 0.01f);
  MultiPartScrollingTextObject wardrobeInteraction = new MultiPartScrollingTextObject("*You open the wardrobe@You see your clothes@\"To be honest, I don't know why I opened the wardrobe, there is nothing here...\"", width / 2 - 250, height -110, "", 15, color(0), 375, 340, "zoom.png", 50, 50, 0.01f);
  MoveToSceneObject toLivingRoom = new MoveToSceneObject("moveToLivingRoom", 330, 690, 50, 50, "arrowLeft.png", "livingRoom");

  //bodyInteraction.loadSceneOnComplete("nightStand");
  bedRoomScene.addGameObject(toLivingRoom);
  bedRoomScene.addTextObjecs(nightStandInteraction);
  bedRoomScene.addTextObjecs(wardrobeInteraction);
  bedRoomScene.addTextObjecs(roomIntro);

  Scene livingRoomScene = new Scene("livingRoom", "livingRoom.png");
  MoveToSceneObject toBedRoom = new MoveToSceneObject("moveToBedRoom", 650, 420, 50, 50, "arrowUp.png", "bedRoom");
  livingRoomScene.addGameObject(toBedRoom);
  MoveToSceneObject tostudyRoom = new MoveToSceneObject("moveToBedRoom", 750, 500, 50, 50, "arrowRight.png", "studyRoom");
  livingRoomScene.addGameObject(tostudyRoom);

  Scene studyRoomScene = new Scene("studyRoom", "studyRoom.png");
  MoveToSceneObject tolivingRoomFromStudy = new MoveToSceneObject("moveTolivingRoom", 200, 650, 50, 50, "arrowLeft.png", true);
  studyRoomScene.addGameObject(tolivingRoomFromStudy);
  /*
  NewTextObject objectives = new NewTextObject("Objectives:\n0/1 Pet your dog\n0/1Collect a family pitcure\n0/1Say goodbye.", width - 225, 50, "", 15, color(255));
   uIManager.addToUI(objectives);
   Collectable apple = new Collectable("apple", "back04_apple.png");
   MoveToSceneObject object7 = new MoveToSceneObject("goToScene04_scene01", 206, 461, 50, 50, "arrowUp.png", "scene04");
   
   Scene scene01 = new Scene("scene01", "back01.png");
   RequireObject loupe01 = new RequireObject("You need an apple to get in here", width / 2 - (int)textWidth("You need an apple to get in here") / 2, height - 100, "", 12, color(0), 206, 461, "zoom.png", 50, 50, apple, object7);
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
   
   sceneManager.addScene(startScene);
   sceneManager.addScene(scene01);
   sceneManager.addScene(scene02);
   sceneManager.addScene(scene03);
   sceneManager.addScene(scene04);
   sceneManager.addScene(scene05);
   sceneManager.addScene(scene06);
   */
  sceneManager.addScene(startScene);
  sceneManager.addScene(bedRoomScene);
  sceneManager.addScene(livingRoomScene);
  sceneManager.addScene(studyRoomScene);
  sceneManager.getCurrentScene().awake();
  uIManager.awake();
}

void draw()
{
  deltaTime = 1 / frameRate;
  sceneManager.getCurrentScene().draw(wwidth, wheight);
  sceneManager.getCurrentScene().updateScene();
  inventoryManager.clearMarkedForDeathCollectables();
  if (sceneManager.getCurrentScene().useUI) {
    uIManager.draw();
  }
}

void mouseMoved() {
  sceneManager.getCurrentScene().mouseMoved();
}

void mouseClicked() {
  sceneManager.getCurrentScene().mouseClicked();
}
