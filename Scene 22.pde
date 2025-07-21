void setup() {
  size(800, 450);
  noLoop();
}

void draw() {
  drawOutdoorBackground();
  drawBambooArea();

  drawEgrang(600, 300);
  drawEgrang(640, 300);

  drawEgrangTergeletak(200, 360);
  drawEgrangTergeletak(240, 370);

  pushMatrix();
  scale(1.7);
  drawJack(145, 245);
  popMatrix();

  pushMatrix();
  scale(2.0);
  drawKakek(180, 165);
  popMatrix();
}

// Latar
void drawOutdoorBackground() {
  background(135, 206, 235); 
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

void drawEgrangTergeletak(float x, float y) {
  stroke(139, 69, 19);
  strokeWeight(6);
  line(x, y, x + 50, y - 10);
  line(x + 10, y + 5, x + 60, y - 5);
  strokeWeight(8);
  line(x + 20, y, x + 40, y); // pijakan
  noStroke();
}

// Jack
void drawJack(float x, float y) {
  // Kepala
  fill(255, 224, 189);
  ellipse(x, y - 45, 36, 36);

  // Rambut
  fill(139, 69, 19);
  arc(x, y - 50, 40, 36, PI, TWO_PI);
  triangle(x - 12, y - 47, x - 6, y - 54, x - 3, y - 46);
  triangle(x - 2, y - 48, x + 2, y - 54, x + 6, y - 47);
  triangle(x + 4, y - 47, x + 10, y - 54, x + 12, y - 46);

  // Mata
  fill(255); 
  ellipse(x - 7, y - 46, 7, 7);
  ellipse(x + 7, y - 46, 7, 7);
  fill(0); 
  ellipse(x - 7, y - 46, 3, 3);
  ellipse(x + 7, y - 46, 3, 3);

  // Mulut
  stroke(0);
  strokeWeight(1);
  line(x - 6, y - 36, x + 6, y - 36);
  noStroke();

  // Baju
  fill(200, 0, 0); 
  rect(x - 15, y - 30, 30, 25, 6);

  // Tangan
  fill(255, 224, 189); 
  ellipse(x - 18, y - 12, 7, 14);
  ellipse(x + 18, y - 12, 7, 14);

  // Celana
  fill(255, 165, 0); 
  rect(x - 13, y + 2, 10, 15, 3);
  rect(x + 3, y + 2, 10, 15, 3);

  // Kaos kaki
  fill(255); 
  rect(x - 13, y + 17, 6, 5);
  rect(x + 7, y + 17, 6, 5);

  // Sepatu
  fill(90, 60, 40); 
  rect(x - 13, y + 22, 10, 6, 2);
  rect(x + 7, y + 22, 10, 6, 2);
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
  ellipse(x - 8, y - 46, 2, 2); 
  ellipse(x + 5, y - 46, 2, 2); 

  stroke(0);
  line(x - 4, y - 36, x + 4, y - 36);
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
