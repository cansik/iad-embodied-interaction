import processing.pdf.*;

boolean isProcessing = true;

// mm and px convertions
static final float MM_TO_PIXEL_RATIO = 0.3527778f;

public float mm(float wantedMM) {
  return wantedMM / MM_TO_PIXEL_RATIO;
}

public float px(float wantedPX) {
  return wantedPX * MM_TO_PIXEL_RATIO;
}

// cutting modes
private void cut()
{
  g.noFill();
  g.stroke(0);
  g.strokeWeight(0.03f);
}

private void engrave()
{
  g.fill(0);
  g.noStroke();
}

// export methods
void createPDF(String pdfName) {
  // save to pdf
  PGraphics pdf = (PGraphicsPDF)beginRecord(PDF, pdfName);
  pdf.setSize(round(px(width)), round(px(height)));

  PGraphics defaultG = this.g;
  this.g = pdf;

  pdf.scale(1.0 / MM_TO_PIXEL_RATIO);
  isProcessing = false;
  draw();
  isProcessing = true;
  endRecord();

  this.g = defaultG;

  println("pdf " + pdfName + " saved!");
}
