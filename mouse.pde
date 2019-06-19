void mousePressed(){//We pressed the mouse button
  if(!mouseOver_colorToolsPanel()){
    image.loadPixels();
    image.set(mouseX, mouseY, currentTileColor);
  }
}//void mousePressed() END

void mouseDragged(){//We dragged the mouse button
  if(!mouseOver_colorToolsPanel()){
    image.set(mouseX, mouseY, currentTileColor);
  }
}//void mouseDragged() END

void mouseReleased(){//We released the mouse button
  currentColorSlider = -1;
  image.updatePixels();
}//void mouseReleased() END