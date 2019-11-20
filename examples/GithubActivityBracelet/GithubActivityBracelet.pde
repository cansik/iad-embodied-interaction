// parameters
float inner = 60;
float thickness = 10;
float outer = 20;

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

  push();
  translate(width / 2, height / 2);
  cut();

  // inner
  circle(0, 0, inner);

  // outer
  beginShape();
  float angle = radians(360.0 / (weekdays.length));
  float radius = (inner * 0.5) + thickness;

  for (int i = 0; i < weekdays.length; i++) {
    // rotation, then translation
    float x = sin(angle * i) * (radius + (outer * weekdays[i]));
    float y = cos(angle * i) * (radius + (outer * weekdays[i]));

    vertex(x, y);
  }
  endShape(CLOSE);
  pop();
  
  cp5.draw();
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    createPDF("github-bracelet.pdf");
  }
}
