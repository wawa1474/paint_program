GPanel editor_toolTools_panel;
int editor_toolTools_panel_Width = UIscl * 11;
int editor_toolTools_panel_Height = UIscl * 10;
GSlider editor_slider_size;

public void createTools(){
  G4P.messagesEnabled(false);
  //File assetsFolder = new File(programDirectory + "/assets/");
  //File customSlider = new File(assetsFolder + "/sliders/blank3/");
  //String customSliderPath = customSlider.getAbsolutePath();
  
  editor_toolTools_panel = new GPanel(this, UIscl * 16, 0, editor_toolTools_panel_Width, editor_toolTools_panel_Height, "  tools  ");
  editor_toolTools_panel.addEventHandler(this, "editor_tools_panel_handler");
  editor_toolTools_panel.setCollapsed(true);
  
  editor_slider_size = new GSlider(this, 204, 20, 122, 16, 16);
  editor_slider_size.setLimits(5, 1, 20);
  editor_slider_size.addEventHandler(this, "editor_sizeSlider_handler");
  
  editor_toolTools_panel.addControl(editor_slider_size);
}

public void editor_tools_panel_handler(GPanel source, GEvent event){
  //GEvent.COLLAPSED, EXPANDED, DRAGGED
  if(event == GEvent.COLLAPSED){
  }else if(event == GEvent.EXPANDED){
    hT = int(editor_slider_size.getValueF());
  }else if(event == GEvent.DRAGGED){
  }
}

public void editor_sizeSlider_handler(GSlider source, GEvent event){
  hT = int(editor_slider_size.getValueF());
}