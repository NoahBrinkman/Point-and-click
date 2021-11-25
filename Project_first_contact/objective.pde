class Objective extends ImageInScene {
  
  private PImage completedImage;
  private boolean isComplete;
  private TextObject textObjectToComplete;
  private boolean isFinalObjective;
  
  Objective(String imageName, int x,int y,int imageWidth,int imageHeight,String completedImageName,TextObject textObjectToCompleteRef){
    super(imageName,x,y,imageWidth,imageHeight);
    if(imageName != ""){
      super.imageToLoad = loadImage(imageName); 
    }
    if(completedImageName != ""){
      completedImage = loadImage(completedImageName);
    }
    textObjectToComplete = textObjectToCompleteRef;
  }
  
  @Override 
  Objective getMeIfObjective(){
    return this;
  }
  
  @Override
  void draw(){
    super.draw();
    if(isFinalObjective){
      textObjectToComplete.hasBeenCompletedOnce = false;
    }
    if(textObjectToComplete.hasBeenCompletedOnce){
      isComplete = true;
      super.imageToLoad = completedImage;
    }
  }
  
  
}
