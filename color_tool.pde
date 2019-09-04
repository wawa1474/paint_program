final int UIscl = 32;

GPanel editor_colorTools_panel;
int editor_colorTools_panel_Width = UIscl * 11;
int editor_colorTools_panel_Height = UIscl * 10;
int currentColorSlider = -1;
GCustomSlider editor_slider_red;
GCustomSlider editor_slider_green;
GCustomSlider editor_slider_blue;
GCustomSlider editor_slider_hue;
GCustomSlider editor_slider_saturation;
GCustomSlider editor_slider_brightness;
GCustomSlider editor_slider_alpha;

boolean sliderBackgroundsChanged = true;

PImage alphaBack;
PImage hueBack;

PGraphics tmpGradient;

GLabel redLabel;
GLabel greenLabel;
GLabel blueLabel;

GLabel hueLabel;
GLabel saturationLabel;
GLabel brightnessLabel;

GLabel alphaLabel;

Controller colorInputR, colorInputG, colorInputB;//number input
Controller colorWheel;//color wheel

public void createColorTools(){
  G4P.messagesEnabled(false);
  GButton.useRoundCorners(false);
  G4P.mouseWheelDirection(G4P.REVERSE);
  
  File assetsFolder = new File(programDirectory + "/assets/");
  alphaBack = loadImage(assetsFolder + "/alphaBack.png");
  hueBack = loadImage(assetsFolder + "/hueBack.png");
  
  editor_colorTools_panel = new GPanel(this, UIscl * 16, 0, editor_colorTools_panel_Width, editor_colorTools_panel_Height, "color tools");
  editor_colorTools_panel.addEventHandler(this, "editor_colorTools_panel_handler");
  editor_colorTools_panel.setCollapsed(true);
  
  File customSlider = new File(assetsFolder + "/sliders/blank3/");
  String customSliderPath = customSlider.getAbsolutePath();
  
  editor_slider_red = new GCustomSlider(this, 204, 20, 122, 16, customSliderPath);
  editor_slider_red.setLimits(127, 0, 255);
  editor_slider_red.addEventHandler(this, "editor_colorSlider_handler");
  
  editor_slider_green = new GCustomSlider(this, 204, 36, 122, 16, customSliderPath);
  editor_slider_green.setLimits(127, 0, 255);
  editor_slider_green.addEventHandler(this, "editor_colorSlider_handler");
  
  editor_slider_blue = new GCustomSlider(this, 204, 52, 122, 16, customSliderPath);
  editor_slider_blue.setLimits(127, 0, 255);
  editor_slider_blue.addEventHandler(this, "editor_colorSlider_handler");
  //1 = ticks, 2 = text color, 3 = thumb/border, 4 = ticks, 5 = surface, 6 = background, 11 = thumb, 14 = thumb, 15 = thumb
  
  colorMode(HSB, 255);
  
  editor_slider_hue = new GCustomSlider(this, 204, 84, 122, 16, customSliderPath);
  editor_slider_hue.setLimits(127, 0, 255);
  editor_slider_hue.addEventHandler(this, "editor_colorSlider_handler");
  
  editor_slider_saturation = new GCustomSlider(this, 204, 100, 122, 16, customSliderPath);
  editor_slider_saturation.setLimits(127, 0, 255);
  editor_slider_saturation.addEventHandler(this, "editor_colorSlider_handler");
  
  editor_slider_brightness = new GCustomSlider(this, 204, 116, 122, 16, customSliderPath);
  editor_slider_brightness.setLimits(127, 0, 255);
  editor_slider_brightness.addEventHandler(this, "editor_colorSlider_handler");
  
  colorMode(RGB, 255);
  
  editor_slider_alpha = new GCustomSlider(this, 204, 300, 122, 16, customSliderPath);
  editor_slider_alpha.setLimits(127, 0, 255);
  editor_slider_alpha.addEventHandler(this, "editor_colorSlider_handler");
  
  editor_colorTools_panel.addControl(editor_slider_red);
  editor_colorTools_panel.addControl(editor_slider_green);
  editor_colorTools_panel.addControl(editor_slider_blue);
  editor_colorTools_panel.addControl(editor_slider_hue);
  editor_colorTools_panel.addControl(editor_slider_saturation);
  editor_colorTools_panel.addControl(editor_slider_brightness);
  editor_colorTools_panel.addControl(editor_slider_alpha);
  
  
  tmpGradient = createGraphics(100,16);
  
  redLabel = new GLabel(this, 215, 20, 100, 16, "");
  greenLabel = new GLabel(this, 215, 36, 100, 16, "");
  blueLabel = new GLabel(this, 215, 52, 100, 16, "");
  
  hueLabel = new GLabel(this, 215, 84, 100, 16, "");
  saturationLabel = new GLabel(this, 215, 100, 100, 16, "");
  brightnessLabel = new GLabel(this, 215, 116, 100, 16, "");
  
  hueLabel.setIcon(hueBack, 1, null, null);
  
  alphaLabel = new GLabel(this, 215, 300, 100, 16, "");
  
  editor_colorTools_panel.addControl(redLabel);
  editor_colorTools_panel.addControl(greenLabel);
  editor_colorTools_panel.addControl(blueLabel);
  editor_colorTools_panel.addControl(hueLabel);
  editor_colorTools_panel.addControl(saturationLabel);
  editor_colorTools_panel.addControl(brightnessLabel);
  editor_colorTools_panel.addControl(alphaLabel);
}

