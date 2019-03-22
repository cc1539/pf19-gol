
public class GOLGrid {
  
  private PGraphics front_buffer;
  private PGraphics back_buffer;
  
  public PShader gol_shader;
  
  public GOLGrid(int width, int height) {
    front_buffer = createGraphics(width,height,P2D);
    back_buffer = createGraphics(width,height,P2D);
    
    // clear the buffers
    front_buffer.beginDraw();
    front_buffer.background(0);
    front_buffer.endDraw();
    back_buffer.beginDraw();
    back_buffer.background(0);
    back_buffer.endDraw();
    
    gol_shader = loadShader("gol.glsl");
  }
  
  public void timeStep() {
    // use the shader
    /*
    back_buffer.beginDraw();
    gol_shader.set("grid",front_buffer);
    back_buffer.shader(gol_shader);
    back_buffer.rect(0,0,width,height);
    back_buffer.endDraw();
    */
    front_buffer.beginDraw();
    gol_shader.set("grid",front_buffer);
    front_buffer.shader(gol_shader);
    front_buffer.rect(0,0,width,height);
    front_buffer.endDraw();
    /*
    // swap buffers
    PGraphics temp = back_buffer;
    back_buffer = front_buffer;
    front_buffer = temp;
    */
  }
  
  public PImage get() {
    return front_buffer;
  }
  
  public void circle(float x, float y, float radius) {
    front_buffer.beginDraw();
    front_buffer.resetShader();
    front_buffer.fill(255);
    front_buffer.noStroke();
    front_buffer.ellipse(x,y,radius*2,radius*2);
    front_buffer.endDraw();
  }
  
  public void line(float x0, float y0, float x1, float y1) {
    front_buffer.beginDraw();
    front_buffer.resetShader();
    front_buffer.stroke(255);
    front_buffer.line(x0,y0,x1,y1);
    front_buffer.endDraw();
  }
  
}