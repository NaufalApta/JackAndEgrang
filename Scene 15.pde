int totalFrames = 360;
int currentFrame = 0;

void setup() {
  size(800, 450);
  frameRate(60);
}

void draw() {
  drawWall();

  float jackX = lerp(-100, 360, currentFrame / float(totalFrames));
  float kakekX = lerp(-150, 340, currentFrame / float(totalFrames));

  pushMatrix();
  scale(2.0);
  drawKakek(kakekX / 2.0, 165);
  popMatrix();

  pushMatrix();
  scale(1.8);
  drawJack(jackX / 1.8, 220);
  popMatrix();

  currentFrame++;
  if (currentFrame >= totalFrames) {
    noLoop();
  }
}


void drawWall() {
  background(245, 222, 179); 
  fill(160, 82, 45);         
  rect(0, 300, width, 150);

  fill(139, 69, 19);
  rect(340, 140, 120, 180);   

  fill(100);
  ellipse(445, 230, 6, 6);
}

// Jack
void drawJack(float x, float y) {
  fill(255, 224, 189); // Kepala
  ellipse(x, y - 45, 36, 36);

  fill(139, 69, 19); // Rambut
  arc(x, y - 50, 40, 36, PI, TWO_PI);
  triangle(x - 12, y - 47, x - 6, y - 54, x - 3, y - 46);
  triangle(x - 2, y - 48, x + 2, y - 54, x + 6, y - 47);
  triangle(x + 4, y - 47, x + 10, y - 54, x + 12, y - 46);

  fill(255); // Mata
  ellipse(x - 7, y - 46, 7, 7);
  ellipse(x + 7, y - 46, 7, 7);
  fill(0);
  ellipse(x - 7, y - 46, 3, 3);
  ellipse(x + 7, y - 46, 3, 3);

  stroke(0); // Mulut
  line(x - 5, y - 36, x + 5, y - 36);
  noStroke();

  fill(200, 0, 0); // Baju
  rect(x - 15, y - 30, 30, 28, 6);

  fill(255, 224, 189); // Tangan
  ellipse(x - 16, y - 10, 7, 14);
  ellipse(x + 16, y - 10, 7, 14);

  fill(255, 165, 0); // Celana
  rect(x - 13, y - 2, 10, 18, 3);
  rect(x + 3, y - 2, 10, 18, 3);

  fill(255); // Kaos kaki
  rect(x - 13, y + 16, 6, 5);
  rect(x + 7, y + 16, 6, 5);
  fill(90, 60, 40); // Sepatu
  rect(x - 13, y + 21, 10, 6, 2);
  rect(x + 7, y + 21, 10, 6, 2);
}

// Kakek
void drawKakek(float x, float y) {
  fill(255, 224, 189); // Kepala
  ellipse(x, y - 45, 36, 36); 

  fill(230); // Rambut
  arc(x, y - 50, 40, 36, PI, TWO_PI);
  ellipse(x - 18, y - 45, 5, 5);
  ellipse(x + 18, y - 45, 5, 5);

  fill(255); // Mata
  ellipse(x - 7, y - 46, 6, 6);
  ellipse(x + 7, y - 46, 6, 6);
  fill(0);
  ellipse(x - 5, y - 46, 2, 2);
  ellipse(x + 9, y - 46, 2, 2);

  noFill(); // Senyum
  stroke(0);
  arc(x, y - 36, 10, 5, 0, PI);
  noStroke();

  fill(230); // Kumis
  rect(x - 10, y - 40, 20, 3, 2);

  fill(85, 107, 47); // Baju
  rect(x - 16, y - 30, 32, 35, 6);

  fill(255, 224, 189); // Tangan
  ellipse(x - 18, y - 10, 7, 14);
  ellipse(x + 18, y - 10, 7, 14);

  fill(139, 69, 19); // Celana
  rect(x - 13, y + 5, 10, 17, 3);
  rect(x + 3, y + 5, 10, 17, 3);
  fill(50); // Sepatu
  rect(x - 13, y + 20, 10, 6, 2);
  rect(x + 7, y + 20, 10, 6, 2);
}
