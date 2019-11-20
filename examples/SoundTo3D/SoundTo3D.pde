import peasy.PeasyCam;

PeasyCam cam;

float[] data;

float intensity = 300;

void setup() {
  size(800, 600, P3D);
  pixelDensity(2);

  cam = new PeasyCam(this, 620);
  cam.setSuppressRollRotationMode();

  setupUI();
  setupSound();

  // load data
  float[] soundWave = loadSoundFile("data/hello.wav");
  data = subSampleArray(soundWave, 256);

  println("Data: " + data.length);
}

void draw() {
  if (isProcessing) {
    background(0);
  }

  noFill();
  stroke(255);

  float angleStep = radians(360.0 / data.length);

  for (int i = 0; i < data.length; i++) {
    push();
    rotate(angleStep * i);
    translate(100, 0, 0);
    box(10, 10, max(10, abs(data[i]) * intensity));
    pop();
  }

  cam.beginHUD();
  cp5.draw();
  cam.endHUD();
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    createOBJ("github-bracelet.obj");
  }
}
