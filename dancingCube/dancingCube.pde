import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer sample;
FFT fftLog;


Cube c;

PVector pos, rot;

void setup() {
  frameRate(120);
  smooth(0);
  size(750, 800, P3D); 
  minim=new Minim(this);
  sample=minim.loadFile("bts-fire.mp3", 1024);
  sample.play();
  fftLog=new FFT(sample.bufferSize(), sample.sampleRate());
  fftLog.logAverages(20, 250);

  pos=new PVector(0, 0, 0);
  rot=new PVector (0, 0, 0);
  c=new Cube(6, 20, rot, pos);
}
void draw() {
  colorMode(HSB);
  smooth(0);
  background(#FFBD69);
  lights();
  directionalLight(304, 104, 304, 100, 100, -1);

  rotateCamera(0.0009, 500, -550);
  c.display();
  if (key=='s')c.dismountCubeInPlains();
  if (key=='a')c.mountCubeInPlains();
  if (key=='x')c.dismountCube();
  if (key=='z')c.mountCube();
}
