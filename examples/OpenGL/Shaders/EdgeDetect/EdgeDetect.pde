// This example shows how to change the default fragment shader used
// in P3D to render textures, by a custom one that applies a simple 
// edge detection filter.
//
// Tap the screen to switch between the custom and the default shader.

PImage img;
PShader shader;
PGraphicsAndroid3D pg;  
boolean usingShader;
  
void setup() {
  size(400, 400, P3D);
  img = loadImage("berlin-1.jpg");
    
  pg = (PGraphicsAndroid3D)g;
  shader = pg.loadShader("edges.glsl", FILL_SHADER_TEX);
  pg.setShader(shader, FILL_SHADER_TEX);
  usingShader = true;
}

void draw() {
  image(img, 0, 0, width, height);
}
  
void mousePressed() {
  if (usingShader) {
    pg.resetShader(FILL_SHADER_TEX);
    usingShader = false;
  } else {
    pg.setShader(shader, FILL_SHADER_TEX);
    usingShader = true;
  }
}
