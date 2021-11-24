class ImageInScene{
  
  PImage imageToLoad;
  int xPos;
  float yPos;
  int widthOfImage;
  int heightOfImage;
  
  ImageInScene(String imageName, int x,int y,int imageWidth,int imageHeight){
    if(imageName != ""){
      imageToLoad = loadImage(imageName);
    }
    xPos = x;
    yPos = y;
    widthOfImage = imageWidth;
    heightOfImage = imageHeight;
  }
  
  void draw(){
    image(imageToLoad, xPos,yPos,widthOfImage,heightOfImage);
  }
  
}
