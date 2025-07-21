void setup() {
  size(800, 450);
  noLoop();
}

void draw() {
  drawInterior();
  drawWindow(550, 100);
  drawTable(160, 270);
  drawBookshelf(50, 240);
  drawPainting(250, 100);

  // Jack
  pushMatrix();
  scale(2.2);
  drawJack(197, 193);
  popMatrix();
}

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
  rect(x - 15, y - 30, 30, 28, 6);

  // Tangan
  fill(255, 224, 189);
  ellipse(x - 16, y - 10, 7, 14);
  ellipse(x + 16, y - 10, 7, 14);

  // Celana
  fill(255, 165, 0);
  rect(x - 13, y - 2, 10, 18, 3);
  rect(x + 3, y - 2, 10, 18, 3);

  // Kaos kaki
  fill(255);
  rect(x - 13, y + 16, 6, 5);
  rect(x + 7, y + 16, 6, 5);

  // Sepatu
  fill(90, 60, 40);
  rect(x - 13, y + 21, 10, 6, 2);
  rect(x + 7, y + 21, 10, 6, 2);
}

void drawInterior() {
  background(245, 222, 179); 
  fill(205, 133, 63);        
  rect(0, 300, width, 150);
  stroke(180, 100, 50);
  for (int i = 0; i < width; i += 40) {
    line(i, 300, i, height);
  }
  noStroke();
}

void drawWindow(float x, float y) {
  fill(173, 216, 230);
  rect(x, y, 100, 100);
  stroke(139, 69, 19);
  strokeWeight(4);
  line(x + 50, y, x + 50, y + 100);
  line(x, y + 50, x + 100, y + 50);
  noStroke();
}

void drawTable(float x, float y) {
  fill(160, 82, 45);
  rect(x, y, 120, 20);
  rect(x + 10, y + 20, 10, 30);
  rect(x + 100, y + 20, 10, 30);
  fill(255);
  ellipse(x + 60, y - 10, 20, 30);
  fill(255, 0, 0);
  ellipse(x + 60, y - 25, 10, 10);
}

void drawBookshelf(float x, float y) {
  fill(139, 69, 19);
  rect(x, y, 60, 100);
  fill(255, 215, 0);
  rect(x + 5, y + 10, 50, 10);
  fill(100, 149, 237);
  rect(x + 5, y + 30, 50, 10);
  fill(34, 139, 34);
  rect(x + 5, y + 50, 50, 10);
}

void drawPainting(float x, float y) {
  fill(255);
  rect(x, y, 80, 60);
  stroke(139, 69, 19);
  strokeWeight(4);
  rect(x - 2, y - 2, 84, 64);
  noStroke();
  fill(255, 215, 0);
  ellipse(x + 20, y + 20, 20, 20);
  fill(100, 155, 100);
  triangle(x + 10, y + 50, x + 30, y + 25, x + 50, y + 50);
}
