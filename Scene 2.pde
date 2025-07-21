void setup() {
  size(800, 450);
  noLoop();
}

void draw() {
  drawSky();
  drawMountains();
  drawFields();
  drawRoad();
  drawHouse(300, 230);
  drawCar(120, 340);     
  drawJack(310, 345);
}

// Langit
void drawSky() {
  background(135, 206, 235);
}

// Pegunungan
void drawMountains() {
  fill(100, 155, 100);
  noStroke();
  triangle(100, 300, 300, 100, 500, 300);
  triangle(400, 300, 600, 130, 800, 300);
}

// Sawah
void drawFields() {
  fill(144, 238, 144);
  rect(0, 300, width, 150);
}

// Jalan
void drawRoad() {
  fill(60);
  rect(0, 380, width, 70);
  stroke(255);
  for (int i = 0; i < width; i += 40) {
    line(i, 415, i + 20, 415);
  }
}

// Rumah
void drawHouse(float x, float y) {
  fill(210, 180, 140);
  rect(x, y, 200, 100);

  fill(139, 69, 19);
  triangle(x - 20, y, x + 100, y - 80, x + 220, y);
  triangle(x + 20, y, x + 100, y - 60, x + 180, y);

  // Pintu tertutup
  fill(160, 82, 45);
  rect(x + 85, y + 30, 30, 70);
}

// Mobil 
void drawCar(float x, float y) {
  fill(255, 0, 0);
  rect(x, y, 160, 60, 15);

  fill(0);
  ellipse(x + 30, y + 60, 30, 30); 
  ellipse(x + 130, y + 60, 30, 30); 

  fill(255);
  rect(x + 25, y + 10, 40, 30); 
  rect(x + 95, y + 10, 30, 30); 
}

// Jack 
void drawJack(float x, float y) {
  // Kepala
  fill(255, 224, 189); // Warna kulit
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

  // Senyum
  noFill();
  stroke(0);
  strokeWeight(1);
  arc(x, y - 36, 14, 8, 0, PI);
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
