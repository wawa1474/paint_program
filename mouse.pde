void mousePressed(){//We pressed the mouse button
  if(!mouseOver_panel(editor_colorTools_panel) && !mouseOver_panel(editor_toolTools_panel)){
    image.loadPixels();
    //image.set(mouseX, mouseY, currentTileColor);
    switch(mouseButton){
      case LEFT:
        brush();
        break;
      
      case RIGHT:
        break;
      
      case CENTER:
        bucket();
        break;
    }
    image.updatePixels();
  }
}//void mousePressed() END

int hT = 10;
void mouseDragged(){//We dragged the mouse button
  if(!mouseOver_panel(editor_colorTools_panel) && !mouseOver_panel(editor_toolTools_panel)){
    //image.set(mouseX, mouseY, currentTileColor);
    image.loadPixels();
    //image.pixels[(mouseY * width) + mouseX] = currentTileColor;
    //image.pixels[(mouseY * width) + mouseX + 1] = currentTileColor;
    //image.pixels[((mouseY + 1) * width) + mouseX] = currentTileColor;
    //image.pixels[((mouseY + 1) * width) + mouseX + 1] = currentTileColor;
    
    switch(mouseButton){
      case LEFT:
        brush();
        break;
      
      case RIGHT:
        break;
      
      case CENTER:
        break;
    }
    image.updatePixels();
  }
}//void mouseDragged() END

void mouseReleased(){//We released the mouse button
  currentColorSlider = -1;
  image.updatePixels();
}//void mouseReleased() END

void mouseWheel(MouseEvent event_){//We Scrolled The Mouse Wheel
  if(event_.getCount() < 0){//If Scrolling Up
    if(hT < 20){
      editor_slider_size.setValue(editor_slider_size.getValueF() + 1);
      hT++;
    }
  }else{
    if(hT > 1){
      editor_slider_size.setValue(editor_slider_size.getValueF() - 1);
      hT--;
    }
  }
}//void mouseWheel(event) END

boolean mouseInbounds(){
  return mouseX >= (hT/2) && mouseY >= (hT/2) && mouseX <= width - (hT/2) && mouseY <= height - (hT/2);
}