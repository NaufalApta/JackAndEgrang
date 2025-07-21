int frameNum = 0;
int totalFrames = 228; // 3.8 seconds at 60fps
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
  
  // Jack's celebratory jumping animation
  float jumpHeight = abs(sin(time * 6)) * 25; // High energetic jumps
  float celebrationBounce = abs(sin(time * 8)) * 8; // Extra bounce for excitement
  float totalJump = jumpHeight + celebrationBounce;
  
  // Shadow animation - gets smaller when jumping higher
  float shadowScale = 1.0 - (totalJump / 80.0); // Shadow shrinks when higher
  drawShadowAnimated((140 * 1.6), (270 * 1.6), shadowScale);
  
  pushMatrix();
  scale(1.6);
  drawJack(140, 230 - totalJump/1.6);
  popMatrix();
  
  // Grandfather's excited nodding and smiling
  pushMatrix();
  scale(2.0);
  drawKakek(180, 165);
  popMatrix();
  
  // Save frame
  saveFrame("frames/frame-" + nf(frameNum, 4) + ".png");
  
  frameNum++;
  if (frameNum >= totalFrames) {
    noLoop(); // Stop after 3.8 seconds
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

// Animated shadow that changes with jump height
void drawShadowAnimated(float x, float y, float scale) {
  fill(0, 0, 0, 40);
  ellipse(x, y + 40, 50 * scale, 14 * scale);
}

// Regular shadow function for compatibility
void drawShadow(float x, float y) {
  drawShadowAnimated(x, y, 1.0);
}

// Jack with celebratory jumping animation
void drawJack(float x, float y) {
  // Egrang animation - stilts move slightly with celebration
  float stiltCelebration = sin(time * 7) * 1.5;
  
  stroke(139, 69, 19);
  strokeWeight(6);
  line(x - 18 + stiltCelebration, y - 60, x - 18 + stiltCelebration, y + 40); // kiri
  line(x + 18 - stiltCelebration, y - 60, x + 18 - stiltCelebration, y + 40); // kanan
  strokeWeight(8);
  line(x - 28 + stiltCelebration, y + 10, x - 8 + stiltCelebration, y + 10);  // pijakan kiri
  line(x + 8 - stiltCelebration, y + 10, x + 28 - stiltCelebration, y + 10);  // pijakan kanan
  noStroke();
  
  // Head with celebration movement
  float headCelebration = sin(time * 8) * 2;
  
  // Kepala
  fill(255, 224, 189);
  ellipse(x + headCelebration, y - 60, 36, 36);
  
  // Rambut - bouncing with movement
  fill(139, 69, 19);
  arc(x + headCelebration, y - 65, 40, 36, PI, TWO_PI);
  triangle(x - 12 + headCelebration, y - 62, x - 6 + headCelebration, y - 69, x - 3 + headCelebration, y - 61);
  triangle(x - 2 + headCelebration, y - 63, x + 2 + headCelebration, y - 69, x + 6 + headCelebration, y - 62);
  triangle(x + 4 + headCelebration, y - 62, x + 10 + headCelebration, y - 69, x + 12 + headCelebration, y - 61);
  
  // Mata - happy closed eyes from joy
  stroke(0);
  strokeWeight(2);
  // Happy closed eyes - upward curved lines showing cheerful expression
  arc(x - 7 + headCelebration, y - 61, 10, 6, PI, TWO_PI);
  arc(x + 7 + headCelebration, y - 61, 10, 6, PI, TWO_PI);
  noStroke();
  
  // Mulut - animated mouth for cheering "Huzzah!"
  fill(0);
  float mouthAnimation = abs(sin(time * 15)) * 8 + 8; // Fast mouth movement for speaking
  ellipse(x + headCelebration, y - 48, 18, mouthAnimation);
  
  // Baju
  fill(200, 0, 0);
  rect(x - 15 + headCelebration, y - 45, 30, 28, 6);
  
  // Tangan - arms raised in celebration
  float armCelebration1 = sin(time * 7) * 8;
  float armCelebration2 = cos(time * 6) * 6;
  
  fill(255, 224, 189);
  ellipse(x - 22 + headCelebration + armCelebration1, y - 35, 7, 14); // Left arm higher
  ellipse(x + 22 + headCelebration + armCelebration2, y - 32, 7, 14); // Right arm celebrating
  
  // Celana
  fill(255, 165, 0);
  rect(x - 13 + headCelebration, y - 17, 10, 20, 3);
  rect(x + 3 + headCelebration, y - 17, 10, 20, 3);
  
  // Kaos kaki
  fill(255);
  rect(x - 13 + headCelebration, y + 3, 6, 5);
  rect(x + 7 + headCelebration, y + 3, 6, 5);
  
  // Sepatu
  fill(90, 60, 40);
  rect(x - 13 + headCelebration, y + 8, 10, 6, 2);
  rect(x + 7 + headCelebration, y + 8, 10, 6, 2);
}

// Kakek with excited nodding and smiling
void drawKakek(float x, float y) {
  // Excited nodding - more pronounced than before
  float excitedNod = sin(time * 5) * 4;
  float headBob = sin(time * 8) * 2; // Additional head movement
  
  fill(255, 224, 189);
  ellipse(x, y - 45 + excitedNod + headBob, 36, 36);
  
  fill(230);
  arc(x, y - 50 + excitedNod + headBob, 40, 36, PI, TWO_PI);
  ellipse(x - 18, y - 45 + excitedNod + headBob, 5, 5);
  ellipse(x + 18, y - 45 + excitedNod + headBob, 5, 5);
  
  // Very happy, excited eyes
  fill(255);
  ellipse(x - 7, y - 46 + excitedNod + headBob, 8, 8);
  ellipse(x + 7, y - 46 + excitedNod + headBob, 8, 8);
  fill(0);
  
  // Eyes sparkling with joy - slightly squinted from big smile
  float eyeJoy = sin(time * 6) * 0.5;
  ellipse(x - 8, y - 46 + excitedNod + headBob + eyeJoy, 3, 3);
  ellipse(x + 6, y - 46 + excitedNod + headBob + eyeJoy, 3, 3);
  
  // Big excited smile
  fill(0);
  arc(x, y - 36 + excitedNod + headBob, 16, 12, 0, PI);
  
  fill(230);
  rect(x - 10, y - 40 + excitedNod + headBob, 20, 3, 2);
  fill(85, 107, 47);
  rect(x - 16, y - 30, 32, 35, 6);
  
  // Arms showing excitement - slight movement
  float armExcitement = sin(time * 4) * 2;
  fill(255, 224, 189);
  ellipse(x - 18 + armExcitement, y - 10, 7, 14);
  ellipse(x + 18 - armExcitement, y - 14, 7, 14);
  
  fill(139, 69, 19);
  rect(x - 13, y + 5, 10, 17, 3);
  rect(x + 3, y + 5, 10, 17, 3);
  fill(50);
  rect(x - 13, y + 20, 10, 6, 2);
  rect(x + 7, y + 20, 10, 6, 2);
}
