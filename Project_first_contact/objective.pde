class Objective extends TextObject {
  PImage image;
  String imageText;
  int xPosition;
  int yPosition;
  String objectivetoComplete;

  Objective(String _text, int x, int y) {
    //you absolutely NEED to have every parameter of TextObject in this constructor otherwise a fuck ton of errors pop up
    //fix this
    xPosition = x;
    yPosition = y;
    if (_text != "") image = loadImage(_text);
    imageText = _text;
  }
  @Override
    void draw() {
    super.draw();
    image(image, xPosition, yPosition);
  }

  void completeObjective(String objectiveToComplete) {
    if (objectiveToComplete == "pet dog") {
      image = loadImage(imageText.split(".png")[0] + "_crossedout.png");
    }
  }
}
