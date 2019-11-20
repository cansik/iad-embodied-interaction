import ddf.minim.*; //<>//
Minim minim;

void setupSound() {
  minim = new Minim(this);
}

float[] loadSoundFile(String fileName) {
  AudioSample sound = minim.loadSample(fileName, 1024);

  float[] leftSamples = sound.getChannel(AudioSample.LEFT);
  float[] rightSamples = null;
  try {
    rightSamples = sound.getChannel(AudioSample.RIGHT);
  } 
  catch(Exception ex) {
    return leftSamples;
  }

  // combine left and right channel
  float [] samplesVal = new float[rightSamples.length];
  for (int i=0; i <rightSamples.length; i++) {
    samplesVal[i] = leftSamples[i]+ rightSamples[i];
  }

  return samplesVal;
}

float[] subSampleArray(float[] data, int windowSize) {
  int dataPoints = (data.length / windowSize + 1);
  float[] output = new float[dataPoints];

  for (int i = 0; i < output.length; i++) {
    float avg = 0;
    int count = 0;
    int shift = i * windowSize;
    for (int j = shift; j < (shift + windowSize) && j < data.length; j++) {
      avg += abs(data[j]);
      count++;
    }
    avg /= count;
    output[i] = avg;
  }

  return output;
}
