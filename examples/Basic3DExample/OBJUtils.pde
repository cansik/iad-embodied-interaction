import nervoussystem.obj.*;

boolean isProcessing = true;

// mm and px convertions
static final float MM_TO_PIXEL_RATIO = 0.3527778f;

public float mm(float wantedMM) {
  return wantedMM / MM_TO_PIXEL_RATIO;
}

public float px(float wantedPX) {
  return wantedPX * MM_TO_PIXEL_RATIO;
}

// export methods
void createOBJ(String objName) {  
  beginRecord("nervoussystem.obj.OBJExport", objName);
  isProcessing = false;
  draw();
  isProcessing = true;
  endRecord();

  println("obj " + objName + " saved!");
}
