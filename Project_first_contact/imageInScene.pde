class ImageInScene{
  
  PImage imageToLoad;
  int xPos;
  int yPos;
  int widthOfImage;
  int heightOfImage;
  
  boolean imageShouldHover;
  
  ImageInScene(String imageName, int x,int y,int imageWidth,int imageHeight){
    if(imageName != ""){
      imageToLoad = loadImage(imageName);
    }
    xPos = x;
    yPos = y;
    widthOfImage = imageWidth;
    heightOfImage = imageHeight;
  }
  
    ImageInScene(String imageName, int x,int y,int imageWidth,int imageHeight, boolean hover){
    if(imageName != ""){
      imageToLoad = loadImage(imageName);
    }
    xPos = x;
    yPos = y;
    widthOfImage = imageWidth;
    heightOfImage = imageHeight;
  }
  
  void draw(){
    if(imageShouldHover){
      yPos = (int)(yPos  + (height / 2 - heightOfImage) * sin (millis()/1000.0f));
    }
    image(imageToLoad, xPos,yPos,widthOfImage,heightOfImage);
  }
  
}
