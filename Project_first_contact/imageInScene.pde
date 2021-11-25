class ImageInScene{
  
  private PImage imageToLoad;
  private int xPos;
  private float yPos;
  private int widthOfImage;
  private int heightOfImage;
  
  ImageInScene(String imageName, int x,int y,int imageWidth,int imageHeight){
    if(imageName != ""){
      imageToLoad = loadImage(imageName);
    }
    xPos = x;
    yPos = y;
    widthOfImage = imageWidth;
    heightOfImage = imageHeight;
  }
  
  Objective getMeIfObjective(){
    return null;
  }
  
  void draw(){
    image(imageToLoad, xPos,yPos,widthOfImage,heightOfImage);
  }
  
}
