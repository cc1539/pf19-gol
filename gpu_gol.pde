
public GOLGrid golg;

public void setup() {
  
  //size(840,640,P2D);
  fullScreen(P2D);
  noSmooth();
  
  golg = new GOLGrid(width,height);
}

public void draw() {
  
  if(mousePressed) {
    golg.line(
      pmouseX,pmouseY,
      mouseX,mouseY
    );
  }
  
  golg.timeStep();
  
  image(golg.get(),0,0,width,height);
  
  surface.setTitle("FPS: "+frameRate);
}
