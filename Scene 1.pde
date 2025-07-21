float carX = -100;

void setup() {
  size(800, 450);
  frameRate(60);
}

void draw() {
  drawSky();
  drawMountains();
  drawFields();
  drawRoad();
  drawHouse(100, 260);
  drawHouse(600, 270);
  drawCar(carX, 340);

  carX += 2;

  if (carX > width + 100) {
    noLoop();
  }
}

void drawSky() {
  background(135, 206, 235);
}

void drawMountains() {
  fill(100, 155, 100);
  noStroke();
  triangle(100, 300, 300, 100, 500, 300);
  triangle(400, 300, 600, 130, 800, 300);
}

void drawFields() {
  fill(144, 238, 144);
  rect(0, 300, width, 150);
}

void drawRoad() {
  fill(60);
  rect(0, 380, width, 70);
  stroke(255);
  for (int i = 0; i < width; i += 40) {
    line(i, 415, i + 20, 415);
  }
}

void drawHouse(float x, float y) {
  fill(210, 180, 140); // Warna dinding
  rect(x, y, 100, 70);
  fill(139, 69, 19); // Warna atap
  triangle(x - 10, y, x + 50, y - 50, x + 110, y);
}

void drawCar(float x, float y) {
  fill(255, 0, 0);
  rect(x, y, 100, 40, 10); // Badan mobil
  fill(0);
  ellipse(x + 20, y + 40, 20, 20); // Roda depan
  ellipse(x + 80, y + 40, 20, 20); // Roda belakang
  fill(255);
  rect(x + 20, y + 5, 25, 20); // Jendela depan
  rect(x + 55, y + 5, 25, 20); // Jendela belakang
}
