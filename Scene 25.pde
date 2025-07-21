int totalFrames = 276;
int currentFrame = 0;

void setup() {
  size(800, 450);
  frameRate(60);
}

void draw() {
  background(135, 206, 235);
  drawOutdoorBackground();
  drawBambooArea();
  drawEgrang(600, 300);
  drawEgrang(640, 300);

  pushMatrix();
  scale(1.6);
  drawJack(280, 255, (currentFrame / 10) % 2 == 0); // buka-tutup mulut
  popMatrix();

  pushMatrix();
  scale(2.0);
  drawKakek(180, 165);
  popMatrix();

  saveFrame("frames/frame-####.png");
  currentFrame++;

  if (currentFrame >= totalFrames) {
    noLoop();
  }
}

// Latar
void drawOutdoorBackground() {
  fill(222, 184, 135);
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

// Jack dengan mulut bisa bicara
void drawJack(float x, float y, boolean mouthOpen) {
  stroke(139, 69, 19);
  strokeWeight(5);
  line(x - 18, y - 60, x - 18, y + 60);
  line(x + 18, y - 60, x + 18, y + 60);
  strokeWeight(7);
  line(x - 28, y + 10, x - 8, y + 10);
  line(x + 8, y + 10, x + 28, y + 10);
  noStroke();

  fill(255, 224, 189); 
  ellipse(x, y - 60, 36, 36);

  fill(139, 69, 19); 
  arc(x, y - 65, 40, 36, PI, TWO_PI);
  triangle(x - 12, y - 62, x - 6, y - 69, x - 3, y - 61);
  triangle(x - 2, y - 63, x + 2, y - 69, x + 6, y - 62);
  triangle(x + 4, y - 62, x + 10, y - 69, x + 12, y - 61);

  fill(255);
  ellipse(x - 7, y - 61, 7, 7);
  ellipse(x + 7, y - 61, 7, 7);
  fill(0);
  ellipse(x - 7, y - 61, 3, 3);
  ellipse(x + 7, y - 61, 3, 3);

  // Mulut bicara
  fill(0);
  if (mouthOpen) {
    ellipse(x, y - 48, 6, 10); // terbuka
  } else {
    ellipse(x, y - 50, 6, 4);  // tertutup
  }

  fill(200, 0, 0); 
  rect(x - 15, y - 45, 30, 28, 6);

  fill(255, 224, 189);
  ellipse(x - 18, y - 25, 7, 14);
  ellipse(x + 18, y - 25, 7, 14);

  fill(255, 165, 0); 
  rect(x - 13, y - 17, 10, 20, 3);
  rect(x + 3, y - 17, 10, 20, 3);

  fill(255); 
  rect(x - 13, y + 3, 6, 5);
  rect(x + 7, y + 3, 6, 5);

  fill(90, 60, 40); 
  rect(x - 13, y + 8, 10, 6, 2);
  rect(x + 7, y + 8, 10, 6, 2);
}

// Kakek
void drawKakek(float x, float y) {
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

  stroke(0);
  strokeWeight(1.2);
  arc(x, y - 36, 10, 5, 0, PI);
  noStroke();

  fill(230);
  rect(x - 10, y - 40, 20, 3, 2);

  fill(85, 107, 47); 
  rect(x - 16, y - 30, 32, 35, 6);

  fill(255, 224, 189); 
  ellipse(x - 18, y - 10, 7, 14);
  ellipse(x + 18, y - 14, 7, 14);

  fill(139, 69, 19); 
  rect(x - 13, y + 5, 10, 17, 3);
  rect(x + 3, y + 5, 10, 17, 3);

  fill(50); 
  rect(x - 13, y + 20, 10, 6, 2);
  rect(x + 7, y + 20, 10, 6, 2);
}
