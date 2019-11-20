import peasy.PeasyCam;

PeasyCam cam;

void setup() {
  size(500, 500, P3D);

  cam = new PeasyCam(this, 400);
}

void draw() {
  if (isProcessing) {
    background(0);
  }

  noFill();
  stroke(0, 255, 0);

  for (int i = 0; i < 100; i++) {
    push();

    // position
    translate(0, i);
    rotateX(radians(30 + i));

    // draw
    box(50);

    pop();
  }
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    createOBJ("github-bracelet.obj");
  }
}
