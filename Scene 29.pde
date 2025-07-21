int frameNum = 0;
int totalFrames = 246; // 4.1 seconds at 60fps
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
  
  // Jack animation - moving around on stilts
  float jackSway = sin(time * 3) * 8; // Side to side movement
  float jackBob = sin(time * 4) * 4; // Up and down bobbing
  
  // Shadow follows Jack's movement
  drawShadow((140 * 1.6) + jackSway, (270 * 1.6) + jackBob * 0.3);
  
  pushMatrix();
  scale(1.6);
  drawJack(140 + jackSway/1.6, 230 + jackBob/1.6);
  popMatrix();
  
  // Grandfather animation - clapping and talking
  pushMatrix();
  scale(2.0);
  drawKakek(180, 165);
  popMatrix();
  
  // Save frame
  saveFrame("frames/frame-" + nf(frameNum, 4) + ".png");
  
  frameNum++;
  if (frameNum >= totalFrames) {
    noLoop(); // Stop after 4.1 seconds
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

void drawShadow(float x, float y) {
  fill(0, 0, 0, 40);
  ellipse(x, y + 40, 50, 14);
}

// Jack with stilt movement animation
void drawJack(float x, float y) {
  // Stilt animation - slight sway and balance movements
  float stiltSway = sin(time * 3.5) * 2;
  float stiltBalance = cos(time * 2.8) * 1.5;
  
  stroke(139, 69, 19);
  strokeWeight(6);
  line(x - 18 + stiltSway, y - 60, x - 18 + stiltSway, y + 40);
  line(x + 18 + stiltBalance, y - 60, x + 18 + stiltBalance, y + 40);
  strokeWeight(8);
  line(x - 28 + stiltSway, y + 10, x - 8 + stiltSway, y + 10);
  line(x + 8 + stiltBalance, y + 10, x + 28 + stiltBalance, y + 10);
  noStroke();
  
  // Body movement for balance
  float bodyLean = sin(time * 3) * 3;
  
  fill(255, 224, 189);
  ellipse(x + bodyLean, y - 60, 36, 36);
  fill(139, 69, 19);
  arc(x + bodyLean, y - 65, 40, 36, PI, TWO_PI);
  triangle(x - 12 + bodyLean, y - 62, x - 6 + bodyLean, y - 69, x - 3 + bodyLean, y - 61);
  triangle(x - 2 + bodyLean, y - 63, x + 2 + bodyLean, y - 69, x + 6 + bodyLean, y - 62);
  triangle(x + 4 + bodyLean, y - 62, x + 10 + bodyLean, y - 69, x + 12 + bodyLean, y - 61);
  
  // Concentrated/focused eyes while balancing
  stroke(0);
  strokeWeight(2);
  noFill();
  arc(x - 7 + bodyLean, y - 61, 8, 5, PI, TWO_PI);
  arc(x + 7 + bodyLean, y - 61, 8, 5, PI, TWO_PI);
  noStroke();
  
  // Slight smile of concentration
  fill(0);
  ellipse(x + bodyLean, y - 48, 10, 6);
  
  fill(200, 0, 0);
  rect(x - 15 + bodyLean, y - 45, 30, 28, 6);
  
  // Arms moving for balance
  float armBalance1 = sin(time * 3.2) * 4;
  float armBalance2 = cos(time * 2.9) * 3;
  
  fill(255, 224, 189);
  ellipse(x - 22 + bodyLean + armBalance1, y - 30, 7, 14);
  ellipse(x + 22 + bodyLean + armBalance2, y - 30, 7, 14);
  
  fill(255, 165, 0);
  rect(x - 13 + bodyLean, y - 17, 10, 20, 3);
  rect(x + 3 + bodyLean, y - 17, 10, 20, 3);
  fill(255);
  rect(x - 13 + bodyLean, y + 3, 6, 5);
  rect(x + 7 + bodyLean, y + 3, 6, 5);
  fill(90, 60, 40);
  rect(x - 13 + bodyLean, y + 8, 10, 6, 2);
  rect(x + 7 + bodyLean, y + 8, 10, 6, 2);
}

// Kakek with clapping and talking animation
void drawKakek(float x, float y) {
  // Head movement for talking
  float headBob = sin(time * 8) * 1.5;
  
  fill(255, 224, 189);
  ellipse(x, y - 45 + headBob, 36, 36);
  fill(230);
  arc(x, y - 50 + headBob, 40, 36, PI, TWO_PI);
  ellipse(x - 18, y - 45 + headBob, 5, 5);
  ellipse(x + 18, y - 45 + headBob, 5, 5);
  
  // Happy, animated eyes
  fill(255);
  ellipse(x - 7, y - 46 + headBob, 6, 6);
  ellipse(x + 7, y - 46 + headBob, 6, 6);
  fill(0);
  
  // Blinking animation
  if (frameNum % 120 < 4) { // Blink every 2 seconds
    line(x - 10, y - 46 + headBob, x - 4, y - 46 + headBob);
    line(x + 4, y - 46 + headBob, x + 10, y - 46 + headBob);
  } else {
    ellipse(x - 9, y - 46 + headBob, 2, 2);  
    ellipse(x + 5, y - 46 + headBob, 2, 2);
  }
  
  // Animated talking mouth
  stroke(0);
  float mouthTalk = abs(sin(time * 12)) * 3 + 2;
  arc(x, y - 36 + headBob, 10, mouthTalk, 0, PI);
  noStroke();
  
  fill(230);
  rect(x - 10, y - 40 + headBob, 20, 3, 2);
  fill(85, 107, 47);
  rect(x - 16, y - 30, 32, 35, 6);
  
  // Clapping arms animation
  float clapCycle = sin(time * 6); // 6 claps per second
  float armAngle = clapCycle * 30; // Degrees of arm movement
  
  // Left arm clapping
  pushMatrix();
  translate(x - 8, y - 5);
  rotate(radians(-armAngle));
  fill(255, 224, 189);
  ellipse(0, 0, 7, 14);
  popMatrix();
  
  // Right arm clapping
  pushMatrix();
  translate(x + 8, y - 5);
  rotate(radians(armAngle));
  fill(255, 224, 189);
  ellipse(0, 0, 7, 14);
  popMatrix();
  
  fill(139, 69, 19);
  rect(x - 10, y + 5, 10, 17, 3);
  rect(x + 0, y + 5, 10, 17, 3);
  fill(50);
  rect(x - 10, y + 20, 10, 6, 2);
  rect(x + 0, y + 20, 10, 6, 2);
}
