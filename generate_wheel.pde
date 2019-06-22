float DEGtoRAD(float DEG){
  return DEG * (PI / 180);
}

float RADtoDEG(float RAD){
  return RAD * (180 / PI);
}

PImage wheel;
PGraphics tri;
void generateWheel(){
  wheel = new PImage(1000,1000,ARGB);
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
  for(float angle = 0; angle < 360; angle += 0.049){//0.049 = 1000, 0.109 = 500, 0.288 = 200
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
  //wheel.save(programDirectory + "/wheel.png");
}

void generateWheel2(){
  wheel = new PImage(1000,1000,ARGB);
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
  for(float radius = 1; radius < diameter / 2; radius++){
    for(float angle = 0; angle < TAU; angle += map(radius,1,diameter / 2,0.0021,0.00082)){//0.049 = 1000, 0.109 = 500, 0.288 = 200//24 / radius
      int x = int(radius * cos(angle));
      int y = int(radius * sin(angle));
      float hue = map(RADtoDEG(angle), 0, 360, 0, 255);
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
  //wheel.save(programDirectory + "/wheel.png");
}

void generateEmptyWheel(){
  wheel = new PImage(200,200,ARGB);
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
  for(float angle = 0; angle < 360; angle += 0.288){//0.049 = 1000, 0.109 = 500, 0.288 = 200
    for(int radius = diameter / 2 - diameter / 10; radius < diameter / 2; radius++){
      int x = int(radius * cos(DEGtoRAD(angle)));
      int y = int(radius * sin(DEGtoRAD(angle)));
      float hue = map(angle, 0, 360, 0, 255);
      
      wheel.set(x + diameter / 2, y + diameter / 2, color(hue, 255, 255));
    }
  }
  colorMode(RGB, 255);
  wheel.updatePixels();
  //wheel.save(programDirectory + "/wheel.png");
}

void generateEmptyWheel2(){
  wheel = new PImage(200,200,ARGB);
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
  for(float radius = diameter / 2 - diameter / 10; radius < diameter / 2; radius++){
    for(float angle = 0; angle < 360; angle += 20 / radius){//0.049 = 1000, 0.109 = 500, 0.288 = 200
      int x = int(radius * cos(DEGtoRAD(angle)));
      int y = int(radius * sin(DEGtoRAD(angle)));
      float hue = map(angle, 0, 360, 0, 255);
      
      wheel.set(x + diameter / 2, y + diameter / 2, color(hue, 255, 255));
    }
  }
  colorMode(RGB, 255);
  wheel.updatePixels();
  //wheel.save(programDirectory + "/wheel.png");
}

void generateTri(){
  tri = createGraphics(200,200);
  //float a = 0;
  //float r = 1;
  int diameter = tri.width;//diameter
  
  tri.beginDraw();
  //for(int y = 0; y < wheel.height; y++){
  //  for(int x = 0; x < wheel.width; x++){
  //    wheel.set(x, y, color(255, 255, 255, 0));
  //  }
  //}
  colorMode(HSB, 255);
  for(float angle = 0; angle < 360; angle += 0.288){//0.049 = 1000, 0.109 = 500, 0.288 = 200
    for(int radius = diameter / 2 - diameter / 10; radius < diameter / 2; radius++){
      int x = int(radius * cos(DEGtoRAD(angle)));
      int y = int(radius * sin(DEGtoRAD(angle)));
      float hue = map(angle, 0, 360, 0, 255);
      
      tri.set(x + diameter / 2, y + diameter / 2, color(hue, 255, 255));
    }
  }
  colorMode(RGB, 255);
  tri.endDraw();
  //wheel.save(programDirectory + "/wheel.png");
}