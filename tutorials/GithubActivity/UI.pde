import controlP5.*;
ControlP5 cp5;
int uiHeight;

void setupUI() {
  cp5 = new ControlP5(this);
  cp5.setFont(createFont("Arial", 10));

  int h = 10;
  cp5.addSlider("graphHeight", 10, 150, 10, h, 100, 20)
    .setRange(100, 450)
    .setLabel("Graph Height")
    .getCaptionLabel().setColor(0);
}