void setupControlP5(){
  UIControls.addColorWheel("colorWheel").setVisible(false).setRGB(currentTileColor).setCaptionLabel("")//create ColorWheel
    .onChange(new CallbackListener(){//when changed
    public void controlEvent(CallbackEvent theEvent){
      if(currentColorSlider == -1){
        currentColorSlider = 99;
      }
      
      if(currentColorSlider == 99){
        currentTileColor = UIControls.get(ColorWheel.class, "colorWheel").getRGB();
        
        editor_slider_red.setValue(red(currentTileColor));
        editor_slider_green.setValue(green(currentTileColor));
        editor_slider_blue.setValue(blue(currentTileColor));
        editor_slider_hue.setValue(hue(currentTileColor));
        editor_slider_saturation.setValue(saturation(currentTileColor));
        editor_slider_brightness.setValue(brightness(currentTileColor));
        
        //updateSliderBackgrounds();
      }
    }
  }
  );
  colorWheel = UIControls.getController("colorWheel");//make it easier to use ColorWheel

  UIControls.addTextfield("colorInputR").setSize(UIscl, UIscl / 2).setVisible(false).setCaptionLabel("");//.setColorLabel(color(255, 0, 0));
  UIControls.addTextfield("colorInputG").setSize(UIscl, UIscl / 2).setVisible(false).setCaptionLabel("");//.setColorLabel(color(0, 255, 0));
  UIControls.addTextfield("colorInputB").setSize(UIscl, UIscl / 2).setVisible(false).setCaptionLabel("");//.setColorLabel(color(0, 0, 255));
  colorInputR = UIControls.getController("colorInputR");//make it easier to use Textfield
  colorInputG = UIControls.getController("colorInputG");//make it easier to use Textfield
  colorInputB = UIControls.getController("colorInputB");//make it easier to use Textfield
}

void updateSliderBackgrounds(){
  drawRedGradient();
  redLabel.setIcon(tmpGradient, 1, null, null);
  
  drawGreenGradient();
  greenLabel.setIcon(tmpGradient, 1, null, null);
  
  drawBlueGradient();
  blueLabel.setIcon(tmpGradient, 1, null, null);
  
  
  drawSaturationGradient();
  saturationLabel.setIcon(tmpGradient, 1, null, null);
  
  drawBrightnessGradient();
  brightnessLabel.setIcon(tmpGradient, 1, null, null);
  
  
  drawAlphaGradient();
  alphaLabel.setIcon(tmpGradient, 1, null, null);
}

void drawRedGradient(){
  tmpGradient.beginDraw();
  tmpGradient.noStroke();
  for(float i = 0; i <= 1; i+=0.02){
    tmpGradient.fill(lerpColor(color(0, green(currentTileColor), blue(currentTileColor)), color(255, green(currentTileColor), blue(currentTileColor)), i));
    tmpGradient.rect((i*100), 0, 2, 16);
  }
  tmpGradient.endDraw();
}

