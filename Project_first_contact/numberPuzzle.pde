class NumberPuzzle extends MoveToSceneObject {

  private int solution;
  private  boolean isSolved = false;

  private ArrayList<NumberAndArrows> numbersWithArrows = new ArrayList<NumberAndArrows>();

  private String sceneToLoad;

  NumberPuzzle(String identifier, int x, int y, int owidth, int oheight, String nextSceneIdentifier, int puzzleSolution) {
    super(identifier, x, y, owidth, oheight, nextSceneIdentifier);
    solution = puzzleSolution;
    for (int i = 0; i < String.valueOf(solution).length(); i++) {
      NumberPuzzleArrow upArrow = new NumberPuzzleArrow(true, x + (i * 45), y - 45, x + (i * 45)+ 25, y - 45, x + (i * 45)+ 12, y - 60);
      NumberPuzzleArrow downArrow = new NumberPuzzleArrow(false, x + (i * 45), y + 10, x + (i * 45)+ 25, y + 10, x + (i * 45)+ 12, y + 25);
      NumberAndArrows number = new NumberAndArrows(0, upArrow, downArrow, x + (i * 44), y);
      numbersWithArrows.add(number);
      sceneToLoad = nextSceneIdentifier;
    }
  }

  @Override
    void awake() {
    super.awake();
    if (isSolved) {
      sceneManager.goToPreviousScene();
      try {
        sceneManager.goToScene(sceneToLoad);
      } 
      catch(Exception e) { 
        println(e.getMessage());
      }
    }
  }

  @Override
    void draw() {
    super.draw();
    String solutionAttempt = "";
    fill(255);
    for (int i = 0; i < numbersWithArrows.size(); i++) {
      numbersWithArrows.get(i).update();
      solutionAttempt += numbersWithArrows.get(i).currentNumber;
    }
    if (Integer.valueOf(solutionAttempt) == solution) {
      sceneManager.goToPreviousScene();
      isSolved = true;
      try {
        sceneManager.goToScene(sceneToLoad);
      } 
      catch(Exception e) { 
        println(e.getMessage());
      }
    }
  }

  @Override
    void mouseClicked() {
    for (int i = 0; i < numbersWithArrows.size(); i++) {
      numbersWithArrows.get(i).mouseClicked();
    }
  }
}
