float jackX = 300;               
float jackTargetX = 440;        
int totalFrames = 180;           
int currentFrame = 0;

void setup() {
  size(800, 450);
  frameRate(60);
}

void draw() {
  drawSky();
  drawMountains();
  drawFields();
  drawRoad();
  drawHouse(300, 230);
  drawCar(120, 340);

  float progress = map(currentFrame, 0, totalFrames, 0, 1);
  float jackNowX = lerp(jackX, jackTargetX, progress);
  drawJack(jackNowX, 345);

  currentFrame++;
  if (currentFrame >= totalFrames) {
    noLoop(); // 
  }
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

// Rumah dengan pintu terbuka
void drawHouse(float x, float y) {
  fill(210, 180, 140);
  rect(x, y, 200, 100);
  fill(139, 69, 19);
  triangle(x - 20, y, x + 100, y - 80, x + 220, y);
  triangle(x + 20, y, x + 100, y - 60, x + 180, y);
  fill(255, 236, 179);
  rect(x + 85, y + 30, 30, 70);
  noFill();
  stroke(120, 72, 40);
  strokeWeight(3);
  rect(x + 85, y + 30, 30, 70);
  noStroke();
  fill(160, 82, 45);
  quad(x + 85, y + 30, x + 93, y + 25, x + 93, y + 95, x + 85, y + 100);
  fill(255, 215, 0);
  ellipse(x + 91, y + 65, 5, 5);
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
  fill(255, 224, 189);
  ellipse(x, y - 45, 36, 36);
  fill(139, 69, 19);
  beginShape();
  vertex(x - 18, y - 45);
  bezierVertex(x - 20, y - 65, x + 20, y - 65, x + 18, y - 45);
  bezierVertex(x + 18, y - 40, x - 18, y - 40, x - 18, y - 45);
  endShape(CLOSE);
  rect(x - 5, y - 30, 10, 5);
  fill(200, 0, 0);
  rect(x - 15, y - 25, 30, 28, 6);
  fill(255, 224, 189);
  ellipse(x - 17, y - 5, 6, 14);
  pushMatrix();
  translate(x + 17, y - 10);
  rotate(radians(-40));
  ellipse(0, 0, 6, 14);
  popMatrix();
  fill(255, 165, 0);
  rect(x - 13, y + 2, 10, 18, 3);
  rect(x + 3, y + 2, 10, 18, 3);
  fill(255);
  rect(x - 13, y + 20, 6, 5);
  rect(x + 7, y + 20, 6, 5);
  fill(90, 60, 40);
  rect(x - 13, y + 25, 10, 6, 2);
  rect(x + 7, y + 25, 10, 6, 2);
}
