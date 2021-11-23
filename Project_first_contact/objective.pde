class Objective extends TextObject {
  PImage image;
  String imageText;
  int xPosition;
  int yPosition;
  String objectivetoComplete;

  Objective(String _text, int x, int y) {
    xPosition = x;
    yPosition = y;
    image = loadImage(_text);
    imageText = _text;
  }
  @Override
    void draw() {
    super.draw();
    image(image,xPosition,yPosition);
      }
  
  void completeObjective(String objectiveToComplete) {
    if(objectiveToComplete == "pet dog") {
    image = loadImage(imageText.split(".png")[0] + "_crossedout.png");
  }
  }
}
