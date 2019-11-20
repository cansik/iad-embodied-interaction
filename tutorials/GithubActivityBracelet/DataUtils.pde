void normalize(float[] data) {
  float max = max(data);
  for (int i = 0; i < data.length; i++) {
    data[i] /= max;
  }
}
