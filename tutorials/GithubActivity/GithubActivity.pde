// parameters
float graphWidth = 400;
float graphHeight = 300;
float baseHeight = 50;

float labelCenter = 0.05;
float labelHeight = 25;

JSONObject data;

// starts with monday
float[] weekdays = new float[7];
int dayIndex = 1;

String[] weekdayNames = new String[] {
  "Monday", 
  "Tuesday", 
  "Wednesday", 
  "Thursday", 
  "Friday", 
  "Saturday", 
  "Sunday"
};

void setup() {
  size(500, 500, FX2D);
  
  setupUI();

  // load data
  data = loadJSONObject("data/count.json");

  // copy year 2019 into weekdays (aggregation)
  JSONObject year2019 = data.getJSONObject("data").getJSONObject("2019");

  for (int m = 1; m <= year2019.keys().size(); m++) {
    JSONObject month = year2019.getJSONObject(Integer.toString(m));

    for (int d = 1; d <= month.keys().size(); d++) {
      int dayCount = month.getInt(Integer.toString(d));
      weekdays[dayIndex] += dayCount;

      dayIndex = (dayIndex + 1) % weekdays.length;
    }
  }

  // normalize weekdays
  normalize(weekdays);

  // display
  for (int i = 0; i < weekdays.length; i++) {
    println(weekdayNames[i] + ":\t" + weekdays[i]);
  }
}

void draw() {
  if (isProcessing) {
    background(255);
  }

  createGraph();
}

void createGraph() {
  cut();
  push();
  translate(50, 100);

  // draw simple shape
  beginShape();
  for (int i = 0; i < weekdays.length; i++) {
    float w = graphWidth / (weekdays.length - 1) * i;
    float h = graphHeight - (weekdays[i] * graphHeight + baseHeight);

    vertex(w, h);
  }

  // create base
  vertex(graphWidth, graphHeight - baseHeight);
  vertex(graphWidth, graphHeight);
  vertex(0, graphHeight); 
  endShape(CLOSE);

  // add labels
  for (int i = 0; i < weekdays.length; i++) {
    push();
    float ew = (graphWidth * (1.0 - labelCenter)) / (weekdays.length - 1);
    float w = (graphWidth * (labelCenter * 0.5)) + ew * i;
    translate(w, graphHeight - labelHeight);
    stroke(0);
    fill(0);
    textAlign(CENTER, CENTER);
    text(weekdayNames[i].charAt(0), 0, 0);
    pop();
  }

  pop();
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    createPDF("laser-activity.pdf");
  }
}
