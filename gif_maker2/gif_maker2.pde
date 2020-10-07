int totalFrames = 120;
int counter = 0;
boolean record = false;
float s = 0;

void setup() {
  size(600, 300);
  colorMode(HSB);
}

void draw() {
  float percent = 0;
  if (record) {
    percent = float(counter) / totalFrames;
  } else {
    percent = float(frameCount % totalFrames) / totalFrames;
  }

  render(percent);
  if (record) {
    saveFrame("output/gif-"+nf(counter, 3)+".png");
    if (counter == totalFrames-1) {
      exit();
    }
    counter++;
  }
}

void render(float percent) {
  background(55);
  
  float offset = 0;

  float clr = percent * 255;
  noStroke();

  for (int col = 0; col < 300; col++) {
    for (int row = 0; row < 150; row++) {
      int x = col * 2 + 1;
      int y = row * 2 + 1;
      clr = (clr + offset) % 255;
      if (row %2 != 0) {
        fill(255-clr, 255, 255);
      } else {
        fill(clr, 255, 255);
      }
      rectMode(CENTER);
      square(x, y, 2);
      s += 0.001;
      offset += 0.021;
    }
  }
}
