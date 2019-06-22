float DEGtoRAD(float DEG){
  return DEG * (PI / 180);
}

void generateWheel(){
  PImage wheel = new PImage(1000,1000,ARGB);
  //float a = 0;
  //float r = 1;
  int diameter = wheel.width;//diameter
  
  wheel.loadPixels();
  //for(int y = 0; y < wheel.height; y++){
  //  for(int x = 0; x < wheel.width; x++){
  //    wheel.set(x, y, color(255, 255, 255, 0));
  //  }
  //}
  colorMode(HSB, 255);
  for(float angle = 0; angle < 360; angle += 0.01){
    for(int radius = 0; radius < diameter / 2; radius++){
      int x = int(radius * cos(DEGtoRAD(angle)));
      int y = int(radius * sin(DEGtoRAD(angle)));
      float hue = map(angle, 0, 360, 0, 255);
      float saturation = 255;
      float brightness = 255;
      
      if(radius < diameter / 16){
        saturation = 0;
      }else if(radius < diameter / 4){
        saturation = map(radius, diameter / 16, diameter / 4, 0, 255);
      }//else{
        //saturation = 255;
      //}
      
      if(radius > diameter / 2 - diameter / 32){
        brightness = 0;
      }else if(radius > diameter / 4){
        brightness = map(radius, diameter / 4, diameter / 2 - diameter / 32, 255, 0);
      }//else{
        //brightness = 255;
      //}
      
      
      wheel.set(x + diameter / 2, y + diameter / 2, color(hue, saturation, brightness));
    }
  }
  colorMode(RGB, 255);
  wheel.updatePixels();
  wheel.save(programDirectory + "/wheel.png");
}