class Objective extends ImageInScene {
  
  PImage completedImage;
  boolean isComplete;
  TextObject textObjectToComplete;
  
  
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
  void draw(){
    super.draw();
    if(textObjectToComplete.hasBeenCompletedOnce){
      isComplete = true;
      super.imageToLoad = completedImage;
    }
  }
  
  
}
