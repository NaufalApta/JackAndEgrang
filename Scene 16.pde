int totalFrames = 636;
int currentFrame = 0;
boolean isTalking = true;

void setup() {
  size(800, 450);
  frameRate(60);
}

void draw() {
  drawOutdoorBackground();
  drawBambooArea();
  drawEgrang(600, 290);
  drawEgrang(640, 300);

  // Kakek bicara
  pushMatrix();
  scale(2.0);
  drawKakek(150, 165, isTalking);
  popMatrix();

  // Jack diam
  pushMatrix();
  scale(1.8);
  drawJack(250, 220);
  popMatrix();

  saveFrame("frames/frame-####.png");
  currentFrame++;
  if (currentFrame >= totalFrames) {
    noLoop();
  }

  // Gerak mulut tiap 10 frame
  if (frameCount % 10 == 0) {
    isTalking = !isTalking;
  }
}

// Gambar latar
void drawOutdoorBackground() {
  background(135, 206, 235); // langit
  fill(222, 184, 135);       // tanah
  rect(0, 300, width, 150);
}

void drawBambooArea() {
  for (int i = 0; i < 10; i++) {
    float x = 100 + i * 50;
    drawBamboo(x, 180);
  }
}

void drawBamboo(float x, float y) {
  fill(154, 205, 50);
  rect(x, y, 10, 140);
  stroke(85, 107, 47);
  for (int i = 0; i < 5; i++) {
    line(x, y + i * 28, x + 10, y + i * 28);
  }
  noStroke();
}

// Egrang
void drawEgrang(float x, float y) {
  stroke(139, 69, 19);
  strokeWeight(6);
  line(x, y - 80, x, y + 40);
  line(x + 20, y - 80, x + 20, y + 40);
  strokeWeight(8);
  line(x - 10, y, x + 10, y);
  line(x + 10, y + 10, x + 30, y + 10);
  noStroke();
}

// Jack (diam)
void drawJack(float x, float y) {
  fill(255, 224, 189);
  ellipse(x, y - 45, 36, 36);

  fill(139, 69, 19);
  arc(x, y - 50, 40, 36, PI, TWO_PI);
  triangle(x - 12, y - 47, x - 6, y - 54, x - 3, y - 46);
  triangle(x - 2, y - 48, x + 2, y - 54, x + 6, y - 47);
  triangle(x + 4, y - 47, x + 10, y - 54, x + 12, y - 46);

  fill(255);
  ellipse(x - 7, y - 46, 7, 7);
  ellipse(x + 7, y - 46, 7, 7);
  fill(0);
  ellipse(x - 7, y - 46, 3, 3);
  ellipse(x + 7, y - 46, 3, 3);

  stroke(0);
  line(x - 5, y - 36, x + 5, y - 36);
  noStroke();

  fill(200, 0, 0);
  rect(x - 15, y - 30, 30, 28, 6);

  fill(255, 224, 189);
  ellipse(x - 16, y - 10, 7, 14);
  ellipse(x + 16, y - 10, 7, 14);

  fill(255, 165, 0);
  rect(x - 13, y - 2, 10, 18, 3);
  rect(x + 3, y - 2, 10, 18, 3);

  fill(255);
  rect(x - 13, y + 16, 6, 5);
  rect(x + 7, y + 16, 6, 5);
  fill(90, 60, 40);
  rect(x - 13, y + 21, 10, 6, 2);
  rect(x + 7, y + 21, 10, 6, 2);
}

// Kakek bicara
void drawKakek(float x, float y, boolean talking) {
  fill(255, 224, 189);
  ellipse(x, y - 45, 36, 36);

  fill(230);
  arc(x, y - 50, 40, 36, PI, TWO_PI);
  ellipse(x - 18, y - 45, 5, 5);
  ellipse(x + 18, y - 45, 5, 5);

  fill(255);
  ellipse(x - 7, y - 46, 6, 6);
  ellipse(x + 7, y - 46, 6, 6);
  fill(0);
  ellipse(x - 5, y - 46, 2, 2);
  ellipse(x + 9, y - 46, 2, 2);

  // Mulut bicara
  fill(0);
  if (talking) {
    ellipse(x, y - 36, 8, 10); // terbuka
  } else {
    rect(x - 3, y - 36, 6, 3, 2); // tertutup
  }

  fill(230);
  rect(x - 10, y - 40, 20, 3, 2);

  fill(85, 107, 47);
  rect(x - 16, y - 30, 32, 35, 6);

  fill(255, 224, 189);
  ellipse(x - 18, y - 10, 7, 14);
  ellipse(x + 18, y - 10, 7, 14);

  fill(139, 69, 19);
  rect(x - 13, y + 5, 10, 17, 3);
  rect(x + 3, y + 5, 10, 17, 3);
  fill(50);
  rect(x - 13, y + 20, 10, 6, 2);
  rect(x + 7, y + 20, 10, 6, 2);
}
