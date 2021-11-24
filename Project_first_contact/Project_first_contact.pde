import processing.sound.*;

int wwidth = 800;
int wheight = 800;

final SceneManager sceneManager = new SceneManager();
final InventoryManager inventoryManager = new InventoryManager();

float deltaTime = 0.0f;

private UIManager uIManager = new UIManager();

SoundManager soundManager;

void settings()
{
  size(wwidth, wheight);
}

void setup()
{
  textFont(createFont("filetto.ttf", 128));

  Scene mainMenuScene = new Scene("mainMenu", "bedRoom.png");
  ImageInScene ghost = new ImageInScene("ghost.png", 400, height / 2 - 250, 500, 500);
  MoveToSceneObject startGame = new MoveToSceneObject("startButton", width / 2 - 125, height /2, 250, 75, "startButton.png", "startScene");
  startGame.dontPlaySound();
  MoveToSceneObject quitGame = new MoveToSceneObject("quitButton", width / 2 -125, height /2 + 100, 250, 75, "quitButton.png", true, true);
  mainMenuScene.addImage(ghost);
  mainMenuScene.addGameObject(quitGame);
  mainMenuScene.addGameObject(startGame);
  mainMenuScene.useUI = false;

  Scene startScene = new Scene("startScene", "blackground.png");
  startScene.useUI = false;
  soundManager = new SoundManager();



  MultiPartScrollingTextObject scrollingObjectForStart = new MultiPartScrollingTextObject("*There is nothing. Only a warm darkness and this deep feeling of regret*@*An inordinate amount of time passes as you still feel nothing*@*Suddenly, an awareness creeps up on you*", 
    width / 2 - 250, height / 2, "", 17, color(255), 0.03f);
  scrollingObjectForStart.loadOnAwake();
  scrollingObjectForStart.loadSceneOnComplete("bedRoom");
  scrollingObjectForStart.dontshowRect();
  startScene.addTextObject(scrollingObjectForStart);

  Scene bedRoomScene = new Scene("bedRoom", "bedRoom.png");
  MultiPartScrollingTextObject roomIntro = new MultiPartScrollingTextObject("*As you open your eyes you find yourself in a nostalgic place.\nSomewhere where you’ve once felt love, hate, fear, disgust, anger\nand, most importantly, regret*@*While you look around trying to recognize this place, you see a body. Lying in bed. Lifeless*", 
    width / 2 - 250, height -120, "", 17, color(255), 0.02f);
  roomIntro.loadOnAwake();

  MultiPartScrollingTextObject bodyInteraction = new MultiPartScrollingTextObject("*Moving closer to the body you start recognizing its sad appearance.\nIts curly grey hair, the lifeless blue eyes looking at the void and its moustache.\nIts burly moustache.*@“Is that me?”\n“Am I…\nDEAD?!”@*You keep looking at the body, searching for any signs of life*@*Now it only looks like a lifeless blob to you*@“I’m not ready.\nI don’t want to go.\nNot without saying goodbye.”@*You move away from the body. As if you’re scared of it. Scared of yourself*", 
    width / 2 - 250, height -110, "", 17, color(255), 150, 520, "speechBubble.png", 100, 75, 0.01f);
  bedRoomScene.addTextObject(bodyInteraction);
  MultiPartScrollingTextObject nightStandInteraction = new MultiPartScrollingTextObject("*On top of your nightstand you see a photo of two people*\n(Lead To nightstandScene remove this line when its implemented)", width / 2 - 250, height -110, "", 17, color(255), 550, 450, "zoom.png", 100, 70, 0.01f);
  MultiPartScrollingTextObject wardrobeInteraction = new MultiPartScrollingTextObject("*You open the wardrobe@You see your clothes@\"To be honest, I don't know why I opened the wardrobe, there is nothing here...\"", width / 2 - 250, height -110, "", 17, color(255), 350, 280, "speechBubble.png", 100, 200, 0.01f);
  MoveToSceneObject toLivingRoom = new MoveToSceneObject("moveToLivingRoom", 430, 600, 50, 50, "arrowRight.png", "livingRoom");
  MultiPartScrollingTextObject objectivetest = new MultiPartScrollingTextObject("This here exists to test out if Objective works", width / 2 - 250, height -110, "", 15, color(255), 500, 500, "zoom.png", 50, 50, 0.01f, "pet dog");
  //bodyInteraction.loadSceneOnComplete("nightStand");
  //Objective objective = new Objective("", width-100, 100);
  //uIManager.addToUI(objective);
  bedRoomScene.addGameObject(toLivingRoom);
  bedRoomScene.addTextObject(nightStandInteraction);
  bedRoomScene.addTextObject(wardrobeInteraction);
  bedRoomScene.addTextObject(objectivetest);
  bedRoomScene.addTextObject(roomIntro);

  Scene livingRoomScene = new Scene("livingRoom", "livingRoom.png");
  MoveToSceneObject toBedRoom = new MoveToSceneObject("moveToBedRoom", 650, 420, 50, 50, "arrowUp.png", "bedRoom");
  livingRoomScene.addGameObject(toBedRoom);
  MoveToSceneObject tostudyRoom = new MoveToSceneObject("moveTostudyRoom", 750, 500, 50, 50, "arrowRight.png", "studyRoom");
  livingRoomScene.addGameObject(tostudyRoom);
  MultiPartScrollingTextObject couch = new MultiPartScrollingTextObject("*Looking around, you see your classy old couch*@“The only place where I would routinely spend time with family”@“If you could call that “spending time with family”, I mean. We just sat on the sofa watching TV.\nCompletely silent, practically not interacting at all”", 
    width / 2 - 120, height -120, "", 17, color(255), 90, 450, "speechBubble.png", 190, 120, 0.01f);
  livingRoomScene.addTextObject(couch);
  MoveToSceneObject toGarden = new MoveToSceneObject("moveToGarden", 215, 600, 50, 50, "arrowLeft.png", "garden");

  Scene studyRoomScene = new Scene("studyRoom", "studyRoom.png");
  MoveToSceneObject tolivingRoomFromStudy = new MoveToSceneObject("moveTolivingRoom", 200, 650, 50, 50, "arrowLeft.png", true);

  Collectable keyToGarden = new Collectable("keyToGarden", "key.png");
  CollectableObject keyToGardenObject = new CollectableObject("KeyObject", 320, 380, 100, 50, keyToGarden);

  MultiPartScrollingTextObject desk = new MultiPartScrollingTextObject("*You see the chair you used to sit on for hours on end, working*@*You hate that you loved being here*@*Suddenly you’re reminded of something*@“I need that photo. It was here somewhere. I remember”@*You feel an urge to find an old photo of you with your family*", 
    width / 2 - 120, height -120, "", 17, color(255), 220, 420, "speechBubble.png", 50, 50, 0.01f);

  MultiPartScrollingTextObject moveToLockFromStudy = new MultiPartScrollingTextObject("“Crap! It’s locked!”", width / 2 - 120, height -120, "", 17, color(255), 470, 400, "speechBubble.png", 50, 50, 0.01f);
  moveToLockFromStudy.loadSceneOnComplete("numberLock");

  studyRoomScene.addTextObject(moveToLockFromStudy);
  studyRoomScene.addTextObject(desk);
  //studyRoomScene.addTextObject(cabinet);
  studyRoomScene.addGameObject(keyToGardenObject);
  studyRoomScene.addGameObject(tolivingRoomFromStudy);

  Scene numberLockScene = new Scene("numberLock", "lock.png");
  NumberPuzzle puzzle = new NumberPuzzle("numberPuzzle", 402, 575, 10, 150, "openCabinet", 1013);
  numberLockScene.addGameObject(puzzle);
  MoveToSceneObject goBackToStudy =  new MoveToSceneObject("backAwayFromCabinet", width / 2 - 50, height - 75, 50, 50, "arrowDown.png", true);
  numberLockScene.addGameObject(goBackToStudy);

  RequireObject gardenLock = new RequireObject("“It’s locked. Where did I store the key?”", 
    width / 2 - 120, height -120, "", 17, color(255), 215, 600, "zoom.png", 50, 50, keyToGarden, toGarden);
  livingRoomScene.addTextObject(gardenLock);

  Scene cabinetScene = new Scene("openCabinet", "cabinet.png");
  MoveToSceneObject goBackToStudyOpenCabinet =  new MoveToSceneObject("backAwayFromOpenCabinet", width / 2 - 50, height - 75, 50, 50, "arrowDown.png", true);
  goBackToStudyOpenCabinet.dontPlaySound();
  cabinetScene.addGameObject(goBackToStudyOpenCabinet);

  Scene gardenScene = new Scene("garden", "garden.png");
  MoveToSceneObject gardenToLivingRoom = new MoveToSceneObject("moveToLivingRoomFromGarden", 700, 450, 50, 50, "arrowRight.png", true);
  MultiPartScrollingTextObject pet_dog = new MultiPartScrollingTextObject("*It’s where your dog, Chip, used to sleep in \nwhenever he wasn’t persuading you to let him sleep in your bed together with “mommy” and “daddy”* @*There he lies. Sleeping peacefully* @“You were the only one that loved me unconditionally”@“Despite all the mistakes I made, you still looked at me the same way you did that first time we met” @*You pause for a bit. Reminiscing about something* @“I still remember my kid running inside with you in his arms and crying for me and mommy to let you stay” @“I’m glad I made the right decision” @->Pet your dog<- @“I’m going to miss you, Chip” @**You feel a little lighter**  ", 
    width / 2 - 120, height -120, "", 17, color(255), 400, 430, "speechBubble.png", 190, 120, 0.01f);
  MultiPartScrollingTextObject tree = new MultiPartScrollingTextObject("*The old tree and the swing were meant for your son* @“I worked on the swing for the whole summer. Yet, ended up giving up and using a good old tire” @*You laugh to yourself* @“So much work and we used it so little…” ", 
    width / 2 - 120, height -120, "", 17, color(255), 110, 490, "speechBubble.png", 190, 120, 0.01f);
  gardenScene.addTextObject(pet_dog);
  gardenScene.addTextObject(tree);
  gardenScene.addGameObject(gardenToLivingRoom);

  sceneManager.addScene(mainMenuScene);
  sceneManager.addScene(startScene);
  sceneManager.addScene(bedRoomScene);
  sceneManager.addScene(livingRoomScene);
  sceneManager.addScene(studyRoomScene);
  sceneManager.addScene(numberLockScene);
  sceneManager.addScene(cabinetScene);
  sceneManager.addScene(gardenScene);
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
