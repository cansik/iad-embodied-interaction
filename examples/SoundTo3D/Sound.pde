import ddf.minim.*;
Minim minim;

void setupSound() {
  minim = new Minim(this);
}

float[] loadSoundFile(String fileName) {
  AudioSample sound = minim.loadSample(fileName, 1024);

  float[] leftSamples = sound.getChannel(AudioSample.LEFT);
  float[] rightSamples = sound.getChannel(AudioSample.RIGHT);

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
    float sum = 0;
    for (int j = i; j < windowSize && j < data.length; j++) {
      sum += abs(data[j]);
    }
    output[i] = sum;
  }

  return output;
}
