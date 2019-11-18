JSONObject data;

void setup() {
  size(500, 500, FX2D);

  // load data
  data = loadJSONObject("data/activity.json");
}

void draw() {
  if (isProcessing) {
    background(255);
    scale(2);
  }

  cut();
  circle(20, 30, 30);
  circle(20, 30, 15);
  
  engrave();
  circle(60, 40, 15);
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    createPDF("laser-activity.pdf");
  }
}
