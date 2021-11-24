class NumberAndArrows {

  int currentNumber;
  NumberPuzzleArrow upArrow;
  NumberPuzzleArrow downArrow;

  int xPosition;
  int yPosition;

  NumberAndArrows(int _startNumber, NumberPuzzleArrow _upArrow, NumberPuzzleArrow _downArrow, int x, int y) {
    currentNumber = _startNumber;
    upArrow = _upArrow;
    downArrow = _downArrow;
    xPosition = x;
    yPosition = y;
  }

  void update() {
    textSize(50);
    text(currentNumber, xPosition, yPosition);
    textSize(17);
    upArrow.update();
    downArrow.update();
  }
  void mouseClicked() {
    if (upArrow.mouseIsHovering()) {
      if (currentNumber == 9) {
        currentNumber = 0;
      } else {
        currentNumber++;
      }
    }
    if (downArrow.mouseIsHovering()) {
      if (currentNumber == 0) {
        currentNumber = 9;
      } else {
        currentNumber--;
      }
    }
  }
}
