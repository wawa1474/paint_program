import g4p_controls.*;//buttons
import controlP5.*;//sliders and color wheel
ControlP5 UIControls;//ui controls

color primaryColor = color(0,255,255);
color secondaryColor = color(0,0,0);
int changingColor = 0;//which color are we changing?

File programDirectory;

PImage image = new PImage(1000,1000);

void setup(){
  size(1000,1000);
  surface.setResizable(true);//allow resizing of the window
  surface.setTitle("Paint Program Java");
  
  programDirectory = new File(sketchPath());
  
  createTools();
  createColorTools();
  UIControls = new ControlP5(this);//set up all the control stuff
  setupControlP5();
  
  //generateWheel2();
  //generateTri();
}

void draw(){
  background(255);
  image(image, 0, 0);
  if(sliderBackgroundsChanged){
    updateSliderBackgrounds();
    sliderBackgroundsChanged = false;
  }
  noFill();
  stroke(255);
  rect(mouseX-hT/2,mouseY-hT/2,hT,hT);
  //image(wheel,0,0);
  //image(tri,256,0);
}

void setColor(color color_){//allow for multiple colors
  switch(changingColor){
    case 0:
      primaryColor = color_;
      break;
    case 1:
      secondaryColor = color_;
      break;
  }
}