void drawGreenGradient(){
  tmpGradient.beginDraw();
  tmpGradient.noStroke();
  for(float i = 0; i <= 1; i+=0.02){
    tmpGradient.fill(lerpColor(color(red(currentTileColor), 0, blue(currentTileColor)), color(red(currentTileColor), 255, blue(currentTileColor)), i));
    tmpGradient.rect((i*100), 0, 2, 16);
  }
  tmpGradient.endDraw();
}

void drawBlueGradient(){
  tmpGradient.beginDraw();
  tmpGradient.noStroke();
  for(float i = 0; i <= 1; i+=0.02){
    tmpGradient.fill(lerpColor(color(red(currentTileColor), green(currentTileColor), 0), color(red(currentTileColor), green(currentTileColor), 255), i));
    tmpGradient.rect((i*100), 0, 2, 16);
  }
  tmpGradient.endDraw();
}

void drawSaturationGradient(){
  colorMode(HSB, 255);
  color lowSat = color(hue(currentTileColor), 0, brightness(currentTileColor));
  color highSat = color(hue(currentTileColor), 255, brightness(currentTileColor));
  colorMode(RGB, 255);
  tmpGradient.beginDraw();
  tmpGradient.noStroke();
  for(float i = 0; i <= 1; i+=0.02){
    tmpGradient.fill(lerpColor(lowSat, highSat, i));
    tmpGradient.rect((i*100), 0, 2, 16);
  }
  tmpGradient.endDraw();
}

void drawBrightnessGradient(){
  colorMode(HSB, 255);
  color lowBright = color(hue(currentTileColor), saturation(currentTileColor), 0);
  color highBright = color(hue(currentTileColor), saturation(currentTileColor), 255);
  colorMode(RGB, 255);
  tmpGradient.beginDraw();
  tmpGradient.noStroke();
  for(float i = 0; i <= 1; i+=0.02){
    tmpGradient.fill(lerpColor(lowBright, highBright, i));
    tmpGradient.rect((i*100), 0, 2, 16);
  }
  tmpGradient.endDraw();
}

void drawAlphaGradient(){
  tmpGradient.beginDraw();
  tmpGradient.noStroke();
  tmpGradient.clear();
  tmpGradient.image(alphaBack, 0, 0);
  for(float i = 0; i <= 1; i+=0.020001){
    if(i != 0){
      tmpGradient.fill(color(red(currentTileColor), green(currentTileColor), blue(currentTileColor), i*255));
      tmpGradient.rect((i*100), 0, 2, 16);
    }
  }
  tmpGradient.endDraw();
}

boolean mouseOver_panel(GPanel panel){
  boolean Xinside = false;
  boolean Yinside = false;
  boolean inside = false;
  
  if(mouseX > panel.getX()){
    if(panel.isCollapsed()){
      
    }else if(mouseX < panel.getX() + panel.getWidth()){
      Xinside = true;
    }
  }
  
  if(mouseY > panel.getY()){
    if(panel.isCollapsed()){
      
    }else if(mouseY < panel.getY() + panel.getHeight()){
      Yinside = true;
    }
  }
  
  inside = panel.isOver(mouseX, mouseY) || panel.isDragging();
  
  return (Xinside && Yinside) || inside;
}

