import controlP5.*;

ControlP5 cp5;

void setupUI()
{
  PFont font = createFont("Helvetica", 100f);

  cp5 = new ControlP5(this);
  cp5.setAutoDraw(false);

  // change the original colors
  cp5.setColorForeground(color(255, 132, 124));
  cp5.setColorBackground(color(42, 54, 59));
  cp5.setFont(font, 14);
  cp5.setColorActive(color(255, 132, 124));

  int h = 10;
  cp5.addSlider("intensity", 10, 150, 10, h, 100, 20)
    .setRange(200, 1000)
    .setLabel("Intensity");
}
