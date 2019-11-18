import controlP5.*;
ControlP5 cp5;
int uiHeight;

void setupUI() {
  cp5 = new ControlP5(this);
  cp5.setFont(createFont("Arial", 10));

  int h = 10;
  cp5.addSlider("inner", 10, 150, 10, h, 100, 20)
    .setRange(50, 120)
    .setLabel("Inner")
    .getCaptionLabel().setColor(0);

  h += 25;
  cp5.addSlider("thickness", 10, 150, 10, h, 100, 20)
    .setRange(5, 20)
    .setLabel("Thickness")
    .getCaptionLabel().setColor(0);

  h += 25;
  cp5.addSlider("outer", 10, 150, 10, h, 100, 20)
    .setRange(5, 30)
    .setLabel("Outer")
    .getCaptionLabel().setColor(0);
}