public void editor_colorTools_panel_handler(GPanel source, GEvent event){
  //GEvent.COLLAPSED, EXPANDED, DRAGGED
  if(event == GEvent.COLLAPSED){
    colorWheel.setVisible(false);
    colorInputR.setVisible(false);//change visibility
    colorInputG.setVisible(false);//change visibility
    colorInputB.setVisible(false);//change visibility
  }else if(event == GEvent.EXPANDED){
    colorWheel.setVisible(true);
    colorInputR.setVisible(true);//change visibility
    colorInputG.setVisible(true);//change visibility
    colorInputB.setVisible(true);//change visibility
    colorWheel.setPosition(editor_colorTools_panel.getX() + 1, editor_colorTools_panel.getY() + 20);
    colorInputR.setPosition(editor_colorTools_panel.getX() + (UIscl * 6.5), editor_colorTools_panel.getY() + 20 + 132);
    colorInputG.setPosition(editor_colorTools_panel.getX() + (UIscl * 6.5), editor_colorTools_panel.getY() + 20 + 148);
    colorInputB.setPosition(editor_colorTools_panel.getX() + (UIscl * 6.5), editor_colorTools_panel.getY() + 20 + 164);
    editor_slider_red.setValue(red(currentTileColor));
    editor_slider_green.setValue(green(currentTileColor));
    editor_slider_blue.setValue(blue(currentTileColor));
    editor_slider_hue.setValue(hue(currentTileColor));
    editor_slider_saturation.setValue(saturation(currentTileColor));
    editor_slider_brightness.setValue(brightness(currentTileColor));
    editor_slider_alpha.setValue(alpha(currentTileColor));
  }else if(event == GEvent.DRAGGED){
    colorWheel.setPosition(editor_colorTools_panel.getX() + 1, editor_colorTools_panel.getY() + 20);
    colorInputR.setPosition(editor_colorTools_panel.getX() + (UIscl * 6.5), editor_colorTools_panel.getY() + 20 + 132);
    colorInputG.setPosition(editor_colorTools_panel.getX() + (UIscl * 6.5), editor_colorTools_panel.getY() + 20 + 148);
    colorInputB.setPosition(editor_colorTools_panel.getX() + (UIscl * 6.5), editor_colorTools_panel.getY() + 20 + 164);
  }
  
  sliderBackgroundsChanged = true;
}

public void editor_colorSlider_handler(GCustomSlider source, GEvent event){
  if(source == editor_slider_alpha){
    currentTileColor = color(red(currentTileColor),green(currentTileColor),blue(currentTileColor),editor_slider_alpha.getValueF());
    return;
  }
  
  boolean HSBSliders = currentColorSlider >= 0 && currentColorSlider <= 2;
  if(HSBSliders){
    colorMode(HSB, 255);
  }
  
  switch(currentColorSlider){
    case -1:
      break;

    case 0:
      currentTileColor = color(editor_slider_hue.getValueF(),saturation(currentTileColor),brightness(currentTileColor));
      break;

    case 1:
      currentTileColor = color(hue(currentTileColor),editor_slider_saturation.getValueF(),brightness(currentTileColor));
      break;

    case 2:
      currentTileColor = color(hue(currentTileColor),saturation(currentTileColor),editor_slider_brightness.getValueF());
      break;

    case 3:
      currentTileColor = color(editor_slider_red.getValueF(),green(currentTileColor),blue(currentTileColor));
      break;

    case 4:
      currentTileColor = color(red(currentTileColor),editor_slider_green.getValueF(),blue(currentTileColor));
      break;

    case 5:
      currentTileColor = color(red(currentTileColor),green(currentTileColor),editor_slider_blue.getValueF());
      break;
  }
  
  if(HSBSliders){
    colorMode(RGB, 255);
  }
  
  if(HSBSliders){
    editor_slider_red.setValue(red(currentTileColor));
    editor_slider_green.setValue(green(currentTileColor));
    editor_slider_blue.setValue(blue(currentTileColor));
    UIControls.get(ColorWheel.class,"colorWheel").setRGB(currentTileColor);
  }else if(currentColorSlider >= 3 && currentColorSlider <= 5){
    editor_slider_hue.setValue(hue(currentTileColor));
    editor_slider_saturation.setValue(saturation(currentTileColor));
    editor_slider_brightness.setValue(brightness(currentTileColor));
    UIControls.get(ColorWheel.class,"colorWheel").setRGB(currentTileColor);
  }
  
  if(currentColorSlider == -1){
    if(source == editor_slider_hue){//would use switch case here but GCustomSlider source doesn't work with it
      currentColorSlider = 0;
    }else if(source == editor_slider_saturation){
      currentColorSlider = 1;
    }else if(source == editor_slider_brightness){
      currentColorSlider = 2;
    }else if(source == editor_slider_red){
      currentColorSlider = 3;
    }else if(source == editor_slider_green){
      currentColorSlider = 4;
    }else if(source == editor_slider_blue){
      currentColorSlider = 5;
    }
  }
  
  sliderBackgroundsChanged = true;
}