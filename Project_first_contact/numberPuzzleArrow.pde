class NumberPuzzleArrow {

  private boolean facingUp;
  private int x1;
  private int x2;
  private int x3;
  private int y1;
  private int y2;
  private int y3;

  private boolean clicked;

  private PShape triangle;

  NumberPuzzleArrow(boolean _facingUp, int _x1, int _y1, int _x2, int _y2, int _x3, int _y3)
  {
    facingUp = _facingUp;
    x1 = _x1;
    y1 = _y1;
    x2 = _x2;
    y2 = _y2;
    x3 = _x3;
    y3 = _y3;

    //create the triangle as PATH type PShape 
    triangle = new PShape(PShape.PATH);
    //add it's vertices
    triangle.vertex(x1, y1);
    triangle.vertex(x2, y2);
    triangle.vertex(x3, y3);
  }

  void update() {
    triangle(x1,y1,x2,y2,x3,y3);
  }

  boolean mouseIsHovering() {
    return triangle.contains(mouseX,mouseY);
  }
}
