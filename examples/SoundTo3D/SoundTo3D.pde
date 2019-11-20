import peasy.PeasyCam;

PeasyCam cam;

float[] data;

void setup() {
  size(800, 600, P3D);
  pixelDensity(2);

  cam = new PeasyCam(this, 620);
  cam.setSuppressRollRotationMode();

  setupUI();
  setupSound();

  // load data
  float[] soundWave = loadSoundFile("data/hello.wav");
  data = subSampleArray(soundWave, 512);

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
    box(abs(data[i]) * 1000);
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
