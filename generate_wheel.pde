float DEGtoRAD(float DEG){
  return DEG * (PI/180);
}

void generateWheel(){
  PImage wheel = new PImage(1000,1000,ARGB);
  //float a = 0;
  //float r = 1;
  
  wheel.loadPixels();
  //for(int y = 0; y < wheel.height; y++){
  //  for(int x = 0; x < wheel.width; x++){
  //    wheel.set(x, y, color(255, 255, 255, 0));
  //  }
  //}
  colorMode(HSB, 255);
  for(float a = 0; a < 360; a+=0.01){
    for(int r = 0; r < width / 2; r++){
      float x = r * cos(DEGtoRAD(a));
      float y = r * sin(DEGtoRAD(a));
      float hue = map(a,0,360,0,255);
      float saturation = 255;
      float brightness = 255;
      
      if(r < width / 16){
        saturation = 0;
      }else if(r < width/4){
        saturation = map(r,width / 16,width/4,0,255);
      }
      
      if(r > (width / 2) - (width / 32)){
        brightness = 0;
      }else if(r > width/4){
        brightness = map(r,width/4,(width / 2) - (width / 32),255,0);
      }
      
      
      wheel.set(int(x) + width / 2, int(y) + width / 2, color(hue, saturation, brightness));
    }
  }
  colorMode(RGB, 255);
  wheel.updatePixels();
  wheel.save(programDirectory + "/wheel.png");
}