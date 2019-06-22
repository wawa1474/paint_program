import g4p_controls.*;//buttons
import controlP5.*;//sliders and color wheel
ControlP5 UIControls;//ui controls

color currentTileColor = color(0,255,255);

File programDirectory;

PImage image = new PImage(1000,1000);

void setup(){
  size(1000,1000);
  surface.setResizable(true);//allow resizing of the window
  surface.setTitle("Paint Program Java");
  
  programDirectory = new File(sketchPath());
  
  createGUI();
  UIControls = new ControlP5(this);//set up all the control stuff
  setupControlP5();
  
  //generateWheel();
}

void draw(){
  background(255);
  image(image, 0, 0);
  if(sliderBackgroundsChanged){
    updateSliderBackgrounds();
    sliderBackgroundsChanged = false;
  }
}