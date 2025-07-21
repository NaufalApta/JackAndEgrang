void setup() {
  size(800, 450);
  noLoop();
}

void draw() {
  drawIpadWithHands();
}

void drawIpadWithHands() {
  background(60);

  // iPad
  fill(30);
  rect(150, 50, 500, 350, 30);

  // Refleksi layar
  fill(255, 255, 255, 25);
  beginShape();
  vertex(150, 50);
  vertex(650, 50);
  vertex(650, 110);
  vertex(150, 160);
  endShape(CLOSE);

  // Teks "No Signal"
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(50);
  text("No Signal", width / 2, height / 2);

  // Ikon sinyal kecil
  drawSignalIcon(620, 340);

  // Tangan kiri & kanan memegang bawah iPad
  drawHandLeft(165, 390);  // tangan kiri
  drawHandRight(635, 390); // tangan kanan
}

// Tangan kiri
void drawHandLeft(float x, float y) {
  fill(255, 224, 189); // warna kulit

  // Telapak
  ellipse(x, y, 40, 50);

  // Jari-jari melengkung
  ellipse(x - 18, y - 10, 10, 20);
  ellipse(x - 8, y - 12, 10, 22);
  ellipse(x + 2, y - 12, 10, 22);
  ellipse(x + 12, y - 10, 10, 20);

  // Ibu jari
  ellipse(x - 25, y + 5, 12, 16);
}

// Tangan kanan
void drawHandRight(float x, float y) {
  fill(255, 224, 189);

  // Telapak
  ellipse(x, y, 40, 50);

  // Jari-jari melengkung
  ellipse(x - 12, y - 10, 10, 20);
  ellipse(x - 2, y - 12, 10, 22);
  ellipse(x + 8, y - 12, 10, 22);
  ellipse(x + 18, y - 10, 10, 20);

  // Ibu jari
  ellipse(x + 25, y + 5, 12, 16);
}

// Ikon sinyal
void drawSignalIcon(float x, float y) {
  stroke(255);
  strokeWeight(3);
  noFill();
  for (int i = 0; i < 3; i++) {
    arc(x, y, 10 + i * 10, 10 + i * 10, -HALF_PI, 0);
  }
  noStroke();
}
