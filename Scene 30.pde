int frameNum = 0;
int totalFrames = 360; // 6 seconds at 60fps
float time = 0;

void setup() {
  size(800, 450);
  frameRate(60);
}

void draw() {
  time = frameNum / 60.0; // time in seconds
  
  drawOutdoorBackground();
  drawBambooArea();
  drawEgrang(600, 300);
  drawEgrang(640, 300);
  drawEgrangTergeletak(160, 320);
  
  // Jack animation - jumping and enthusiastic
  pushMatrix();
  scale(1.7);
  float jackJump = sin(time * 8) * 15; // Fast jumping motion
  float jackBounce = abs(sin(time * 8)) * 8; // Additional bounce for enthusiasm
  drawJack(165, 200 - jackJump - jackBounce);
  popMatrix();
  
  // Grandfather animation - gentle nodding
  pushMatrix();
  scale(2.0);
  float kakekNod = sin(time * 2) * 3; // Slow gentle nod
  drawKakek(180, 165 + kakekNod);
  popMatrix();
  
  // Save frame
  saveFrame("frames/frame-" + nf(frameNum, 4) + ".png");
  
  frameNum++;
  if (frameNum >= totalFrames) {
    noLoop(); // Stop after 6 seconds
  }
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
  line(x, y, x + 80, y - 10);
  line(x + 20, y + 10, x + 100, y);
  strokeWeight(8);
  line(x + 30, y - 5, x + 50, y - 5);
  line(x + 50, y + 5, x + 70, y + 5);
  noStroke();
}

// Jack with animated expressions
void drawJack(float x, float y) {
  // Add slight head bob for speaking animation
  float headBob = sin(time * 12) * 2;
  
  fill(255, 224, 189); 
  ellipse(x, y - 60 + headBob, 36, 36);
  fill(139, 69, 19); 
  arc(x, y - 65 + headBob, 40, 36, PI, TWO_PI);
  triangle(x - 12, y - 62 + headBob, x - 6, y - 69 + headBob, x - 3, y - 61 + headBob);
  triangle(x - 2, y - 63 + headBob, x + 2, y - 69 + headBob, x + 6, y - 62 + headBob);
  triangle(x + 4, y - 62 + headBob, x + 10, y - 69 + headBob, x + 12, y - 61 + headBob);
  
  // Animated eyes - blinking occasionally
  fill(255); 
  ellipse(x - 7, y - 61 + headBob, 7, 7);
  ellipse(x + 7, y - 61 + headBob, 7, 7);
  fill(0);
  if (frameNum % 180 < 5) { // Blink every 3 seconds
    line(x - 10, y - 61 + headBob, x - 4, y - 61 + headBob);
    line(x + 4, y - 61 + headBob, x + 10, y - 61 + headBob);
  } else {
    ellipse(x - 7, y - 61 + headBob, 3, 3);
    ellipse(x + 7, y - 61 + headBob, 3, 3);
  }
  
  // Animated mouth - opening and closing for speaking
  fill(0);
  float mouthOpen = abs(sin(time * 10)) * 3 + 2;
  ellipse(x, y - 50 + headBob, 6, mouthOpen);
  
  fill(200, 0, 0); // baju
  rect(x - 15, y - 45, 30, 28, 6);
  
  // Arms with slight movement for enthusiasm
  fill(255, 224, 189); 
  float armWave = sin(time * 6) * 3;
  ellipse(x - 18 + armWave, y - 25, 7, 14);
  ellipse(x + 18 - armWave, y - 25, 7, 14);
  
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

// Kakek with nodding animation
void drawKakek(float x, float y) {
  float headNod = sin(time * 2) * 2; // Gentle head nod
  
  fill(255, 224, 189);
  ellipse(x, y - 45 + headNod, 36, 36);
  fill(230);
  arc(x, y - 50 + headNod, 40, 36, PI, TWO_PI);
  ellipse(x - 18, y - 45 + headNod, 5, 5);
  ellipse(x + 18, y - 45 + headNod, 5, 5);
  
  // Gentle smiling eyes
  fill(255);
  ellipse(x - 7, y - 46 + headNod, 6, 6);
  ellipse(x + 7, y - 46 + headNod, 6, 6);
  fill(0);
  
  // Slightly squinting eyes for gentle smile
  float eyeSquint = sin(time * 1.5) * 0.5 + 0.5;
  ellipse(x - 9, y - 46 + headNod + eyeSquint, 2, 2); 
  ellipse(x + 5, y - 46 + headNod + eyeSquint, 2, 2);
  
  // Gentle smile
  stroke(0);
  strokeWeight(1);
  arc(x, y - 35 + headNod, 8, 6, 0, PI);
  noStroke();
  
  fill(230);
  rect(x - 10, y - 40 + headNod, 20, 3, 2);
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
