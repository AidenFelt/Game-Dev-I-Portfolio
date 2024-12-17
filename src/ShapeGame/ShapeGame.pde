// Aiden Felt | Shape Game | 3rd Sept 2024
import processing.sound.*;
SoundFile collide;
int x, y, score, tx, ty, tw, speed, shapeDist;
PImage bg1, user1, bg2, t1;

void setup() { //runs once at start
  size(720, 360);
  background(255, 255, 0);
  collide = new SoundFile(this, "laser.wav");
  //bg1 = loadImage("PImage.jpg");
  user1 = loadImage("user1.png");
  bg2 = loadImage("bg2.jpeg");
  t1 = loadImage("Alienp.png");
  x = 100;
  y = 100;
  score = 0;
  tx = width/2;
  ty = height/2;
  tw = 50;
  speed = 0;
  shapeDist = 0;
}

void draw() { //runs on a 30 fps loop
  shapeDist = int(dist(x, y, tx, ty)<10+tw/2);
  println(shapeDist);
  frameRate(speed + 20);
  background(bg2);
  target();

  fill(111, 0, 16);
  stroke(100);
  //ellipse(x, y, 20, 20);
  imageMode(CENTER);
  image(user1, x, y);
  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      y = y - 10;
    } else if (key == 's' || key == 'S') {
      y = y + 10;
    } else if (key == 'a' || key == 'A') {
      x = x - 10;
    } else if (key == 'd' || key == 'D') {
      x = x + 10;
    }
  }
  score();
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      y = y - 10;
    } else if (keyCode == DOWN) {
      y = y + 10;
    } else if (keyCode == RIGHT) {
      x = x + 10;
    } else if (keyCode == LEFT) {
      x = x - 10;
    }
  }
}

void score() {
  rectMode(CENTER);
  fill(128, 128);
  rect(width/2, 20, width, 40);
  fill(0);
  textSize(30);
  text("Score:" + score, 20, 30);
  if (dist(x, y, tx, ty)<10+tw/2) {
    collide.play();
    tx = int(random(width));
    ty = int(random(height));
    score = score  + 10;
    tw = 100;
    speed = speed + 1;
  }
}

void target() {

  fill(20, 222, 23);
  t1 = loadImage("Alienp.png");
  t1.resize(tw,tw);
  image(t1,tx,ty);
  
  tw = tw - 1;
  if (tw < 1) {
    gameOver ();
  }
}

void gameOver () {
  background(0);
  fill(255);
  text("Game Over", width/2, height/2);
  noLoop();
}
