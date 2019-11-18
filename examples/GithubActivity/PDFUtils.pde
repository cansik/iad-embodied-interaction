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
  noFill();
  stroke(0);

  if (isProcessing) {
    strokeWeight(0.2f);
  } else {
    strokeWeight(0.03f);
  }
}

private void engrave()
{
  fill(0);
  noStroke();
}

// export methods
void createPDF(String pdfName) {
  // save to pdf
  PGraphics pdf = (PGraphicsPDF)beginRecord(PDF, pdfName);
  pdf.setSize(round(px(width) * pixelDensity), round(px(height)) * pixelDensity);

  pdf.scale(1.0 / MM_TO_PIXEL_RATIO);
  isProcessing = false;
  draw();
  isProcessing = true;
  endRecord();

  println("pdf " + pdfName + " saved!");
}
